
import 'package:flutter/material.dart';
import 'package:lets_chat/features/app/const/page_const.dart';
import 'package:lets_chat/features/app/home/contacts_page.dart';
import 'package:lets_chat/features/app/settings/settings_page.dart';
import 'package:lets_chat/features/call/presentation/pages/call_contacts_page.dart';
import 'package:lets_chat/features/chat/domain/entities/message_entity.dart';
import 'package:lets_chat/features/chat/presentation/pages/single_chat_page.dart';
import 'package:lets_chat/features/status/domain/entities/status_entity.dart';
import 'package:lets_chat/features/status/presentation/pages/my_status_page.dart';
import 'package:lets_chat/features/user/domain/entities/user_entity.dart';
import 'package:lets_chat/features/user/presentation/pages/edit_profile_page.dart';

class OnGenerateRoute {

  static Route<dynamic>? route(RouteSettings settings) {
    final args  = settings.arguments;
    final name = settings.name;

    switch(name){
      case PageConst.contactUsersPage: 
      {
        if(args is String){
          return materialPageBuilder(ContactsPage(uid: args,));
        } else{
          return materialPageBuilder( const ErrorPage());
        }

      }
      case PageConst.settingsPage:
        {
          if(args is String) {
            return materialPageBuilder( SettingsPage(uid: args));
          } else {
            return materialPageBuilder( const ErrorPage());
          }
        }
      case PageConst.editProfilePage:
        {
          if(args is UserEntity) {
            return materialPageBuilder( EditProfilePage(currentUser: args));
          } else {
            return materialPageBuilder( const ErrorPage());
          }
        }
      case PageConst.callContactsPage:
        {
          return materialPageBuilder(const CallContactsPage());
        }
      case PageConst.myStatusPage: {
        if(args is StatusEntity) {
          return materialPageBuilder( MyStatusPage(status: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
      }
      case PageConst.singleChatPage:
        {

          if(args is MessageEntity) {
            return materialPageBuilder( SingleChatPage(message: args));
          } else {
            return materialPageBuilder( const ErrorPage());
          }

        }
    }
  }

}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}