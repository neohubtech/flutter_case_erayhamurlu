import 'package:flutter/material.dart';
import 'package:test_app/const/text_const.dart';
import 'package:test_app/view_model/home_view_model.dart';
import 'package:test_app/widgets/banner_widget.dart';
import 'package:test_app/widgets/combined_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel _homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(home),
          automaticallyImplyLeading: false, // This line hides the back button
        ),
        body: FutureBuilder(
          future: _homeViewModel.getHomeData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // Horizontal list
                  SizedBox(
                    height: 150,
                    child: snapshot.data!.bannerList.isEmpty
                        ? const Text(tryAgainLaterText)
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.bannerList.length,
                            itemBuilder: (context, index) {
                              return BannerWidget(bannerModel: snapshot.data!.bannerList[index]);
                            },
                          ),
                  ),
                  // Vertical list
                  Expanded(
                    child: snapshot.data!.combinedList.isEmpty
                        ? const Text(tryAgainLaterText)
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.combinedList.length,
                            itemBuilder: (context, index) {
                              return CombinedWidget(combinedModel: snapshot.data!.combinedList[index]);
                            },
                          ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
