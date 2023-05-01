import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService{
  static const String baseUrl = 'https://exam-school-d7ef5-default-rtdb.firebaseio.com/';

  Future<List<dynamic>?> getData(String input) async {
    final res =await http.get(
      Uri.parse('$baseUrl$input.json')
    );
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }

  }
  Future<dynamic> putData(String key,List<String> input) async {
    final res = await http.put(
        Uri.parse('$baseUrl$key.json'),
        body: jsonEncode(input)
    );
    print(res.body);
  }
}