import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/model/login.dart';
import 'package:story_app/features/authentication/data/model/login_response.dart';
import 'package:story_app/features/authentication/data/model/register.dart';
import 'package:story_app/features/authentication/data/model/register_response.dart';

class AuthRemoteDataSource {
  final Client client;

  AuthRemoteDataSource(this.client);

  Future<LoginResponse> postLoginInfo(LoginInfo loginInfo) async {
    final body = loginInfo.toJson();
    final headers = {
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
    };
    final uri = Uri.https(ApiLinks.baseUrl, ApiLinks.loginEndpoint);

    final response = await client.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<RegisterResponse> postRegisterInfo(RegisterInfo registerInfo) async {
    final body = registerInfo.toJson();
    final headers = {
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
    };
    final uri = Uri.https(ApiLinks.baseUrl, ApiLinks.registerEndpoint);

    final response = await client.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
