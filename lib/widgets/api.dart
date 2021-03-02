
import 'package:http/http.dart' as http;
import 'dart:convert';


Future loginUser (String email , String password) async {
  String url ="https://earnezy.in/android_shop/login.php";
  final response = await http.post(url,
  headers :{ 'Accept' : "Application/json"},
    body: { 'email' : email, 'password': password
  }
  );
  var convertedDataJson = jsonDecode(response.body);
  return convertedDataJson;
}