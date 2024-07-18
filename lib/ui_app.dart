import 'package:day3/animation.dart';
import 'package:day3/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UIApp extends StatefulWidget {
  const UIApp({super.key});

  @override
  State<UIApp> createState() => _UIAppState();
}

class _UIAppState extends State<UIApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isTextVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 30));

    _animation = Tween<double>(begin: 1, end: 25).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/starter-image.jpg'),
              fit: BoxFit.fill),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CustumAnimation(
                1,
                Text(
                  'Taking One For Delivery',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustumAnimation(
                1.2,
                Text(
                  'See restaurant nearby by \nadding location',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              CustumAnimation(
                1.5,
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                      ),
                    ),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 30),
                      opacity: _isTextVisible ? 1 : 0,
                      child: MaterialButton(
                        onPressed: () async => _onTap(),
                        minWidth: double.infinity,
                        child: const Text(
                          'Start',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustumAnimation(
                2,
                Center(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 30),
                    opacity: _isTextVisible ? 1 : 0,
                    child: const Text(
                      'Now we deliver to your door 24/7',
                      style: TextStyle(
                          color: Colors.white54, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _isTextVisible = false;
    });

    _animationController.forward().then((f) => Navigator.push(
          context,
          PageTransition(
              child: const FirstScreen(), type: PageTransitionType.fade),
        ));
  }
}
