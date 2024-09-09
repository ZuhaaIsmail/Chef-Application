class Recipes {
  String image;
  String title;
  String time;
  double rating;
  bool isFavorite = false;
  String ingredients;
  Recipes({required this.image, required this.title,required this.time,required this.rating, required this.ingredients, required this.isFavorite});
}