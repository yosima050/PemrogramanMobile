import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const CombinedPertemuan5App());

class CombinedPertemuan5App extends StatelessWidget {
  const CombinedPertemuan5App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CombinedAppState(),
      child: MaterialApp(
        title: 'Combined Pertemuan 5',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        ),
        home: const CombinedHomePage(),
      ),
    );
  }
}

class CombinedAppState extends ChangeNotifier {
  WordPair current = WordPair.random();
  final List<WordPair> favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class CombinedHomePage extends StatefulWidget {
  const CombinedHomePage({super.key});

  @override
  State<CombinedHomePage> createState() => _CombinedHomePageState();
}

class _CombinedHomePageState extends State<CombinedHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const DatePickerPage();
        break;
      case 3:
        page = const BasicWidgetsPage();
        break;
      default:
        page = const GeneratorPage();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(title: const Text('Combined Pertemuan 5')),
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 720,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Generator'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.date_range),
                      label: Text('Date Picker'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.widgets),
                      label: Text('Basic Widgets'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<CombinedAppState>();
    final pair = appState.current;
    final icon = appState.favorites.contains(pair)
        ? Icons.favorite
        : Icons.favorite_border;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: appState.toggleFavorite,
                icon: Icon(icon),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: appState.getNext,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: '${pair.first} ${pair.second}',
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<CombinedAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites:'),
        ),
        for (final pair in appState.favorites)
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(selectedDate.toLocal().toString().split(' ')[0]),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectDate,
            child: const Text('Pilih Tanggal'),
          ),
        ],
      ),
    );
  }
}

class BasicWidgetsPage extends StatefulWidget {
  const BasicWidgetsPage({super.key});

  @override
  State<BasicWidgetsPage> createState() => _BasicWidgetsPageState();
}

class _BasicWidgetsPageState extends State<BasicWidgetsPage> {
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            likeCount++;
          });
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.thumb_up),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Nama saya Yosep Bima Aprillian, sedang belajar Pemrograman Mobile',
                style: TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/logo_polinema.png',
                height: 120,
                errorBuilder: (context, error, stackTrace) => const Text(
                  'Gambar tidak ditemukan',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                child: const Text('Contoh button'),
                onPressed: () {},
              ),
              const CupertinoActivityIndicator(),
              const SizedBox(height: 20),
              Text('Total likes FAB: $likeCount'),
            ],
          ),
        ),
      ),
    );
  }
}
