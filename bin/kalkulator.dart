// bin/main.dart
import 'dart:io';

import '../lib/kalkulator.dart'; // Menghubungkan ke file kalkulator di folder lib

void main() async {
  Kalkulator kal = Kalkulator(); // Membuat objek dari class Kalkulator
  bool ulang = true;

  print("==========================================");
  print("       APLIKASI KALKULATOR CONSOLE        ");
  print("==========================================");

  while (ulang) {
    double? bil1;
    double? bil2;

    // Input Bilangan Pertama (dengan Validasi Error Handling jika bukan angka)
    while (bil1 == null) {
      try {
        stdout.write("\nMasukkan bilangan pertama: ");
        String? input = stdin.readLineSync();
        if (input == null || input.isEmpty) throw FormatException();
        bil1 = double.parse(input);
      } catch (e) {
        print("❌ Error: Input wajib berupa angka!");
      }
    }

    // Input Bilangan Kedua (dengan Validasi Error Handling jika bukan angka)
    while (bil2 == null) {
      try {
        stdout.write("Masukkan bilangan kedua: ");
        String? input = stdin.readLineSync();
        if (input == null || input.isEmpty) throw FormatException();
        bil2 = double.parse(input);
      } catch (e) {
        print("❌ Error: Input wajib berupa angka!");
      }
    }

    // Menampilkan Menu Operasi Matematika
    print("\nPilih Operasi Matematika:");
    print(" [1] Tambah (+)");
    print(" [2] Kurang (-)");
    print(" [3] Kali   (x)");
    print(" [4] Bagi   (/)");

    stdout.write("Masukkan pilihan (1-4): ");
    String? pilihan = stdin.readLineSync();

    // Simulasi Asynchronous (Loading seolah memproses data dari internet)
    stdout.write("Menghitung...");
    await Future.delayed(Duration(seconds: 1));
    print("\n------------------------------------------");

    // Proses Menghitung dan Menangani Error Pembagian 0
    try {
      double hasil;
      switch (pilihan) {
        case '1':
          hasil = kal.tambah(bil1, bil2);
          print("Hasil: $bil1 + $bil2 = $hasil");
          break;
        case '2':
          hasil = kal.kurang(bil1, bil2);
          print("Hasil: $bil1 - $bil2 = $hasil");
          break;
        case '3':
          hasil = kal.kali(bil1, bil2);
          print("Hasil: $bil1 x $bil2 = $hasil");
          break;
        case '4':
          hasil = kal.bagi(bil1, bil2);
          print("Hasil: $bil1 / $bil2 = $hasil");
          break;
        default:
          print("❌ Error: Pilihan tidak valid (Harus angka 1-4).");
      }
    } catch (e) {
      // Menangkap pesan error dari class Kalkulator jika membagi dengan 0
      print(
        "❌ Terjadi Kesalahan: ${e.toString().replaceAll("Exception: ", "")}",
      );
    }

    print("==========================================");

    // Fitur Mengulang atau Keluar Aplikasi
    bool validKonfirmasi = false;
    while (!validKonfirmasi) {
      stdout.write("Apakah Anda ingin menghitung lagi? (Y/T): ");
      String? konfirmasi = stdin.readLineSync()?.toUpperCase();

      if (konfirmasi == 'T') {
        ulang = false;
        validKonfirmasi = true;
        print("\nTerima kasih telah menggunakan aplikasi kalkulator!");
      } else if (konfirmasi == 'Y') {
        validKonfirmasi = true;
      } else {
        print("❌ Masukan salah! Cukup ketik 'Y' atau 'T'.");
      }
    }
  }
}
