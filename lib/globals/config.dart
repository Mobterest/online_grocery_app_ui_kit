import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const String FONT_FAMILY = "Poppins";
const String BG_IMAGE = "assets/bg.png";
const String ICON_IMAGE = "assets/cart.png";
const String MAP_IMG = 'assets/map.png';
const String CART_IMG = 'assets/add_to_cart.png';
const String VISA_IMG = 'assets/visa.png';
const String SUX_IMG = 'assets/success.png';
const List MONTHS = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
const List YEARS = ['2021', '2022', '2023', '2024'];
const List<Map<String, dynamic>> GROCERIES = [
  {
    'image': "assets/groceries/001-beetroot.png",
    'name': "Beetroot",
    'price': "15",
    'measure': 'grams',
    'bg': Color(0xFFFFF0FF),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'name': "A Spring Surprise",
    'price': "40% OFF",
    'description': 'Use The Code Above For Spring Collection Surprise',
    'code': 'FOODLY',
    'bg': Color(0xFFEBEFF3),
    'staggeredTile': StaggeredTile.count(2, 2),
    'type': 2
  },
  {
    'image': "assets/groceries/002-carrot.png",
    'name': "Carrot",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFFFF391),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/003-apple.png",
    'name': "Apple",
    'price': "25",
    'measure': 'grams',
    'bg': Color(0xFFff80a4),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'name': "Holiday Sale",
    'price': "65% OFF",
    'description': 'Crazy deals available now',
    'code': 'HOT DEAL',
    'bg': Color(0xFFffe4e4),
    'staggeredTile': StaggeredTile.count(2, 2),
    'type': 2
  },
  {
    'image': "assets/groceries/004-apricot.png",
    'name': "Apricot",
    'price': "15",
    'measure': 'grams',
    'bg': Color(0xFFFffc975),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/005-avocado.png",
    'name': "Avocado",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFb1c370),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/006-bananas.png",
    'name': "Bananas",
    'price': "10",
    'measure': 'grams',
    'bg': Color(0xFFffffc9),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/007-Bell pepper.png",
    'name': "Bell Pepper",
    'price': "8",
    'measure': 'grams',
    'bg': Color(0xFFe5ff8b),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/008-berry.png",
    'name': "Berry",
    'price': "17",
    'measure': 'grams',
    'bg': Color(0xFFff718e),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/009-blueberry.png",
    'name': "Blueberry",
    'price': "8",
    'measure': 'grams',
    'bg': Color(0xFFbebbff),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/010-eggplant.png",
    'name': "Eggplant",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFf38fff),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/011-broccoli.png",
    'name': "Broccoli",
    'price': "10",
    'measure': 'grams',
    'bg': Color(0xFFb8f679),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/012-Capsicum.png",
    'name': "Capsicum",
    'price': "11",
    'measure': 'grams',
    'bg': Color(0xFFffff55),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/013-cauliflower.png",
    'name': "Cauliflower",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFffffff),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/014-corn.png",
    'name': "Corn",
    'price': "15",
    'measure': 'grams',
    'bg': Color(0xFFfffb95),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/015-dragon fruit.png",
    'name': "Dragon Fruit",
    'price': "25",
    'measure': 'grams',
    'bg': Color(0xFFffc9e9),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/017-garlic.png",
    'name': "Garlic",
    'price': "20",
    'measure': 'grams',
    'bg': Color(0xFFffffff),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/018-green-chili-pepper.png",
    'name': "Chilli pepper",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFddff91),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/019-okra.png",
    'name': "Okra",
    'price': "35",
    'measure': 'grams',
    'bg': Color(0xFFc7f682),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/020-lemon.png",
    'name': "Lemons",
    'price': "15",
    'measure': 'grams',
    'bg': Color(0xFFffff8d),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/021-mango.png",
    'name': "Mangoes",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFffff9b),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/022-orange.png",
    'name': "Oranges",
    'price': "7",
    'measure': 'grams',
    'bg': Color(0xFFffee88),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/023-papaya.png",
    'name': "Papaya",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFffffa9),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/024-pear.png",
    'name': "Pears",
    'price': "11",
    'measure': 'grams',
    'bg': Color(0xFFf9ff93),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/025-pomegranate.png",
    'name': "Pomegranate",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFff8d8d),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/026-pumpkin.png",
    'name': "Pumpkin",
    'price': "13",
    'measure': 'grams',
    'bg': Color(0xFFfff391),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/027-rose-apple.png",
    'name': "Rose Apples",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFffd0e5),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/028-strawberry.png",
    'name': "Strawberries",
    'price': "17",
    'measure': 'grams',
    'bg': Color(0xFFff7c6f),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/029-tomato.png",
    'name': "Tomatoes",
    'price': "5",
    'measure': 'grams',
    'bg': Color(0xFFff8d8d),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  },
  {
    'image': "assets/groceries/030-watermelon.png",
    'name': "Watermelon",
    'price': "15",
    'measure': 'grams',
    'bg': Color(0xFFffffb3),
    'staggeredTile': StaggeredTile.count(2, 3),
    'type': 1,
    'count': 1
  }
];
