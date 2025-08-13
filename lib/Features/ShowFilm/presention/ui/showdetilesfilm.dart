import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/Data/Api/End_piont.dart';
import '../../../../generated/Colors.dart';
import '../../../../generated/ImagesAssets.dart';
import '../controllers/showFilmController.dart';

class Showdetilesfilm extends StatefulWidget {
  final int id ;
  const Showdetilesfilm({super.key, required this.id});

  @override
  State<Showdetilesfilm> createState() => _ShowdetilesfilmState();
}

class _ShowdetilesfilmState extends State<Showdetilesfilm> {
  ShowFilm_Controller  showFilm_Controller = Get.put(ShowFilm_Controller()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      body: SafeArea(child: GetBuilder<ShowFilm_Controller>(
        init: ShowFilm_Controller(),
        initState: (con) {
          showFilm_Controller.detilesMovie(widget.id) ;
        },
        builder: (con) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('${End_piont.imagePath}${con.data.background}'),fit: BoxFit.fill,)
                  )
                  ,
                  child:  ClipRRect(
                    // make sure we apply clip it properly
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey.withOpacity(0.1),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.pop(context) ;
                                }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                                Text('${showFilm_Controller.data.title}',style: Theme.of(context).textTheme.titleMedium,),
                                IconButton(onPressed: (){
                                  con.addToFavorite(widget.id) ;
                                }, icon: Icon(Icons.favorite,color: con.isFavorite ? Colors.red : Colors.white,))

                              ],
                            ) ,
                            SizedBox(
                              height: 300,

                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  // Adjust the radius as needed

                                ),
                                  child: Image.network('${End_piont.imagePath}${showFilm_Controller.data.poster}',fit: BoxFit.cover,) ,

                                ),


                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('${showFilm_Controller.data.relase_data}',style: Theme.of(context).textTheme.titleMedium,) ,

                                Text('${showFilm_Controller.data.type[0]['name']}',style: Theme.of(context).textTheme.titleMedium,) ,
                                Text('${showFilm_Controller.data.deuration} Minutes',style: Theme.of(context).textTheme.titleMedium,) ,

                              ],
                            ) ,
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(imagespath.star,) ,
                                  Text('${showFilm_Controller.data.avarageRate}',style: TextStyle(color: Colors.orange,fontSize: 15),)
                                ],
                              ),

                            ) ,





                          ],
                        ) ,
                      ),
                    ),
                  ),


                ) ,
                Text('OverView',style: Theme.of(context).textTheme.titleMedium,),
                Text('On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.',style: Theme.of(context).textTheme.bodyMedium,)  ,
                Row(
                  children: [
                    StarRating(
                      rating: con.rate,
                      allowHalfRating: true,
                      borderColor: Colors.grey, // Color for empty icons
                      onRatingChanged:con.addRate,
                    ),

                    ElevatedButton(onPressed: (){}, child: Text('Post rate',style: Theme.of(context).textTheme.titleMedium,),style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.NavagitionBottom,
                    ))
                  ],
                )

              ],
            ),
          );
        }
      )),
    );

  }
}
