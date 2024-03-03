class Tiket {
  final int hargaEkonomi = 350000;
  final int hargaBisnis = 500000;

  int hitungHarga(int jumlahPenumpang, int beratBagasi, String kelas) {
    int hargaKelas = 0;
    if (kelas == 'ekonomi') {
      hargaKelas = hargaEkonomi;
    } else if (kelas == 'bisnis') {
      hargaKelas = hargaBisnis;
    }
    int hargaBagasi = 0;
    if (beratBagasi > 20) {
      hargaBagasi = (beratBagasi - 20) * 100000;
    }
    return jumlahPenumpang * hargaKelas + hargaBagasi;
  }
}

void main() {
  Tiket tiket = Tiket();
  int hargaTiket = tiket.hitungHarga(2, 25, 'ekonomi');
  print('Harga tiket: $hargaTiket');

  int hargaTiketBisnis = tiket.hitungHarga(1, 15, 'bisnis');
  print('Harga tiket bisnis: $hargaTiketBisnis');
}
