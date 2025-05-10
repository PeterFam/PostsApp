import 'package:flutter/material.dart';

import '../../data/model/post.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget buildPostItem(Post post) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 220.0,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      image: DecorationImage(
                          image: NetworkImage(post.image!),
                          fit: BoxFit.fitWidth)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(post.owner!.picture!))),
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              "${post.owner!.firstName!} ${post.owner!.lastName!}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        timeago.format(DateTime.parse(post.publishDate!)),
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    post.text!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${post.tags?.join(", ")}",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
