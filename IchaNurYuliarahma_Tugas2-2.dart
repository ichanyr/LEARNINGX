void main() {
  // Membuat map untuk menyimpan data nama siswa dan nilai
  Map<String, int> nilaiSiswa = {
    'udin': 85,
    'budi': 70,
    'nina': 65,
    'desi': 90,
    'dimas': 40
  };

  // Menampilkan data minimal 5 siswa dan hasil akhir
  nilaiSiswa.forEach((nama, nilai) {
    String hasil;
    if (nilai >= 80) {
      hasil = 'LULUS';
    } else if (nilai >= 50) {
      hasil = 'REVISI';
    } else {
      hasil = 'TIDAK LULUS';
    }
    print('$nama: $hasil');
  });
}
