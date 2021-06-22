import 'package:blanky/model/Chapter.dart';
import 'package:blanky/page/commonFunction/numberParser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChapterItem extends StatelessWidget {
  final Chapter? chapterInfo;
  final VoidCallback onTap;

  ChapterItem(this.chapterInfo, this.onTap);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical:4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        margin: EdgeInsets.symmetric(vertical:0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 11,horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///사진
              CachedNetworkImage(
                imageUrl: chapterInfo!.chapterImg,
                height: 48,
                width: 48,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
                placeholder: (context, url) => Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              ///콘텐츠
              Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chapterInfo!.title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          chapterInfo!.description,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              ///순위
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: appTheme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                        offset: Offset(1.5, 1.5), // shadow direction: bottom right
                      ),
                    ]
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: onTap,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}