import 'dart:convert';

import 'package:cinemax/core/Data/Api/Api_consumer.dart';
import 'package:cinemax/core/Data/Api/End_piont.dart';
import 'package:dio/dio.dart';


class Dio_Consumer extends Api_Consumer {
  Dio dio =Dio() ;
  @override
  Future<Map<String, dynamic>> GetMovieDetailes({required int movieId})async {
   try {
     final response = await dio.get('https://api.themoviedb.org/3/movie/$movieId?language=en-US',options: Options(
     headers:{
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU"

      }
      )) ;
     return response.data ;
   } on Exception catch (e) {
     print('in dio  ================fuck') ;
     return {'error':e.toString()} ;
   }

  }

  @override
  Future  GetTrendingMovies()async{
    try {
      final response = await dio.get("https://api.themoviedb.org/3/trending/movie/day?language=en-US",
          options:
          Options(headers:{
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU"

          }) ) ;
      return response.data['results'] ;


    }catch (e){

      print(e) ;

    }
  }

  @override
  Future get({required String EndPiont, required Map<String, dynamic> query}) async {
      try {
        final  response = await dio.get('https://api.themoviedb.org/3/${EndPiont}',queryParameters: {
          "query": query,
        }, options: Options(
          headers:  {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
            'accept': 'application/json',
          },
        )) ;
        print(response.statusCode) ;
        return response.data['results'] ;
      } on Exception catch (e) {
        return e.toString() ;
      }
  }

  @override
  Future<String> getRequestToken()async {
    final response = await dio.get(
            '${End_piont.requestToken_Url}',
           options: Options(
           headers: {
              'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
              'accept': 'application/json',
            },
           ));

            if (response.statusCode == 200){
              final data = response.data;
              print('==========================================${data['request_token']}') ;
              return data['request_token'];
            }else {
              return '' ;
            }

  }

  @override
  Future<Map<String, dynamic>> post({required String EndPiont}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<String> postCreateSession({required String requestToken}) async{
    try{
      final response =await dio.post('${End_piont.session_Url}',options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
          'Content-Type': 'application/json',
        }
      ),data: {
          'request_token': requestToken,
      }) ;

        final data = response.data ;
        return data['session_id'] ;
    }catch(e){
         print(e) ;
         return e.toString() ;
    }

  }

  @override
  Future getMoviesByCategory(String end_piont)async {
     try{
       final response = await dio.get('https://api.themoviedb.org/3/movie/$end_piont?language=en-US&page=1',options: Options(
       headers: {
       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
       'accept': 'application/json',
       },
       )) ;
       return response.data['results'] ;
     }catch(e){
       return e.toString() ;
     }
  }

  @override
  Future GetdiscoverMoives() async{
    try {
      final response = await dio.get('${End_piont.movies_Url}',
          options:
          Options(headers:{
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU"

          }) );

      return response.data['results'] ;


    }catch (e){
      print(e) ;

    }}

}