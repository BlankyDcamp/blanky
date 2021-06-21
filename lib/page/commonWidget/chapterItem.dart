import 'package:blanky/page/commonFunction/numberParser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChapterItem extends StatelessWidget {
  final String title;
  final String description;
  final int rank;
  final String imageUrl;
  final VoidCallback onTap;

  ChapterItem(this.imageUrl, this.title, this.description, this.rank, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        margin: EdgeInsets.symmetric(vertical:0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 11,horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///사진
                CachedNetworkImage(
                  imageUrl: imageUrl,
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
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          description,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                          decoration: BoxDecoration(
                            color: Color(0x80e55cb3),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text(
                              "${NumberParser().parseNumber(rank)}▲",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFD0005)
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset("assets/icons/icon_arrow_down.svg"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}