import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_books/book_details/book_details.dart';
import 'package:flutter_google_books/home_page/home_page.dart';
import 'package:flutter_google_books/search_list_page/search_list_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        textTheme: GoogleFonts.spaceGroteskTextTheme(textTheme),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/search_list_page': (_) => const SearchListPage(),
        '/book_details': (_) => const BookDetails()
      }
    );
  }
}
