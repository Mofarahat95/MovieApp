import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/constant.dart';
import '../../../../model/detail/Details.dart';
import '../../../../providers/save_provider.dart';
import 'detailss.dart';

class ReleaseBook extends StatefulWidget {
  const ReleaseBook(this.details, {super.key});
  final Details details;
  @override
  State<ReleaseBook> createState() => _ReleaseBookState();
}

class _ReleaseBookState extends State<ReleaseBook> {
  @override
  Widget build(BuildContext context) {
    SaveMovieProvider saveMovie = Provider.of<SaveMovieProvider>(context);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MovieDetails.routName, arguments: widget.details);
          },
          child: Image.network(
            "${Constant.imagePathe}${widget.details.posterPath}",
            width: 100,
            height: 140,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          right: 59,
          bottom: 88,
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
// var model = Details(
//     title: "${widget.details.title}",
//     releaseDate: "${widget.details.releaseDate}",
//     posterPath: "${widget.details.posterPath}");
// await FireStoreUtils.addDataToFireStore(model);
// isSave = ("assets/images/bookmarkright.png");
// setState(() {});
