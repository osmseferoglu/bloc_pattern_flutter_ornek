class KisiResponse {
  List<Kisi> kisiler;

  KisiResponse({
    required this.kisiler,
  });

  Map<String, dynamic> toJson() {
    return {
      'filmler': kisiler,
    };
  }

  factory KisiResponse.fromJson(Map<String, dynamic> json) {
    return KisiResponse(
      kisiler: (json['kisiler'] as List<dynamic>)
          .map((e) => Kisi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Kisi {
  int kisi_id;
  String kisi_ad;
  String kisi_tel;

  Kisi({
    required this.kisi_id,
    required this.kisi_ad,
    required this.kisi_tel,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': kisi_id,
      'kisi_ad': kisi_ad,
      'kisi_tel': kisi_tel,
    };
  }

  factory Kisi.fromJson(Map<String, dynamic> json) {
    return Kisi(
      kisi_id: json['id'] as int,
      kisi_ad: json['kisi_ad'] as String,
      kisi_tel: json['kisi_tel'] as String,
    );
  }
}
