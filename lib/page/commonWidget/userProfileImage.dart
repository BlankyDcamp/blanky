import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileImage extends StatelessWidget {

  final int rank;
  final int totalRank;
  final String imageUrl;
  String get tier {
    double percentage = (rank*100)/totalRank;
    print(percentage);
    if(percentage>=90) {
      ///larva 상위 95퍼 100%~90%
      return "larva";
    } else if (90>percentage&&percentage>=80) {
      /// butterfly 상위 90퍼 90%~80%
      return "butterfly";
    } else if (80>percentage&&percentage>=60) {
      /// frog 상위 80퍼 80%~60%
      return "frog";
    } else if (60>percentage&&percentage>=40) {
      /// parrot 상위 60퍼 60%~40%
      return "parrot";
    } else if (40>percentage&&percentage>=20) {
      /// cat 상위 40퍼 40%~20%
      return "cat";
    } else if (20>percentage&&percentage>=10) {
      /// dog 상위 20퍼 20%~10%
      return "dog";
    } else if (10>percentage&&percentage>=5) {
      /// bear 상위 10퍼 10%~5%
      return "bear";
    } else if (5>percentage&&percentage>=1) {
      /// lion 상위 5퍼 5%~1%
      return "lion";
    } else if (1>percentage&&percentage>=0) {
      /// whale 상위 1퍼 1%~3등
      return "whale";
    } else {
      return "non";
    }
  }
  String get tierIconPath {
    switch(tier) {
      case "larva":
        return "assets/icons/rank/icon_rank_larva.svg";
      case "butterfly":
        return "assets/icons/rank/icon_rank_butterfly.svg";
      case "frog":
        return "assets/icons/rank/icon_rank_frog.svg";
      case "parrot":
        return "assets/icons/rank/icon_rank_parrot.svg";
      case "cat":
        return "assets/icons/rank/icon_rank_cat.svg";
      case "dog":
        return "assets/icons/rank/icon_rank_dog.svg";
      case "bear":
        return "assets/icons/rank/icon_rank_bear.svg";
      case "lion":
        return "assets/icons/rank/icon_rank_lion.svg";
      case "whale":
        return "assets/icons/rank/icon_rank_whale.svg";
      default:
        return "assets/icons/rank/icon_rank_whale.svg";
    }
  }

  int get tierColorCode {
    switch(tier) {
      case "larva":
        return 0xb3c4c4c4;
      case "butterfly":
        return 0xb3fee500;
      case "frog":
        return 0xb363c7ff;
      case "parrot":
        return 0xb3074ee8;
      case "cat":
        return 0xb30e2984;
      case "dog":
        return 0xb30e0e2c;
      case "bear":
        return 0xb3e55cb3;
      case "lion":
        return 0xb3fd0005;
      case "whale":
        return 0xb37a63ff;
      default:
        return 0xff7a63ff;
    }
  }


  UserProfileImage(this.imageUrl,this.rank, this.totalRank);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 112,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,),
                  color: Colors.grey,
                  shape: BoxShape.circle
              ),
            ),
            placeholder: (context, url) => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle
                  ),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 4,
                    ),
                  ),
                ),
              ],
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Stack(
            children: [
              Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color(tierColorCode),
                      width: 8
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 36,
                  height: 36,
                  child: SvgPicture.asset(tierIconPath),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



}