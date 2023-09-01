import 'package:flutter/material.dart';
import 'package:udemy/Movies_app/movie_listDetails.dart';
import 'package:udemy/Movies_app/movie_model.dart';

class MovieList extends StatefulWidget {

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {

    final List<Movies> movieList = Movies.getMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
          return Stack(children: [
            movieCard(movieList[index], context),
            Positioned(
              top: 10.0,
                child: movieImage(movieList[index].images![0])),
          ], );
      }),
    );
  }
  Widget movieCard(Movies movie, BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 60,right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(movie.title.toString(),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.white
                      ),),
                    ),
                    Text("Rating: ${movie.imdbRating} / 10",style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Released: ${movie.released}",style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey
                    ),),
                    Text(movie.runtime.toString(),style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey
                    ),),
                    Text(movie.rated.toString(),style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie_details: movie.title.toString(),
          movies: movie,)));
         },
    );
  }
  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
