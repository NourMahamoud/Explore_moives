import 'package:cinemax/generated/ImagesAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/Data/Api/End_piont.dart';
import '../../../generated/Colors.dart';
import 'HomePageController.dart';

class Searchresltview extends StatefulWidget {
  const Searchresltview({super.key});

  @override
  State<Searchresltview> createState() => _SearchresltviewState();
}

class _SearchresltviewState extends State<Searchresltview> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: TextField(
                    onChanged: (val) => controller.getSearchFilm(val),
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: height * 0.03),
                      fillColor: AppColors.searchParColor,
                      hintText: 'Search by title..',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.05),
                        borderSide: BorderSide(color: AppColors.searchParColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * 0.05),
                        borderSide: BorderSide(color: AppColors.searchParColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.04,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                GetBuilder<HomePageController>(
                  builder: (con) {
                    return Container(
                      height: height * 0.8,
                      child: con.search_movie.isEmpty
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              imagespath.search,
                              height: height * 0.2,
                            ),
                            SizedBox(height: height * 0.03),
                            Text(
                              'We are sorry, we can\nnot find the movie :(',
                              style: TextStyle(
                                fontSize: height * 0.022,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              'Find your movie by typing title',
                              style: TextStyle(
                                fontSize: height * 0.016,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                          : ListView.builder(
                        itemCount: con.search_movie.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: height * 0.02),
                            child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(height * 0.02),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.03),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      height: height * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(height * 0.01),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: con.search_movie[index].poster_path == null
                                          ? Image.network(
                                        'https://www.prospecthill.com/wp-content/uploads/2016/09/film-2.jpg',
                                        fit: BoxFit.cover,
                                      )
                                          : Image.network(
                                        'https://image.tmdb.org/t/p/original/${con.search_movie[index].poster_path}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.04),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            con.search_movie[index].title ?? 'No Title',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month_outlined,
                                                color: Colors.grey,
                                                size: height * 0.02,
                                              ),
                                              SizedBox(width: width * 0.01),
                                              Text(
                                                con.search_movie[index].release_date ?? 'No Date',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: height * 0.016,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(imagespath.star,) ,
                                              Text('${con.search_movie[index].vote_average}',style: TextStyle(color: Colors.orange,fontSize: 15),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}