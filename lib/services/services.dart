

import 'package:instagram_rapid_api/model/model.dart';
import 'package:instagram_rapid_api/repositiory/insta_repo.dart';

class Services {

  final _repo = InstaRepoApi();
  Future<InstagramApiModelClass> fatchInstaData () async {
    final response = await _repo.fatchInstaData();
    return response;
  }
}