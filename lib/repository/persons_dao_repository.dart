import 'dart:convert';

import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:dio/dio.dart';

class KisilerDaoRepository {
  List<Kisi> parseKisiCevap(dynamic data) {
    return KisiResponse.fromJson(data).kisiler;
  }

  Future<List<Kisi>> fetchAllPersons() async {
    try {
      var url = "http://85.159.71.66:8080/api/persons";
      var response = await Dio().get(url);
      print(response.data.toString());
      return parseKisiCevap(response.data);
    } catch (error) {
      print("Error fetching persons: $error");
      throw Exception("Failed to fetch persons");
    }
  }

  Future<Response> addPerson(String kisi_ad, String kisi_tel) async {
    try {
      var url = "http://85.159.71.66:8080/api/persons";
      var data = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
      var response = await Dio().post(url, data: FormData.fromMap(data));
      print(response.toString());
      return response;
    } catch (error) {
      print("Error adding person: $error");
      throw Exception("Failed to add person");
    }
  }
}

