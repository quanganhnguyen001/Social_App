import 'package:flutter/material.dart';

import '../config/const.dart';

class BottomSheetComponent {
  showBottomSheetComponent({
    context,
    String? option1,
    String? option2,
    String? option3,
    VoidCallback? press1,
    VoidCallback? press2,
    VoidCallback? press3,
  }) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(color: backGroundColor.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: press1,
                        child: Text(
                          option1.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    sizeVertical(7),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    sizeVertical(7),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: press2
                        // BlocProvider.of<AuthCubit>(context).loggedOut();
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, PageConst.signInPage, (route) => false);
                        ,
                        child: Text(
                          option2.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    sizeVertical(7),
                    const Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    sizeVertical(7),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: press3
                        // BlocProvider.of<AuthCubit>(context).loggedOut();
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, PageConst.signInPage, (route) => false);
                        ,
                        child: Text(
                          option3.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
