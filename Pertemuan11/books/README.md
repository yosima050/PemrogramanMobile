# #11 | Pemrograman Asynchronous

## Identitas Mahasiswa

| Keterangan | Detail |
| :--- | :--- |
| **Nama** | Yosep Bima Aprillian |
| **NIM** | 244107060027 |
| **Kelas** | SIB-2D |

---

# Praktikum 1: Mengunduh Data dari Web Service (API)

## Langkah 1: Buat Project Baru
> **Soal 1**
> Tambahkan **nama panggilan Anda** pada `title` app sebagai identitas hasil pekerjaan Anda.
![](images/01.png)

## Langkah 2: Cek file pubspec.yaml
![](images/02.png)

## Langkah 3: Buka file main.dart
![](images/03.png)

## Langkah 4: Tambah method getData()
> **Soal 2**
>
> - Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
![](images/04.png)
![](images/05.png)
> - Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan _capture_ milik Anda dan tulis di `README` pada laporan praktikum. Lalu lakukan commit dengan pesan "**W11: Soal 2**".
![](images/06.png)

## Langkah 5: Tambah kode di ElevatedButton
![](images/07.png)
### Hasil
![](images/08.png)
> **Soal 3**
> - Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!
- `substring()`: digunakan untuk mengambil sebagian kecil string berdasarkan indeks awal dan akhir yang diberikan. Pada kode tersebut, digunakan untuk mengambil 450 karakter pertama dari string yang dikembalikan oleh Future `getData()`. Jika string terlalu panjang, maka akan dipotong menjadi 450 karakter.
- `catchError()`: digunakan untuk menangani error yang terjadi pada Future (`getData()`), jika tidak ada error maka akan mengembalikan nilai dari Future, jika ada error maka akan mengembalikan nilai dari error.

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

## Langkah 1: Buka file main.dart
![](images/09.png)

## Langkah 2: Tambah method count()
![](images/10.png)

## Langkah 3: Panggil count()
![](images/11.png)

## Langkah 4: Run
![](images/12.png)

> **Soal 4**
> - Jelaskan maksud kode langkah 1 dan 2 tersebut!
- **Langkah 1:** Kita membuat tiga fungsi asynchronous (`returnOneAsync`, `returnTwoAsync`, dan `returnThreeAsync`). Masing-masing fungsi mengembalikan nilai `Future<int>` dan mensimulasikan proses yang membutuhkan waktu (seperti mengambil data dari internet) menggunakan `await Future.delayed(const Duration(seconds: 3))`. Ini berarti setiap fungsi akan berhenti (menunggu) selama 3 detik sebelum mengembalikan angka (1, 2, atau 3).
- **Langkah 2:** Kita membuat fungsi `count()` yang juga bersifat asynchronous. Fungsi ini memanggil ketiga fungsi dari Langkah 1 secara berurutan menggunakan kata kunci `await`. Karena menggunakan `await`, eksekusi akan menunggu sampai `returnOneAsync()` selesai (3 detik), lalu menjumlahkannya ke variabel `total`. Kemudian menunggu lagi `returnTwoAsync()` selesai (3 detik), dan terakhir menunggu `returnThreeAsync()` (3 detik). Total waktu tunggu adalah sekitar 9 detik. Setelah semuanya selesai, `setState()` dipanggil untuk memperbarui tampilan antarmuka dengan nilai `total` (yaitu 6).

# Praktikum 3: Menggunakan Completer di Future

## Langkah 1: Buka main.dart
![](images/13.png)

## Langkah 2: Tambahkan variabel dan method
![](images/14.png)

## Langkah 3: Ganti isi kode onPressed()
![](images/15.png)

