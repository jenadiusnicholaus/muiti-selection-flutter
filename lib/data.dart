import 'package:selecttechstacks/models.dart';

var techstackjson = [
  {
    'name': 'Python',
  },
  {
    'name': 'Node.js',
  },
  {
    'name': 'PHP',
  },
  {
    'name': 'JavaScripts',
  },
  {
    'name': 'Ruby on Rails,',
  },
  {
    'name': 'Flask',
  },
  {
    'name': 'MongoDB',
  },
  {
    'name': 'MSQL',
  },
  {
    'name': 'Postgresql',
  },
  {
    'name': 'Apache',
  },
  {
    'name': 'HTML',
  },
  {
    'name': 'CSS',
  },
  {
    'name': 'ReactJS',
  },
  {
    'name': 'Objective-C',
  },
  {
    'name': 'Swift',
  },
  {
    'name': 'Java',
  },
  {
    'name': 'Kotlin',
  },
  {
    'name': 'Rust',
  },
  {
    'name': 'Dart',
  },
  {
    'name': 'Flutter',
  },
  {
    'name': 'AWS',
  },
  {
    'name': 'Redis',
  },
  {
    'name': 'Linux',
  },
  {
    'name': 'Fast API',
  },
  {
    'name': 'DRF(Django Rest-API Framework)',
  },
  {
    'name': 'Jquery',
  },
];

Future<List<TechStacks>> getTeckstack() async {
  // Future.delayed(const Duration(milliseconds: 1500), () {
  //   // deleayed code here

  // });
  List<TechStacks> techStacks =
      techstackjson.map((e) => TechStacks.fromJson(e)).toList();

  return techStacks;
}
