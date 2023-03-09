import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) => User.fromJson(map);
    // httpClient.baseUrl = ApiService.baseUrl;
  }

  Future<Response> login(String phone, String password) async {
    return await post(
      '/login',
      {
        'phone': phone,
        'password': password,
      },
      decoder: (data) {},
    );
  }

  Future<Response> register(String username, String password) async {
    return await post(
      '/register',
      {'username': username, 'password': password},
    );
  }

  Future<Response> logout() async {
    return await post(
      '/logout',
      {},
    );
  }
}
