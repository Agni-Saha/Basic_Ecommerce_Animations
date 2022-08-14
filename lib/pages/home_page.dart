import 'package:ecommerce_animations/animations/fade_animation.dart';
import 'package:ecommerce_animations/pages/category_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopPortion(),
            BottomPortion(),
          ],
        ),
      ),
    );
  }
}

class TopPortion extends StatelessWidget {
  const TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.2,
      Container(
        height: 504,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeAnimation(
                      0.2,
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      0.3,
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FadeAnimation(
                        0.5,
                        Text(
                          "Our new products",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FadeAnimation(
                        0.7,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "VIEW MORE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomPortion extends StatelessWidget {
  final List<Map<String, String>> categories = const [
    {
      "image": "assets/images/beauty.jpg",
      "title": "Beauty",
    },
    {
      "image": "assets/images/clothes.jpg",
      "title": "Clothes",
    },
    {
      "image": "assets/images/perfume.jpg",
      "title": "Perfumes",
    },
    {
      "image": "assets/images/glass.jpg",
      "title": "Glasses",
    },
  ];

  final List<Map<String, String>> bestSellingCategories = const [
    {
      "image": "assets/images/tech.jpg",
      "title": "Tech",
    },
    {
      "image": "assets/images/watch.jpg",
      "title": "Watches",
    },
    {
      "image": "assets/images/clothes-1.jpg",
      "title": "Clothes",
    },
    {
      "image": "assets/images/beauty-1.jpg",
      "title": "Beauty",
    },
  ];

  const BottomPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.4,
      Container(
        padding: const EdgeInsets.all(24),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("All"),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            MakeCategories(
              categories: categories,
              aspectRatio: 2 / 2.2,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Best Selling",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("All"),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            MakeCategories(
              categories: bestSellingCategories,
              aspectRatio: 3 / 2.2,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class MakeCategories extends StatelessWidget {
  final List<Map<String, String>> categories;
  final double aspectRatio;

  const MakeCategories({
    Key? key,
    required this.categories,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152,
      width: double.infinity,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: aspectRatio,
          child: Hero(
            tag: categories[index]["image"]!,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CategoryPage(
                      image: categories[index]["image"]!,
                      tag: categories[index]["image"]!,
                      title: categories[index]["title"]!,
                    ),
                  ),
                );
              },
              child: Material(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(categories[index]["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.01),
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      categories[index]["title"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
