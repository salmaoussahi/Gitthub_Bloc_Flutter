import 'dart:convert';

import 'package:githubbloc/github.user/models/users.models.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<ListUsers> searchUsers(String keyword, int page, int pagesize) async {
    String url =
        "https://api.github.com/search/users?q=${keyword}&per_page=${pagesize}&page=${page}";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> listUsersMap = json.decode(response.body);
        ListUsers listUsers = ListUsers.fromJson(listUsersMap);
        print(url);
        return listUsers;
      } else {
        return throw ("error : ${response.statusCode}");
      }
    } catch (e) {
      return throw ("error : " + e.toString());
    }
  }


 Future<ListUsers> searchallUsers() async {
    String url =
        "https://api.github.com/search/users?q=a&per_page=120&page=2";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> listUsersMap = json.decode(response.body);
        ListUsers listUsers = ListUsers.fromJson(listUsersMap);
        print(url);
        return listUsers;
      } else {
        return throw ("error : ${response.statusCode}");
      }
    } catch (e) {
      return throw ("error : " + e.toString());
    }
  }}
