class Pasien {
  String nama;
  int umur;
  String jenisKelamin;

  Pasien(this.nama, this.umur, this.jenisKelamin);

  void daftarPeriksa(String keluhan) {
    print('$nama mendaftar dengan keluhan: $keluhan');
  }

  void bayarTagihan(double totalBiaya) {
    print('$nama membayar tagihan sebesar Rp$totalBiaya');
  }

  void tambahRekamMedis(String diagnosa, String resepObat) {
    print(
        'Rekam medis pasien $nama ditambahkan dengan diagnosa: $diagnosa dan resep obat: $resepObat');
  }
}

void main() {
  Pasien pasien1 = Pasien('John Doe', 30, 'Laki-laki');

  pasien1.daftarPeriksa('Sakit kepala');

  pasien1.tambahRekamMedis('Migrain', 'Paracetamol');

  pasien1.bayarTagihan(50000);
}
