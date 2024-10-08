import 'package:flutter/cupertino.dart';
import 'package:flutter_google_books/auth/login_page/firebase/authentication.dart';
import 'package:flutter_google_books/book_details/book_details.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';
import 'package:flutter_google_books/common/typedef/search_list_args.dart';
import 'package:flutter_google_books/home_page/home_page.dart';
import 'package:flutter_google_books/search_list_page/search_list_page.dart';
import 'package:go_router/go_router.dart';

import 'auth/login_page/login_page.dart';


final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      redirect: (BuildContext context, GoRouterState state) async {
        final authentication = Authentication();
        final isSigned = await authentication.isSigned();

        if (isSigned) {
          return '/home';
        }

        return null;
      },
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          name: 'search_list_page',
          path: '/search_list_page',
          builder: (context, state) {
            final args = state.extra as SearchListArgs?;
            return SearchListPage(args: args!);
          },
        ),
        GoRoute(
          name: 'book_details',
          path: '/book_details',
          builder: (context, state) {
            final args = state.extra as VolumeInfo?;
            return BookDetails(args: args!);
          },
        ),
      ],
    ),
  ],
);
