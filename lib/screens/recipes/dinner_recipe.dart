import 'package:dietplanner_project/screens/recipes/recipe_details.dart';
import 'package:flutter/material.dart';

class DinnerRecipe extends StatefulWidget {
  const DinnerRecipe({super.key});

  @override
  State<DinnerRecipe> createState() => _DinnerRecipeState();
}

class _DinnerRecipeState extends State<DinnerRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('My Dinner Recipes'),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipieDetails()),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/brkrecipe1.webp'),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 10, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/deleterecipie.png')),
                                Spacer(),
                                SizedBox(
                                    height: 30,
                                    child: Image.asset('assets/favfood.png')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Healthy porridge bowl')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipieDetails()),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/brkrecipe1.webp'),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 10, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        'assets/deleterecipie.png')),
                                Spacer(),
                                SizedBox(
                                    height: 30,
                                    child: Image.asset('assets/favfood.png')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Healthy porridge bowl')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
