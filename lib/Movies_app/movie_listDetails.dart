import 'package:flutter/material.dart';
import 'package:udemy/Movies_app/movie_model.dart';

class MovieDetails extends StatefulWidget {

  final String movie_details;
  final Movies movies;

  const MovieDetails({Key? key, required this.movie_details, required this.movies}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: widget.movies.images![0]),
          MovieDetailsHeaderwithPoster(movie: widget.movies),
          HorizontalLine(),
          MovieDetailsCast(movies: widget.movies),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: widget.movies.images!.toList(),)
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {

   final String thumbnail;

  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover
                )
              ),
            ),
            Icon(Icons.play_circle_outlined,size: 100,color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderwithPoster extends StatelessWidget {

  final Movies movie;

  const MovieDetailsHeaderwithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster:movie.images![0].toString()),
          SizedBox(width: 16),
          Expanded(
            child: MovieDetailsHeader(movie:movie),
          )
        ],
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {

  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10.0));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(poster),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {

  final Movies movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.w400,
        color: Colors.cyan),),
        Text(movie.title.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30.0),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 12,fontWeight: FontWeight.w300
        ),children: [
          TextSpan(
            text: movie.plot
          ),
          TextSpan(text: "more...",style: TextStyle(color: Colors.indigoAccent))
        ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {

  final Movies movies;

  const MovieDetailsCast({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movies.actors.toString()),
          MovieField(field: "Directors", value: movies.director.toString()),
          MovieField(field: "Awards", value: movies.awards.toString(),)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {

  final String field;
  final String value;

  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field : ",style: TextStyle(
          color: Colors.black38,
          fontSize: 12, fontWeight: FontWeight.w300
        ),),
        Expanded(child: Text(value,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300),))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {

  final List<String> posters;

  const MovieDetailsExtraPosters({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text("More Movie Posters".toUpperCase(),
          style: TextStyle(fontSize: 14,color: Colors.black26),),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(posters[index]),
                  fit: BoxFit.cover)
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}







