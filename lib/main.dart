import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const MaterialColor white = MaterialColor(
  0xFFEEEEEE,
  <int, Color>{
    50: Color(0xFFEEEEEE),
    100: Color(0xFFEEEEEE),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFEEEEEE),
    400: Color(0xFFEEEEEE),
    500: Color(0xFFEEEEEE),
    600: Color(0xFFEEEEEE),
    700: Color(0xFFEEEEEE),
    800: Color(0xFFEEEEEE),
    900: Color(0xFFEEEEEE),
  },
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController controller = PageController();

  Widget _search() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.headset_mic_rounded),
                    Icon(Icons.access_time_sharp),
                    Icon(Icons.seven_k_plus_outlined),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset('images/logo.png'),
        title: _search(),
      ),
      body: PageView(
        controller: controller,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 160.0, autoPlay: true, viewportFraction: 1.0),
                  items: [
                    ['1.jpg', 'AED 300/-'],
                    ['2.jpg', 'AED 500/-'],
                    ['1.jpg', 'AED 280/-'],
                    ['2.jpg', 'AED 100/-'],
                    ['1.jpg', 'AED 390/-'],
                  ].map((i) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.asset(
                          'images/${i[0]}',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.withOpacity(0.3),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                i[1],
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Card(
                                color: Colors.deepOrangeAccent,
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    '50% OFF',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Best practice Definition & Meaning',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          '   SHOP   ',
                          style: TextStyle(color: Colors.white),
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: ['1', '2', '3', '4', '5']
                        .map(
                          (e) => Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 8,
                                    ),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black87,
                                    ),
                                    child: const Icon(
                                      Icons.category,
                                      color: Colors.white,
                                      size: 70,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      'Main \n Category $e',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      textScaleFactor: const MediaQueryData()
                                          .textScaleFactor,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 5),
                  child: Text(
                    '#BEST TITLE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 830,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 10 / 19,
                    children: List.generate(
                      productImages.length,
                      (index) {
                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/' + productImages[index].image,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                              productImages[index].discount == ''
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0, top: 6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            productImages[index]
                                                    .price
                                                    .toString() +
                                                '/-',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Card(
                                            margin: const EdgeInsets.all(0),
                                            color: Colors.deepOrangeAccent,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                '  ' +
                                                    productImages[index]
                                                        .discount +
                                                    '%  ',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              Padding(
                                padding: productImages[index].discount == ''
                                    ? const EdgeInsets.only(left: 6.0, top: 6.0)
                                    : const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  productImages[index].price + '/-',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 5),
                                child: Text(
                                  productImages[index].title,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10.0, bottom: 5),
                  child: Text(
                    '#TOP TITLE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ['21.jpg', '1'],
                      ['23.jpg', '2'],
                      ['24.jpg', '3'],
                      ['21.jpg', '4'],
                      ['23.jpg', '5'],
                      ['24.jpg', '6'],
                    ]
                        .map(
                          (e) => Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 3.0,
                                right: 3.0,
                                bottom: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.pinkAccent,
                                          Colors.blueAccent,
                                          Colors.green,
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      width: 72,
                                      height: 72,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.asset(
                                          "images/" + e[0],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      '@_user' + e[1],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 10.0, bottom: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '#SHOP BY CATEGORY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: ['1', '2', '3', '4', '5']
                        .map(
                          (e) => Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 8,
                                    ),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child: const Icon(
                                      Icons.category,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0, left: 5.0),
                                    child: Text(
                                      'Sub Category   ',
                                      textAlign: TextAlign.center,
                                      textScaleFactor: const MediaQueryData()
                                          .textScaleFactor,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 830,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 10 / 19,
                    children: List.generate(
                      productImages.length,
                      (index) {
                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/' + productImages[index].image,
                                height: 170,
                                fit: BoxFit.cover,
                              ),
                              productImages[index].discount == ''
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0, top: 6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            productImages[index]
                                                    .price
                                                    .toString() +
                                                '/-',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Card(
                                            margin: const EdgeInsets.all(0),
                                            color: Colors.deepOrangeAccent,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                '  ' +
                                                    productImages[index]
                                                        .discount +
                                                    '%  ',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              Padding(
                                padding: productImages[index].discount == ''
                                    ? const EdgeInsets.only(left: 6.0, top: 6.0)
                                    : const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  productImages[index].price + '/-',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, top: 5),
                                child: Text(
                                  productImages[index].title,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text('Page 2'),
          const Text('Page 3'),
          const Text('Page 4'),
          const Text('Page 5'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          controller.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.category,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.shopping_bag,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.directions,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.api_sharp,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage {
  const ProductImage(
      {required this.price,
      required this.discount,
      required this.title,
      required this.image});

  final String title;
  final String image;
  final String price;
  final String discount;
}

const List<ProductImage> productImages = <ProductImage>[
  ProductImage(
    title: 'Product Service \n Title Product',
    image: '11.jpg',
    price: '20.00',
    discount: '40',
  ),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '12.jpg',
      price: '10.00',
      discount: ''),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '13.jpg',
      price: '50.00',
      discount: '22'),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '14.jpg',
      price: '10.90',
      discount: ''),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '11.jpg',
      price: '12.00',
      discount: '50'),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '12.jpg',
      price: '33.33',
      discount: '70'),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '13.jpg',
      price: '10.10',
      discount: '60'),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '14.jpg',
      price: '50.10',
      discount: ''),
  ProductImage(
      title: 'Product Service \n Title Product',
      image: '11.jpg',
      price: '10.11',
      discount: '10'),
];
