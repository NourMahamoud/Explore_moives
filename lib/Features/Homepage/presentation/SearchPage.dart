import 'package:cinemax/Features/Homepage/presentation/searchResltView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/Colors.dart';
import '../../../generated/ImagesAssets.dart';
import 'HomePageController.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * 0.02),
                  ),
                  color: AppColors.searchParColor,
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text(
                      'Search by title..',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Get.to(Searchresltview());
                    },
                  ),
                ),
                Text(
                  'Discover',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  width: double.infinity,
                  height: 0.8 * height,
                  child: GetBuilder<HomePageController>(
                    init: HomePageController(),
                    builder: (con) {
                      return Container(
                        child: con.discover_movies.length == 0
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: con.discover_movies.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: height * 0.02,
                                    ),
                                    child: Card(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          height * 0.02,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(width * 0.03),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width * 0.25,
                                              height: height * 0.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      height * 0.01,
                                                    ),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child:
                                                  con
                                                          .discover_movies[index]
                                                          .poster_path ==
                                                      null
                                                  ? Image.network(
                                                      'https://www.prospecthill.com/wp-content/uploads/2016/09/film-2.jpg',
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.network(
                                                      'https://image.tmdb.org/t/p/original/${con.discover_movies[index].poster_path}',
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            SizedBox(width: width * 0.04),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    con
                                                            .discover_movies[index]
                                                            .title ??
                                                        'No Title',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: height * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_month_outlined,
                                                        color: Colors.grey,
                                                        size: height * 0.02,
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Text(
                                                        con
                                                                .discover_movies[index]
                                                                .release_date ??
                                                            'No Date',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                              height * 0.016,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        imagespath.star,
                                                      ),
                                                      Text(
                                                        '${controller.discover_movies[index].vote_average}',
                                                        style: TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 15,
                                                        ),
                                                      ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
