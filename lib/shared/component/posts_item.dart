import 'package:flutter/material.dart';

Widget buildPostItem(posts) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: NetworkImage(
               '${posts['image']}'),
                fit: BoxFit.cover
            )
        ),
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('${posts['text']}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
            Text('${posts['publishDate']}', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey),),
            Text('Title', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),)
          ],
        ),
      )
    ],
  ),
);