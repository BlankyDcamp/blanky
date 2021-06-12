
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

/*
"id": 38,
    "nickname": "zizo",
    "email": "zizo@gmail.com",
    "dualScore": "100",
    "soloScore": "100",
    "profileImg": "https://google.com/d02lmcxizdksjdiasdadkci.jpeg",
    "comment": "올것이 왔군..",
    "rank": "1",
    "totalRank": "22500"
 */