import 'package:flutter/material.dart';
import 'package:flutter_google_books/auth/login_page/firebase/authentication.dart';
import 'package:go_router/go_router.dart';

class HomePageDrawer extends StatelessWidget {
  final Authentication authentication;

  const HomePageDrawer({
    super.key,
    required this.authentication,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(title: Text('Menù'),),
        body: Column(
          children: [
            ListTile(
              onTap: () async => _signOut(context),
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async{
    await authentication.signOut();

    if(context.mounted){
      context.goNamed('/login');
    }
  }
}
