import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'filter_selector.dart';

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);
  late CameraController _cameraController;
  late Future<void> _initializeCameraFuture;
  XFile? _capturedImage;
  bool _showCapturedImage = false;

  @override
  void initState() {
    super.initState();
    _initializeCameraFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      
      _cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );
      
      await _cameraController.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            height: 200,
            child: _buildFilterSelector(),
          ),
          Positioned(
            bottom: 220,
            right: 20,
            child: _buildCaptureButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    if (_showCapturedImage && _capturedImage != null) {
      return ValueListenableBuilder(
        valueListenable: _filterColor,
        builder: (context, color, child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              color.withOpacity(0.3),
              BlendMode.color,
            ),
            child: Image.file(
              File(_capturedImage!.path),
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }

    return FutureBuilder<void>(
      future: _initializeCameraFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder(
            valueListenable: _filterColor,
            builder: (context, color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color.withOpacity(0.3),
                  BlendMode.color,
                ),
                child: CameraPreview(_cameraController),
              );
            },
          );
        } else {
          return Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }

  Widget _buildCaptureButton() {
    if (_showCapturedImage) {
      return FloatingActionButton(
        onPressed: _retakePhoto,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.refresh, color: Colors.white),
      );
    }

    return FloatingActionButton(
      onPressed: _capturePhoto,
      backgroundColor: Colors.white,
      child: const Icon(Icons.camera_alt, color: Colors.black),
    );
  }

  Future<void> _capturePhoto() async {
    try {
      final image = await _cameraController.takePicture();
      setState(() {
        _capturedImage = image;
        _showCapturedImage = true;
      });
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }

  void _retakePhoto() {
    setState(() {
      _showCapturedImage = false;
      _capturedImage = null;
    });
  }
}
