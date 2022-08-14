import 'package:ecommerce_animations/animations/fade_animation.dart';
import 'package:ecommerce_animations/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  bool hide = false;

  @override
  void initState() {
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );

    scaleAnimation = Tween<double>(
      begin: 1,
      end: 30,
    ).animate(scaleController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.of(context).push(
              // PageTransition(
              //   type: PageTransitionType.fade,
              //   child: const HomePage(),
              // ),
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          }
        },
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FadeAnimation(
                  1.5,
                  Text(
                    "Brand New Perspective",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const FadeAnimation(
                  1.3,
                  Text(
                    "Let's start with our summer collection.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: scaleAnimation.value,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: (hide == false)
                                ? const Text(
                                    "Get Started",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FadeAnimation(
                  1.7,
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
