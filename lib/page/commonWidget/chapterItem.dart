import 'package:flutter/material.dart';

class ChapterItem extends StatelessWidget {
  final String title;
  final String description;
  final String rank;
  final VoidCallback onTap;

  ChapterItem(this.title, this.description, this.rank, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
            title: Text(title),
            subtitle: Text(description),
            trailing: Text(rank),
          ),
        ),
      ),
    );
  }
}