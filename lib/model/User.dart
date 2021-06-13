
class User {
  final int id;
  final String email;
  final String nickname;
  final int dualScore;
  final int soloScore;
  final String profileImg;
  final String description;
  final int rank;
  final int totalRank;

  User({
    required this.id,
    required this.email,
    required this.nickname,
    required this.dualScore,
    required this.soloScore,
    required this.profileImg,
    required this.description,
    required this.rank,
    required this.totalRank
  });

  User.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    email = json['email'],
    nickname = json['nickname'],
    dualScore = json['dualScore'],
    soloScore = json['soloScore'],
    profileImg = json['profileImg'],
    description = json['description'],
    rank = json['rank'],
    totalRank = json['totalRank'];


}