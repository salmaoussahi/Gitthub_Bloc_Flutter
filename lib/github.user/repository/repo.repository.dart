import 'dart:convert';

import 'package:githubbloc/github.user/models/repo.models.dart';
import 'package:githubbloc/github.user/models/users.models.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RepoRepository {
  Future<ListRepo> searchRepo() async {
    var now = new DateTime.now();

    DateTime before = now.subtract(new Duration(days: 30));
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(before);
    print(formattedDate);

    String url =
        "https://api.github.com/search/repositories?q=created:%3E${formattedDate}&sort=stars&order=desc";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> ListRepoMap = json.decode(response.body);
        ListRepo listRepo = ListRepo.fromJson(ListRepoMap);
        print(url);
        print("listRepo");
        print(listRepo);
        return listRepo;
      } else {
        return throw ("error : ${response.statusCode}");
      }
    } catch (e) {
      return throw ("error : " + e.toString());
    }
  }
}
