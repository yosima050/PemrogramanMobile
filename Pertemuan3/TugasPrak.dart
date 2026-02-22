void main() {
  int jumlahPrima = 0;

  for (int i = 0; i <= 201; i++) {
    int hasil = cekBilanganPrima(i);
    
    if (hasil == 1) {
      jumlahPrima++;
      print('Bilangan Prima ke-$jumlahPrima: $i');
      print('Nama: Yosep Bima Aprillian');
      print('NIM: 244107060027');
      print('---');
    }
  }

  print('\n===========================================');
  print('Total Bilangan Prima yang Ditemukan: $jumlahPrima');
  print('===========================================');
}

int cekBilanganPrima(int angka) {
  if (angka < 2) {
    return 0;
  }

  if (angka == 2) {
    return 1;
  }

  if (angka % 2 == 0) {
    return 0;
  }

  for (int i = 3; i * i <= angka; i += 2) {
    if (angka % i == 0) {
      return 0;
    }
  }

  return 1;
}