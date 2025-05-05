class Recipe {
  final int id;
  final int userId;
  final String nama;
  final String? foto;
  final String detail;
  final String durasi;
  final String kategori;
  final String jenisHidangan;
  final String estimasiWaktu;
  final String tingkatKesulitan;

  Recipe({
    required this.id,
    required this.userId,
    required this.nama,
    this.foto,
    required this.detail,
    required this.durasi,
    required this.kategori,
    required this.jenisHidangan,
    required this.estimasiWaktu,
    required this.tingkatKesulitan,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      nama: json['nama'] ?? '',
      foto: json['foto'], // null jika tidak ada
      detail: json['detail'] ?? '',
      durasi: json['durasi'] ?? '',
      kategori: json['kategori'] ?? '',
      jenisHidangan: json['jenis_hidangan'] ?? '',
      estimasiWaktu: json['estimasi_waktu'] ?? '',
      tingkatKesulitan: json['tingkat_kesulitan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'nama': nama,
      'foto': foto,
      'detail': detail,
      'durasi': durasi,
      'kategori': kategori,
      'jenis_hidangan': jenisHidangan,
      'estimasi_waktu': estimasiWaktu,
      'tingkat_kesulitan': tingkatKesulitan,
    };
  }
}
