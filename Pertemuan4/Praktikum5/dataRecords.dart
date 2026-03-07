void main() {
  var record = ('first', a: 2, b: true, 'last');
  print("Record asli: $record");

  var recordTukar = tukar((10, 20));
  print("Record setelah ditukar: $recordTukar");

  (String, int) mahasiswa = ('Yosep Bima Aprillian', 244107060027);
  print("\nMahasiswa: $mahasiswa");
  print("Nama: ${mahasiswa.$1}");
  print("NIM: ${mahasiswa.$2}");

  var mahasiswa2 = ('Yosep Bima Aprillian', a: 2, b: true, 244107060027);

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}