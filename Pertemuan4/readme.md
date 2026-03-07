# #04 | Pengantar Bahasa Pemrograman Dart - Bagian 3

## Tugas Praktikum

## Identitas Mahasiswa

| Keterangan | Detail |
| :--- | :--- |
| **Nama** | Yosep Bima Aprillian |
| **NIM** | 244107060027 |
| **Kelas** | SIB-2D |

---

## Soal 1

**Silakan selesaikan Praktikum 1 sampai 5, lalu dokumentasikan berupa screenshot hasil pekerjaan Anda beserta penjelasannya!**

### Jawaban:

Praktikum 1 hingga 5 telah diselesaikan dan didokumentasikan lengkap di repository Github ini. Berikut adalah ringkasan serta link ke setiap praktikum:

| Praktikum | Topik | Link Dokumentasi |
| :--- | :--- | :--- |
| **Praktikum 1** | Eksperimen Tipe Data List | [Praktikum 1](./Praktikum1/readme.md) |
| **Praktikum 2** | Eksperimen Tipe Data Set | [Praktikum 2](./Praktikum2/readme.md) |
| **Praktikum 3** | Eksperimen Tipe Data Maps | [Praktikum 3](./Praktikum3/readme.md) |
| **Praktikum 4** | Collection Control Flow Operators & Spread | [Praktikum 4](./Praktikum4/readme.md) |
| **Praktikum 5** | Eksperimen Tipe Data Records | [Praktikum 5](./Praktikum5/readme.md) |

---

## Soal 2

**Jelaskan yang dimaksud Functions dalam bahasa Dart!**

### Jawaban:

**Functions** (Fungsi) dalam Dart adalah blok kode yang dapat dijalankan berulang kali dan dirancang untuk melakukan tugas-tugas tertentu. Fungsi memungkinkan Anda mengorganisir kode menjadi unit yang dapat digunakan kembali, meningkatkan *readability*, dan mengurangi duplikasi kode. Dalam Dart, fungsi adalah **first-class objects**, artinya fungsi dapat diperlakukan seperti nilai biasa (disimpan dalam variabel, dilewatkan sebagai parameter, atau dikembalikan dari fungsi lain).

**Karakteristik Fungsi di Dart:**
- Dapat memiliki parameter (input) dan *return value* (output).
- Mendukung *optional parameters*, *named parameters*, dan *default values*.
- Dapat bersifat *anonymous* (tanpa nama).
- Mendukung *lexical closures*.
- Dapat digunakan untuk *functional programming*.

**Bentuk Dasar:**
```dart
returnType functionName(parameterType parameter) {
  // Body fungsi
  return value;
}
```

---

## Soal 3

**Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!**

### Jawaban:

**1. Positional Parameters (Parameter Posisional)**
Parameter yang harus diberikan sesuai urutan posisinya saat memanggil fungsi.

```dart
void greet(String name, int age) {
  print('Hello $name, you are $age years old');
}

// Pemanggilan
greet('Yosep', 20);
```

**2. Optional Positional Parameters (Parameter Posisional Opsional)**
Parameter yang dapat diberikan atau tidak, ditandai dengan `[]`. Jika diberikan, harus sesuai urutan.

```dart
void introduce(String name, [String city = 'Unknown']) {
  print('$name from $city');
}

// Pemanggilan - keduanya valid
introduce('Yosep');
introduce('Yosep', 'Malang');
```

**3. Named Parameters (Parameter Bernama)**
Parameter yang diberikan dengan nama eksplisit saat pemanggilan, ditandai dengan `{}`. Urutannya tidak penting.

```dart
void createUser({required String name, required int nim, String kelas = 'Unknown'}) {
  print('Name: $name, NIM: $nim, Kelas: $kelas');
}

// Pemanggilan - urutan bisa diacak
createUser(name: 'Yosep', nim: 244107060027, kelas: 'SIB-2D');
createUser(kelas: 'SIB-2D', name: 'Yosep', nim: 244107060027);
```

