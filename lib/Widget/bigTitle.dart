import 'package:flutter/material.dart';
import 'package:fluttermovies/Screen/detailScreen.dart';
import 'package:fluttermovies/custom/verticalSpace.dart';

class BigMOvieWidget extends StatelessWidget {
  final String gmbar;
  final String title;
  final String tanggal;
  final String urell;
  final String deskrip;

  BigMOvieWidget({
    required this.gmbar,
    required this.tanggal,
    required this.title,
    required this.urell,
    required this.deskrip,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle styleF = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    );
    TextStyle style2 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 9,
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName,
            arguments: [title, gmbar, urell, deskrip, tanggal]);
      },
      child: Card(
        child: SizedBox(
          width: 120,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(gmbar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: styleF,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        tanggal,
                        style: style2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
