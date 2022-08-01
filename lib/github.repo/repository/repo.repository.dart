import 'dart:convert';

import 'package:githubbloc/github.repo/models/repo.models.dart';
import 'package:githubbloc/github.user/models/users.models.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<ListRepo> searchUsers(String keyword, int page, int pagesize) async {
    String url =
        "https://api.github.com/search/repositories?q=created:%3E2022-07-01&sort=stars&order=desc";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> ListRepoMap = json.decode(response.body);
        ListRepo listRepo = ListRepo.fromJson(ListRepoMap);
        return listRepo;
      } else {
        return throw ("error : ${response.statusCode}");
      }
    } catch (e) {
      return throw ("error : " + e.toString());
    }
  }
}
