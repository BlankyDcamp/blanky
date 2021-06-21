import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class UserProfileImage extends StatelessWidget {

  final int rank;
  final int totalRank;
  final String imageUrl;
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
                      color: Color(0xb3fee500),
                      width: 8
                  ),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

}