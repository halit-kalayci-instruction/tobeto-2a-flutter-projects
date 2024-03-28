import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meal_details.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)));
      },
      child: Card(
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                    child: Text(
                  meal.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )))
          ],
        ),
      ),
    );
  }
}
