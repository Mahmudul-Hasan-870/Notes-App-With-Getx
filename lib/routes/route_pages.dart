import 'package:get/get.dart';
import 'package:gets/routes/route_names.dart';
import 'package:gets/views/HomePage/home_page.dart';
import 'package:gets/views/NotesPage/notes_page.dart';

class RoutePages {
  static List<GetPage<dynamic>>? route = [
    GetPage(name: RouteNames.home, page: () => const Homepage()),
    GetPage(name: RouteNames.notes_screen, page: () => const NotesPage()),
  ];
}
