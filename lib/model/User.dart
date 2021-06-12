
class User {
  final int id;
  final String email;
  final int dualScore;
  final int soloScore;
  final String profileImg;
  final String comment;
  final int rank;
  final int totalRank;

  User(
      this.id,
      this.email,
      this.dualScore,
      this.soloScore,
      this.profileImg,
      this.comment,
      this.rank,
      this.totalRank
  );

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