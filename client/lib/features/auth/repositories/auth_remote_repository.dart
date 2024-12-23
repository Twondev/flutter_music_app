import 'dart:convert';
import 'package:client/core/constants/server_constant.dart';
import 'package:client/core/failure/failure.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_remote_repository.g.dart';

// i created a simple provider for AuthRemoteRepository
@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  // return a failure as string and a success as a map
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ServerConstant.serverURL}/auth/signup'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        return Left(AppFailure(resBodyMap['detail']));
      }
      return Right(
        UserModel.fromMap(resBodyMap['user']).copyWith(
          token: resBodyMap['token'],
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> getUserCurrentDAta(String token) async {
    try {
      final response = await http.get(
        Uri.parse('${ServerConstant.serverURL}/auth/'),
        headers: {'content-type': 'application/json', 'x-auth-token': token},
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      // print('User Map: ${resBodyMap['user']}');
      if (response.statusCode != 200) {
        return Left(
          AppFailure(resBodyMap['detail']),
        );
      }
      return Right(UserModel.fromMap(resBodyMap).copyWith(
        token: token,
      ));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ServerConstant.serverURL}/auth/login'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      // print('User Map: ${resBodyMap['user']}');
      if (response.statusCode != 200) {
        return Left(
          AppFailure(resBodyMap['detail']),
        );
      }
      return Right(UserModel.fromMap(resBodyMap['user']).copyWith(
        token: resBodyMap['token'],
      ));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
