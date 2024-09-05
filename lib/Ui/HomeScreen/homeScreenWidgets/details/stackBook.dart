import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/constant.dart';
import '../../../../model/detail/Details.dart';
import '../../../../providers/save_provider.dart';
import 'detailss.dart';

class StackBook extends StatefulWidget {
   const StackBook(this.details,{super.key});
final Details details;

  @override
  State<StackBook> createState() => _StackBookState();
}

class _StackBookState extends State<StackBook> {
  @override
  Widget build(BuildContext context) {
    SaveMovieProvider saveMovie = Provider.of<SaveMovieProvider>(context);
    return  Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
                MovieDetails.routName,
                arguments: widget.details);
          },
          child: Image.network(
            "${Constant.imagePathe}${widget.details.posterPath}",
            width: 105,
            height: 130,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          // left:1,
          //top: ,
          right: 62,
          bottom: 83,
          child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async {
                saveMovie.bookmarkButtonPressed(widget.details);

              },
              child: Image.asset(
                (widget.details.isFavorite)
                    ? "assets/images/bookmarkright.png"
                    : "assets/images/bookmark.png",
              )),
        )
      ],
    );
  }
}
