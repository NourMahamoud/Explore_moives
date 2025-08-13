import 'dart:async';

import 'package:cinemax/Features/ShowFilm/presention/controllers/showFilmController.dart';
import 'package:cinemax/core/Data/Api/End_piont.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ShowFilm/presention/ui/showdetilesfilm.dart';
import '../domain/Entity/Entitiy.dart';
import '../domain/Use_Case/useCase.dart';

class HomePageController extends  GetxController {
  int selected  =0 ;
  int page =0 ;
  late final PageController pageController ;
  late final searchController  ;
  final userName =  FirebaseAuth.instance.currentUser!.displayName ;
  List <Map<String,dynamic>> MovieLists   =[
    {
      'title' : 'Now Playing' ,
       'parameter' : 'now_playing',
    } ,
    {
      'title' : 'Popular' ,
       'parameter' : 'popular',
    },
    {
      'title' : 'Top Rated' ,
       'parameter' : 'top_rated',
    },{
      'title' : 'Up Coming' ,
       'parameter' : 'upcoming',
    },
  ] ;

   List  trending_movies =<Film_Entity>[].obs() ;
   List  discover_movies =<Film_Entity>[].obs() ;
  List  movies_by_category =<Film_Entity>[].obs() ;
  List search_movie =<Film_Entity>[].obs() ;


  Future <void> getDiscoverMovies() async {
    final response = await FilmUseCase().getDiscoverMovies() ;
    response.fold((films)async{
    discover_movies .assignAll(Film_Entity.movies_entity_discover) ;
      update() ;
    }, (failure){
      print(failure.errMessage) ;

    }) ;

  }Future <void> getTrendingMovies() async {
    final response = await FilmUseCase().getTrendingMovies() ;
    response.fold((films)async{
    trending_movies.assignAll(Film_Entity.movies_entity_trending) ;
      update() ;
    }, (failure){
      print(failure.errMessage) ;

    }) ;

  }


  Future<void> getFilmByParameter (String parameter , int index)async  {
    selected = index ;
    final  response = await FilmUseCase().getListFilm(parameter) ;
    response.fold((films)async{
      movies_by_category= [] ;
     await Future.delayed(Duration(seconds: 3)) ;
      movies_by_category.assignAll(Film_Entity.movies_entity_by_category) ;
      print(movies_by_category) ;
      update() ;
    }, (failure){
      print(failure.errMessage) ;

    }) ;
    update() ;
  }
  Future <void> getSearchFilm (String title) async {
    Map <String,dynamic> query = {
      "title" : "$title"
    } ;
    final response = await FilmUseCase().getSearchFilm(End_piont.searchMovies, query) ;
    response.fold((data)async{
      await Future.delayed(Duration(seconds: 2)) ;
      search_movie.assignAll(Film_Entity.search_results) ;
      print(search_movie.first.poster_path) ;
      print(search_movie.length) ;
      update() ;
    }, (failure){
      print(failure.errMessage) ;
    }) ;
  }

   void changePage(int index) {
     if (index == 0) {
       pageController.jumpToPage(0);
       page = 0 ;
       update() ;
     } else if (index == 1) {
       pageController.jumpToPage(1);
       getDiscoverMovies() ;
       page = 1 ;
       update() ;
     } else if (index == 2) {
       pageController.jumpToPage(2);
       page = 2 ;
       update() ;
     }
   }
   void Search (){
      getTrendingMovies() ;
     pageController.jumpToPage(1) ;
     page = 1 ;
     update() ;
   }
   void ShowDetlies (int id,context) async{
   Navigator.of(context).push( MaterialPageRoute(builder: (context)=>Showdetilesfilm(id: id,))) ;

   }
  @override
  void onInit() {
    pageController = PageController(initialPage: 0) ;
    searchController = TextEditingController() ;
    getTrendingMovies() ;
    getFilmByParameter(MovieLists[0]['parameter'], 0) ;
    update() ;
    super.onInit();

  }



  @override
  void dispose() {
    searchController.dispose() ;
    pageController.dispose() ;
    super.dispose();
  }



}