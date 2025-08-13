import 'package:flutter/material.dart';

import '../../../core/Data/Api/End_piont.dart';
import '../../../generated/Colors.dart';
import 'package:cinemax/Features/Homepage/presentation/HomePageController.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../generated/ImagesAssets.dart';


class home extends StatefulWidget {

  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final HomePageController controller = Get.put(HomePageController()) ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(

              children: [
                CircleAvatar(
                  child:ClipOval(child: SizedBox.fromSize(
                    size: Size.fromRadius(40),
                    child: Image.asset('${imagespath.human}', fit: BoxFit.cover),
                  ),),
                  radius: 25,
                ),
                Container(
                  width: width*0.7,
                  child: ListTile(
                    title: Text('${controller.userName}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    subtitle: Text('Let’s stream your favorite movies',style: TextStyle(color: Color(0xFF92929D),fontSize: 12,fontWeight: FontWeight.normal),) ,
                  ),
                )

              ],

            ),
            Container(
                height: 200,
                width: double.infinity,
                child:
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.trending_movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        controller.ShowDetlies(controller.trending_movies[index].id,context) ;
                      },
                      child:  Card(
                          color: AppColors.homePageColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            // Adjust the radius as needed
                          ),
                          clipBehavior: Clip.antiAlias,
                          elevation: 10.0,
                          surfaceTintColor: Colors.white,
                          shadowColor: Colors.black,
                          child: Stack(
                            fit: StackFit.passthrough,
                            //alignment: Alignment.bottomLeft,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              Container(
                                child  : Image.network('${End_piont.imagePath}${controller.trending_movies[index].poster_path}',

                                  width: 295,
                                  height: 154,
                                  fit: BoxFit.fill,
                                ),) ,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  alignment: Alignment.centerLeft,
                                  child: Text('${controller.trending_movies[index].title}',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,),textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),),),
                              ),
                            ],
                          ))

                      ,

                    ) ;
                  },

                )) ,
            Text('Categories',style: TextStyle(color: Colors.white,fontSize: 18.5,fontWeight: FontWeight.bold),),
            Container(
              height: 50,
              child:ListView.builder(
                itemCount: controller.MovieLists.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GetBuilder<HomePageController>(
                        init: HomePageController(),
                        builder: (con) {
                          return ChoiceChip(
                            label: Text(
                              '${con.MovieLists[index]['title']}',
                              style: TextStyle(
                                color: index == con.selected ? Colors.white : Colors.white.withOpacity(0.7),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            selected: index ==con.selected,
                            selectedColor: AppColors.IndectorElipilce,
                            backgroundColor: AppColors.homePageColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onSelected: (bool selected) {
                              print(con.selected) ;
                              con.getFilmByParameter(con.MovieLists[index]['parameter'], index);

                            },
                          );
                        }
                    ),
                  );
                },
              ),

            ),
            Container(
              height:231,
              width: double.infinity,
              child:
              GetBuilder<HomePageController>(
                  init: HomePageController(),
                  builder: (con) {

                    return   con.movies_by_category.length== 0 ?Center(child: CircularProgressIndicator()) : ListView.builder(
                      itemCount:   con.movies_by_category.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          onTap: (){
                            controller.ShowDetlies(index,context) ;
                          },
                          child: SizedBox(
                              width: 135,
                              height: 178,
                              child : Card(
                                color: AppColors.searchParColor ,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  // Adjust the radius as needed
                                ),
                                clipBehavior: Clip.antiAlias,
                                elevation: 10.0,
                                surfaceTintColor: Colors.white,
                                shadowColor: Colors.black,
                                child:Column(
                                  children: [
                                    Stack(


                                      children: [
                                        Container(
                                            child  : Image.network('${End_piont.imagePath}${con.movies_by_category[index].poster_path}',width:135,
                                              height: 178,
                                              fit: BoxFit.fill, ) ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 64.3,
                                            decoration: BoxDecoration(
                                              color: AppColors.starBox,
                                              borderRadius: BorderRadius.circular(10),

                                            ),
                                            height: 24,
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              children: [
                                                Image.asset(imagespath.star,) ,
                                                Text('${controller.movies_by_category[index].vote_average}',style: TextStyle(color: Colors.orange,fontSize: 10),)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ) ,
                                    Expanded(child: Text('${controller.movies_by_category[index].title}',style: TextStyle(color: Colors.white,fontSize: 16),))
                                  ],
                                ),
                              )

                          ),

                        ) ;
                      },


                    ) ;
                  }) ,)

          ],
        ),
      ),

    );
  }
}