**4. Default Parameters (Parameter dengan Nilai Default)**
Parameter yang otomatis memiliki nilai bawaan jika tidak diisi saat pemanggilan.

```dart
void printInfo(String name, [String country = 'Indonesia']) {
  print('$name from $country');
}

// Pemanggilan
printInfo('Yosep'); // Output: Yosep from Indonesia
printInfo('Yosep', 'Singapore'); // Output: Yosep from Singapore
```

**5. Mixed Parameters (Parameter Campuran)**
Kombinasi dari positional dan named parameters. *Positional parameters* harus didefinisikan terlebih dahulu.

```dart
void register(String name, int age, {String? city, String? phone}) {
  print('Name: $name, Age: $age, City: $city, Phone: $phone');
}

// Pemanggilan
register('Yosep', 20, city: 'Malang', phone: '08123456789');
```

---

## Soal 4

**Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!**

### Jawaban:

*First-class objects* berarti fungsi dalam Dart diperlakukan sama persis seperti data atau nilai lainnya (seperti String atau int). Fungsi dapat:
- Disimpan di dalam variabel.
- Dilewatkan sebagai argumen/parameter ke fungsi lain.
- Dikembalikan (*return*) sebagai hasil dari fungsi lain.

**1. Fungsi Disimpan dalam Variabel**
```dart
int add(int a, int b) {
  return a + b;
}

// Menyimpan fungsi ke dalam variabel
var calculator = add;
print(calculator(10, 20)); // Output: 30
```

**2. Fungsi Sebagai Parameter**
```dart
void processNumbers(int a, int b, Function operation) {
  print('Result: ${operation(a, b)}');
}

int add(int x, int y) => x + y;
int multiply(int x, int y) => x * y;

// Pemanggilan
processNumbers(5, 3, add);      // Output: Result: 8
processNumbers(5, 3, multiply); // Output: Result: 15
```

**3. Fungsi Mengembalikan Fungsi**
```dart
Function getOperation(String type) {
  if (type == 'add') {
    return (a, b) => a + b;
  } else if (type == 'subtract') {
    return (a, b) => a - b;
  }
  return (a, b) => a * b;
}

// Pemanggilan
var addFunction = getOperation('add');
print(addFunction(10, 5)); // Output: 15
```

**4. Callback Functions**
```dart
void fetchData(Function onSuccess, Function onError) {
  try {
    print('Fetching data...');
    onSuccess('Data berhasil diambil');
  } catch (e) {
    onError('Error: $e');
  }
}

// Pemanggilan dengan callback
fetchData(
  (data) => print('Success: $data'),
  (error) => print('Error: $error')
);
```

---

## Soal 5

**Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!**

### Jawaban:

*Anonymous Functions* (Fungsi Anonim) adalah fungsi yang tidak memiliki nama. Biasanya fungsi ini didefinisikan secara langsung di tempat ia dibutuhkan (*inline*) untuk digunakan sekali saja, sering kali sebagai *callback*. Fungsi ini juga dikenal sebagai *lambda functions* atau *arrow functions*.

**Sintaks Umum:**
```dart
(parameter) => expression;

// atau

(parameter) {
  // body
  return value;
};
```

**Contoh Penggunaan:**

```dart
var numbers = [1, 2, 3, 4, 5];

// 1. Menggunakan anonymous function dengan map()
var doubled = numbers.map((n) => n * 2);
print(doubled.toList()); // Output: [2, 4, 6, 8, 10]

// 2. Anonymous function dengan forEach
var fruits = ['apple', 'banana', 'cherry'];
fruits.forEach((fruit) {
  print('Fruit: $fruit');
});

// 3. Anonymous function sebagai Callback
void processUser(String name, Function callback) {
  callback(name.toUpperCase());
}
processUser('yosep', (name) => print('Hello, $name!')); // Output: Hello, YOSEP!
```

---

## Soal 6

**Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!**

### Jawaban:

