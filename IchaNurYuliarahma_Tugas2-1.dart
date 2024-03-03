import 'dart:io';

void main() {
  stdout.write('Masukkan panjang: ');
  double panjang = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan lebar: ');
  double lebar = double.parse(stdin.readLineSync()!);

  double luas = hitungLuasPersegiPanjang(panjang, lebar);
  print('Luas persegi panjang adalah: $luas');
}

double hitungLuasPersegiPanjang(double panjang, double lebar) {
  return panjang * lebar;
}
