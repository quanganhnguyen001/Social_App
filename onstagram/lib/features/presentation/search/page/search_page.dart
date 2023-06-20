import 'package:flutter/material.dart';

import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/presentation/search/widget/search_widget.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchWidget(controller: _searchController),
                sizeVertical(10),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: secondaryColor,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