> **Soal 5**
> - Jelaskan maksud kode langkah 2 tersebut!
- **`late Completer completer;`**: Kita mendeklarasikan sebuah variabel `completer` bertipe `Completer`. Objek ini berfungsi untuk membuat sebuah `Future` yang penyelesaiannya (berupa nilai kembalian atau error) dapat kita kontrol dan berikan nanti (*late*).
- **`getNumber()`**: Fungsi ini bertugas menginisialisasi objek `completer` yang baru. Kemudian ia memanggil fungsi `calculate()` untuk menjalankan proses di latar belakang, dan langsung mengembalikan `completer.future` tanpa menunggu `calculate()` selesai. `Future` inilah yang nanti ditangkap oleh fungsi `onPressed()` dan ditunggu hasilnya menggunakan `.then()`.
- **`calculate()`**: Fungsi ini menyimulasikan proses asinkron yang memakan waktu (menunggu selama 5 detik menggunakan `Future.delayed`). Setelah jeda waktu tersebut selesai, fungsi ini memanggil `completer.complete(42)`. Baris kode ini berfungsi untuk memberitahu `completer` bahwa proses telah selesai dan memberikan nilai `42` kepada `completer.future` yang sebelumnya telah di-return di `getNumber()`.

> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".
![](images/16.gif)

## Langkah 5: Ganti method calculate()
![](images/17.png)

## Langkah 6: Pindah ke onPressed()
![](images/18.png)

> **Soal 6**
> - Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!
- **Pada Langkah 2**: Fungsi `calculate()` tidak menangani potensi error yang mungkin terjadi. Saat dijalankan, ia hanya menggunakan *delay* lalu langsung memanggil `completer.complete(42)`. Jika ada masalah (atau ditekan dua kali berturut-turut), tidak ada penanganan, sehingga aplikasi bisa mengalami *crash* dan memunculkan error seperti `StateError: Bad state: Future already completed`. Pemanggilan di `onPressed()` pun belum menyiapkan fitur untuk "menangkap" error yang datang.
- **Pada Langkah 5 & 6**: Di Langkah 5, fungsi `calculate()` ditambahkan struktur `try-catch`. Jika ada kesalahan apa pun pada eksekusi asinkron, sistem akan menangkap kesalahan tersebut lewat `catch` dan menyalurkannya dengan aman menggunakan `completer.completeError({})`. Di Langkah 6, fungsi yang memanggil `getNumber()` di dalam `onPressed()` ditambahkan metode `.catchError()`. Dengan adanya tambahan tersebut, semua error yang dikirimkan oleh `completer.completeError` akan ditangkap oleh fungsi `.catchError()`, sehingga nilai `result` bisa diubah menjadi pesan teks ("An error occurred") tanpa menyebabkan aplikasi *crash*. Singkatnya, ini adalah praktik pembuatan Future dengan *error handling* yang benar.
![](images/16.gif)

# Praktikum 4: Memanggil Future secara paralel

## Langkah 1: Buka file main.dart
![](images/19.png)

## Langkah 2: Edit onPressed()
![](images/20.png)

## Langkah 3: Run
> **Soal 7**
![](images/21.gif)

## Langkah 4: Ganti variabel futureGroup
![](images/22.png)

> **Soal 8**
> - Jelaskan maksud perbedaan kode langkah 1 dan 4!
- **Pada Langkah 1**: Kita menggunakan class `FutureGroup` dari *package* `async`. `FutureGroup` memungkinkan kita untuk menambahkan beberapa objek `Future` secara dinamis satu per satu menggunakan method `.add()`. Setelah semua *Future* dimasukkan, kita harus memanggil `.close()` untuk menandai bahwa kelompok *Future* tersebut sudah ditutup (selesai ditambah). Barulah kemudian kita bisa menunggu hasilnya dengan memanggil `.future.then(...)`. Cara ini sangat berguna apabila jumlah *Future* yang akan dieksekusi belum diketahui secara pasti di awal dan perlu ditambahkan secara bertahap seiring berjalannya program.
- **Pada Langkah 4**: Kita menggunakan `Future.wait()`, yang merupakan fungsi bawaan dari core Dart API (tanpa perlu import `package:async/async.dart`). Pada `Future.wait()`, kita harus memasukkan semua *Future* secara bersamaan sekaligus di awal dalam bentuk tipe data *List* atau *Array* (seperti `[returnOneAsync(), returnTwoAsync(), returnThreeAsync()]`). Cara ini jauh lebih praktis, singkat, dan mudah dibaca (lebih *clean*) jika sejak awal kita sudah mengetahui secara persis fungsi asinkron apa saja yang ingin dijalankan secara paralel. Hasil akhirnya sama dengan Langkah 1, yakni menjalankan *Future* secara paralel dan mengembalikan total nilainya ketika semuanya telah selesai (yakni `6`).

