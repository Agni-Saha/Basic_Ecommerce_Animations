import 'package:ecommerce_animations/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String title, tag, image;
  const CategoryPage({
    Key? key,
    required this.title,
    required this.tag,
    required this.image,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(
                title: widget.title,
                tag: widget.tag,
                image: widget.image,
              ),
              BodySection(
                title: widget.title,
                tag: widget.tag,
                image: widget.image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final String title, tag, image;
  const HeroSection({
    Key? key,
    required this.title,
    required this.tag,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        child: Container(
          height: 304,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeAnimation(
                          0.6,
                          IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        FadeAnimation(
                          0.6,
                          IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        FadeAnimation(
                          0.6,
                          IconButton(
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                FadeAnimation(
                  0.6,
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
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

class BodySection extends StatelessWidget {
  final String title, tag, image;
  const BodySection({
    Key? key,
    required this.title,
    required this.tag,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FadeAnimation(
            0.8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New product",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "View More",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const FadeAnimation(
            0.6,
            MakeProductList(),
          ),
        ],
      ),
    );
  }
}

class MakeProductList extends StatelessWidget {
  final List<Map<String, String>> products = const [
    {
      "image": "assets/images/tech.jpg",
      "title": "Tech",
      "price": '100\$',
    },
    {
      "image": "assets/images/watch.jpg",
      "title": "Watches",
      "price": '90\$',
    },
    {
      "image": "assets/images/clothes-1.jpg",
      "title": "Clothes",
      "price": '80\$',
    },
    {
      "image": "assets/images/beauty-1.jpg",
      "title": "Beauty",
      "price": '70\$',
    },
    {
      "image": "assets/images/perfume.jpg",
      "title": "Perfume",
      "price": '60\$',
    },
  ];

  const MakeProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(products[index]["image"]!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FadeAnimation(
                0.4,
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        0.5,
                        Text(
                          products[index]["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FadeAnimation(
                        0.6,
                        Text(
                          products[index]["price"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FadeAnimation(
                    1,
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 24,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
