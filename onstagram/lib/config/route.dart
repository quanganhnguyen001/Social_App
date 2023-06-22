import 'package:flutter/material.dart';
import 'package:onstagram/config/const.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/presentation/auth/page/sign_in.dart';
import 'package:onstagram/features/presentation/auth/page/sign_up.dart';
import 'package:onstagram/features/presentation/comment/page/comment_page.dart';
import 'package:onstagram/features/presentation/home/page/edit_post_page.dart';
import 'package:onstagram/features/presentation/profile/page/edit_profile.dart';
import 'package:onstagram/features/presentation/profile/widget/more_info_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case PageConst.editProfilePage:
        {
          if (args is UserEntity) {
            return routeBuider(EditProfile(
              currentUser: args,
            ));
          } else {
            return routeBuider(NoPageFound());
          }
        }
      case PageConst.editPostPage:
        {
          return routeBuider(const EditPostPage());
        }
      case PageConst.commentPage:
        {
          return routeBuider(const CommentPage());
        }
      case PageConst.signInPage:
        {
          return routeBuider(const SignInPage());
        }
      case PageConst.signUpPage:
        {
          return routeBuider(const SignUpPage());
        }
      case PageConst.morInfoPage:
        {
          if (args is UserEntity) {
            return routeBuider(MoreInfoPage(
              currentUser: args,
            ));
          } else {
            return routeBuider(NoPageFound());
          }
        }
      default:
        {
          const NoPageFound();
        }
    }
  }
}

dynamic routeBuider(Widget child) {
  return MaterialPageRoute(builder: ((context) => child));
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Page Found'),
      ),
      body: const Center(
        child: Text('Page Not Found'),
      ),
    );
  }
}
