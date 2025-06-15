class Review {
  final int id;
  final int resepId;
  final int userId;
  final String deskripsi;
  final int bintang;
  final String? foto;

  Review({
    required this.id,
    required this.resepId,
    required this.userId,
    required this.deskripsi,
    required this.bintang,
    this.foto,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      resepId: json['resep_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      deskripsi: json['deskripsi'] ?? '',
      bintang: json['bintang'] ?? 0,
      foto: json['foto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resep_id': resepId,
      'user_id': userId,
      'deskripsi': deskripsi,
      'bintang': bintang,
      'foto': foto,
    };
  }
}