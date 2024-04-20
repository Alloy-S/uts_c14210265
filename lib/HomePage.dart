import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts_c14210265/SearchPage.dart';
import 'CardBuilder.dart';
import './food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imagePaths = [
  'assets/food1.jpg',
  'assets/food2.jpg',
  'assets/food3.jpg',
  'assets/food4.jpg',
];

final List<String> imageNames = [
  'Thai Style',
  'Indo Style',
  'Japannese Style',
  'US Style',
];

final List<String> imagePlaces = [
  '12 Places',
  '24 Places',
  '15 Places',
  '17 Places',
];

late List<Widget> _pages;
late List<Widget> _cardPopular;

int _activePage = 0;

final pageController = PageController(initialPage: 0);

class ImagePlaceholder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceholder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}

class _HomePageState extends State<HomePage> {
  final searchControllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
        imagePaths.length,
        (index) => ImagePlaceholder(
              imagePath: imagePaths[index],
            ));

    _cardPopular = List.generate(
        listFood.length,
        (index) => CardBuilder(
              imagePath: listFood[index].imagePath,
              name: listFood[index].name,
              address: listFood[index].address,
              category: listFood[index].category,
              width: 170,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading:
        //     IconButton(onPressed: () {
        //       Navigator.pop(context);
        //     }, icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchControllerText,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                      hintText: "Search",
                      isDense: true,
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchControllerText.clear();
                        },
                      )),
                ),
              ),

              Stack(
                children: [
                  SizedBox(
                    // width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: imagePaths.length,
                        onPageChanged: (value) {
                          setState(() {
                            _activePage = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          // return image widget
                          return _pages[index];
                        }),
                  ),
                  // image indicator
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 15,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List<Widget>.generate(
                            _pages.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    onTap: () {
                                      pageController.animateToPage(
                                        index,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: _activePage == index
                                          ? Colors.amber
                                          : Colors.grey,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                  // image Label
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 0,
                    child: Container(
                        color: Colors.transparent,
                        child: Text(
                          imageNames[_activePage],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                        )),
                  ),
                  Positioned(
                    bottom: 13,
                    left: 20,
                    right: 0,
                    child: Container(
                        color: Colors.transparent,
                        child: Text(
                          imagePlaces[_activePage],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.0),
                        )),
                  ),
                ],
              ),

              // Most Popular
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: Text(
                      "Most Popular",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscoveryPage()));
                        // Navigator.pushNamed(context, 'Discover');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SearchPage(title: "Most Popular",)));

                        // Navigator.of(context).pushNamed('Discover');
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(color: Colors.blue[400], fontSize: 17),
                      ))
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listFood.length,
                    itemBuilder: (context, index) {
                      return _cardPopular[index];
                    }),
              ),

              // Most Popular
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: Text(
                      "Meal Deals",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SearchPage(title: "Meal Deals",)));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(color: Colors.blue[400], fontSize: 17),
                      ))
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listFood.length,
                    itemBuilder: (context, index) {
                      return _cardPopular[index];
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
