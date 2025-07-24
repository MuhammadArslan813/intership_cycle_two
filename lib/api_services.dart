import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map>> fetchUsers() async {
    final res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.cast<Map>();
    } else {
      throw Exception("Failed to load users");
    }
  }
}
