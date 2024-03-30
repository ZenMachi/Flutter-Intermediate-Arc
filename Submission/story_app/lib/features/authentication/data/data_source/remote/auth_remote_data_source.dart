import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/model/login/login_form.dart';
import 'package:story_app/features/authentication/data/model/login/login_response.dart';
import 'package:story_app/features/authentication/data/model/register/register.dart';
import 'package:story_app/features/authentication/data/model/register/register_response.dart';
import 'package:story_app/utils/exceptions/exceptions.dart';

class AuthRemoteDataSource {
  final Client client;

  AuthRemoteDataSource(this.client);

  Future<LoginResponse> postLoginInfo(LoginForm loginInfo) async {
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

    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      final message = json.decode(response.body);
      throw BadRequestException(message['message']);
    } else if (response.statusCode == 401) {
      final message = json.decode(response.body);
      throw UnauthorizedException(message['message']);
    } else {
      throw Exception("Unhandled Exception");
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

    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      final message = json.decode(response.body);
      throw BadRequestException(message['message']);
    } else if (response.statusCode == 401) {
      final message = json.decode(response.body);
      throw UnauthorizedException(message['message']);
    } else {
      throw Exception("Unhandled Exception");
    }
  }
}
