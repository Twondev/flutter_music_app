import 'dart:io';

import 'package:client/core/constants/server_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<void> uploadSong(
    File selectedImage,
    File selectedAudio,
  ) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstant.serverURL}/song/upload'),
    );
    request
      ..files.addAll([
        await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
        await http.MultipartFile.fromPath('song', selectedAudio.path),
      ])
      ..fields.addAll({
        'artist': 'anass',
        'song_name': 'likeMe',
        'hex_code': 'FFFFFF',
      })
      ..headers.addAll({
        'x-auth-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkZjc0ZTM1LTFmZWMtNDZhZS1iMjA5LTU3NzdiYmFiN2NhNCJ9.qbqi6cUalwvtVb3fM6OO5LacojE5wMqh4r4w2kIw5L8',
      });
    final res = await request.send();
    print(res);
  }
}
