import 'dart:convert';

import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:dio/dio.dart';

class KisilerDaoRepository {
  List<Kisi> parseKisiCevap(String str) {
    return KisiResponse.fromJson(json.decode(str)).kisiler;
  }

  Future<List<Kisi>> tumKisileriGetir() async {
    var url = "http://85.159.71.66:8080/api/persons";
    var cevap = await Dio().get(url);
    return parseKisiCevap(cevap.data);
  }

  Future<Response> kisiKayit(String kisi_ad, String kisi_tel) async {
    var url = "http://85.159.71.66:8080/api/persons";
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var eklenenKisi = await Dio().post(url, data: FormData.fromMap(veri));
    print(eklenenKisi.toString());
    return eklenenKisi;
  }
}