- **Lexical Scope** berarti ruang lingkup (visibilitas) sebuah variabel ditentukan oleh letak variabel tersebut diketik dalam struktur kode (*source code*). Fungsi yang berada di dalam (*inner function*) dapat mengakses variabel milik fungsi di luarnya (*outer function*), tetapi tidak sebaliknya.
- **Lexical Closures** adalah sebuah fungsi (*inner*) yang berhasil "mengingat" dan masih bisa mengakses variabel dari ruang lingkup induknya (*outer scope*), **meskipun** fungsi induk tersebut sudah selesai dieksekusi.

**Contoh Lexical Scope:**
```dart
void outer() {
  String outerVar = 'Outer'; // Accessible di outer dan inner
  
  void inner() {
    String innerVar = 'Inner'; // Hanya accessible di inner
    print('$outerVar - $innerVar'); // Output: Outer - Inner
  }
  
  inner();
  // print(innerVar); // ❌ Error: innerVar tidak accessible di sini
}
```

**Contoh Lexical Closures:**
```dart
Function makeAdder(int addBy) {
  return (int x) {
    return x + addBy; // Mengakses 'addBy' dari outer scope
  };
}

// Fungsi makeAdder selesai berjalan, tetapi inner function-nya masih
// "mengingat" nilai addBy (5 dan 10) di dalam memory.
var add5 = makeAdder(5);
var add10 = makeAdder(10);

print(add5(3));  // Output: 8
print(add10(3)); // Output: 13
```

**Tabel Perbandingan:**

| Aspek | Lexical Scope | Lexical Closures |
| :--- | :--- | :--- |
| **Definisi** | Visibilitas variabel berdasarkan posisi penulisan kode. | Fungsi yang "mengingat" *environment* variabelnya. |
| **Waktu Akses** | Berlaku saat *compile-time* (statis). | Berlaku saat *runtime* (meskipun parent function sudah selesai). |
| **Contoh** | Inner function mengakses *outer variable* secara langsung. | Inner function disimpan di variabel lain, namun tetap bisa mengakses *outer variable*. |

---

## Soal 7

**Jelaskan dengan contoh cara membuat return multiple value di Functions!**

### Jawaban:

Dalam bahasa Dart (khususnya sejak Dart versi 3.0), cara paling efisien dan modern untuk mengembalikan lebih dari satu nilai (*multiple return values*) dari sebuah fungsi adalah menggunakan fitur **Records**. Sebelum ada Records, *developer* biasanya menggunakan struktur data seperti `List` atau `Map`, namun cara tersebut kurang aman terhadap tipe data (*type-safe*).

**1. Menggunakan Records (Cara Modern & Paling Direkomendasikan)**
Records memungkinkan kita mengelompokkan beberapa nilai dengan tipe data yang berbeda secara langsung tanpa harus membuat *Class* khusus.

```dart
// Fungsi mengembalikan String dan int sekaligus menggunakan Record
(String, int) getStudentInfo() {
  String name = "Yosep Bima Aprillian";
  int nim = 244107060027;
  
  return (name, nim);
}

void main() {
  // Destructuring (memecah) nilai kembalian langsung ke dalam variabel
  var (studentName, studentNim) = getStudentInfo();
  
  print('Nama: $studentName');
  print('NIM: $studentNim');
}
```

**2. Menggunakan List (Cara Konvensional)**
Bisa digunakan, namun kelemahannya tipe data akan menjadi `dynamic` jika elemennya memiliki tipe yang berbeda.
```dart
List<dynamic> getCoordinates() {
  return [-7.9839, 112.6214, "Malang"];
}
```

**3. Menggunakan Map (Cara Konvensional)**
Sangat berguna jika Anda ingin mengembalikan nilai yang direpresentasikan menggunakan pasangan kunci dan nilai (*key-value*).
```dart
Map<String, dynamic> fetchUserData() {
  return {
    'nama': 'Yosep Bima',
    'status': 'Aktif'
  };
}
```