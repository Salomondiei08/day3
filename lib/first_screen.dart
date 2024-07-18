import 'package:day3/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_basket),
            color: Colors.grey[899],
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustumAnimation(
              1,
              Text(
                'Food Delivery',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.grey[80]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustumAnimation(
                    1,
                    container('Pizza', true),
                  ),
                  CustumAnimation(
                    1.2,
                    container('Burger', false),
                  ),
                  CustumAnimation(
                    1.4,
                    container('Pizza', false),
                  ),
                  CustumAnimation(
                    1.6,
                    container('Pizza', false),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustumAnimation(
              1.5,
              Text(
                'Free Delivery',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[80]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustumAnimation(
                      1.4,
                      foodContainer('assets/images/two.jpg'),
                    ),
                    CustumAnimation(
                      1.5,
                      foodContainer('assets/images/one.jpg'),
                    ),
                    CustumAnimation(
                      1.6,
                      foodContainer('assets/images/three.jpg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodContainer(image) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.2, 0.9],
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$ 15.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vigetarian Pizza",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget container(title, isActive) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: isActive ? Colors.white : Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}
