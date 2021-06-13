
class User {
  final int id;
  final String email;
  final int dualScore;
  final int soloScore;
  final String profileImg;
  final String comment;
  final int rank;
  final int totalRank;

  User({
    required this.id,
    required this.email,
    required this.dualScore,
    required this.soloScore,
    required this.profileImg,
    required this.comment,
    required this.rank,
    required this.totalRank
  });

  User.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    email = json['email'],
    dualScore = json['dualScore'],
    soloScore = json['soloScore'],
    profileImg = json['profileImg'],
    comment = json['comment'],
    rank = json['rank'],
    totalRank = json['totalRank'];


}