# Praktikum 5: Menangani Respon Error pada Async Code

## Langkah 1: Buka file main.dart
![](images/23.png)

## Langkah 2: ElevatedButton
![](images/24.png)

## Langkah 3: Run
> **Soal 9**
![](images/25.gif)

## Langkah 4: Tambah method handleError()
![](images/26.png)

> **Soal 10**
> - Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!
- **Hasilnya**: Sama seperti Langkah 2, setelah menekan tombol "GO!" dan menunggu 2 detik, tampilan teks di tengah layar akan berubah menjadi pesan error `Exception: Something terrible happened!`, sedangkan di *Debug Console* akan tercetak tulisan `Complete`. Prosesnya adalah fungsi `handleError()` mencoba menjalankan `returnError()` di dalam blok `try`, lalu fungsi tersebut dengan sengaja melempar Exception. Karena ada *error*, program langsung melompat ke blok `catch` untuk memperbarui antarmuka lewat `setState`, dan diakhiri dengan mengeksekusi blok `finally` secara mutlak untuk mencetak 'Complete'.
- **Perbedaan Langkah 1 dan 4**: 
  - Pada **Langkah 1**: Penanganan *error* menggunakan pendekatan **Callback** dengan fungsi `.then()`, `.catchError()`, dan `.whenComplete()`. Pola ini bisa jadi membingungkan jika proses asinkronnya sangat banyak karena bentuknya akan semakin menjorok ke dalam (bersarang).
  - Pada **Langkah 4**: Penanganan *error* menggunakan pendekatan **Async/Await** yang digabungkan dengan struktur blok konvensional **Try-Catch-Finally**. Pendekatan ini merupakan fitur modern Dart yang sangat direkomendasikan karena kodenya terlihat jauh lebih rapi, *clean*, dan dibaca mengalir dari atas ke bawah seolah-olah merupakan kode program yang berjalan secara berurutan (*synchronous*).

# Praktikum 6: Menggunakan Future dengan StatefulWidget
  
## Langkah 1: install plugin geolocator
![](images/27.png)

## Langkah 2: Tambah permission GPS
![](images/28.png)

## Langkah 3: Buat file geolocation.dart
![](images/29.png)

## Langkah 4: Buat StatefulWidget
![](images/30.png)

## Langkah 5: Isi kode geolocation.dart
![](images/31.png)

> **Soal 11**
> - Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.
![](images/32.png)

## Langkah 6: Edit main.dart
![](images/33.png)

## Langkah 7: Run
![](images/34.png)

## Langkah 8: Tambahkan animasi loading
![](images/35.png)

> **Soal 12**
> - Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode `await Future.delayed(const Duration(seconds: 3));`
> - Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?
- **Jawab**: Ya, aplikasi tetap bisa mendapatkan koordinat lokasi meskipun dijalankan melalui browser (Flutter Web). Hal ini dimungkinkan karena *browser* modern (seperti Chrome, Edge, Safari) memiliki fitur **HTML5 Geolocation API** bawaan. Walaupun PC atau laptop kita rata-rata tidak memiliki sensor perangkat keras GPS fisik layaknya *smartphone*, *browser* bisa "menebak" atau memperkirakan posisi kita berdasarkan jaringan (*Network-based positioning*) melalui data-data seperti alamat IP publik dan lokasi jaringan Wi-Fi di sekitar. *Package* `geolocator` di Flutter cukup pintar untuk memanggil API *browser* ini secara otomatis ketika mendeteksi aplikasinya di-run di platform web.
