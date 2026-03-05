void main() {
  final List<dynamic> list = List<dynamic>.filled(5, null, growable: false);

  list[1] = "Yosep Bima Aprillian";
  list[2] = "244107060027";

  print(list);
  print("${list[1]}");
  print("${list[2]}");
}