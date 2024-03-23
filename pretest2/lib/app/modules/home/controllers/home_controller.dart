import 'package:get/get.dart';
import 'package:pretest2/app/modules/models/profil_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var profil = Profil(
    firstName: '',
    lastName: '',
    city: '',
    country: '',
    imageUrl: '',
    gender: '',
    email: '',
  ).obs; // Objek Profil sebagai Rx untuk reactivity

  @override
  void onInit() {
    super.onInit();
    fetchProfil(); // Panggil method fetchProfil() saat controller diinisialisasi
  }

  void fetchProfil() async {
    try {
      // Lakukan pemanggilan API untuk mendapatkan data profil
      var response = await http.get(Uri.parse('https://randomuser.me/api/'));

      // Cek apakah responsenya berhasil (status code 200)
      if (response.statusCode == 200) {
        // Parse data JSON ke dalam objek Profil
        var jsonData = jsonDecode(response.body);
        var data =
            jsonData['results'][0]; // Sesuaikan dengan struktur data API Anda
        Profil newProfil = Profil(
          firstName: data['name']['first'],
          lastName: data['name']['last'],
          city: data['location']['city'],
          country: data['location']['country'],
          imageUrl: data['picture']['large'],
          gender: data['gender'],
          email: data['email'],
        );

        // Update nilai objek Profil
        profil.value = newProfil;
      } else {
        // Jika responsenya tidak berhasil, tampilkan pesan kesalahan
        print('Failed to load profile data: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani kesalahan jika terjadi
      print('Error fetching profile data: $e');
    }
  }
}
