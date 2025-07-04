class Meals {
  Meals({
    required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian});

    final String id;
    final List<String> category;
    final String title;
    final String imageUrl;
    final List<String> ingredients;
    final List<String> steps;
    final int duration;
    final Complexity complexity;
    final Affordability affordability;
    final bool isGlutenFree;
    final bool isLactoseFree;
    final bool isVegan;
    final bool isVegetarian;
}

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}