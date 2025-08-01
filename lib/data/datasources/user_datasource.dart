import 'package:my_app/core/network/api_client.dart';
import 'package:my_app/data/models/user.dart';

class UserDataSource {
  Future<List<User>> fetchUsers() async {
    final response = await ApiClient.dio.get('users');
    return (response.data as List).map((json) => User.fromJson(json)).toList();
  }
}
