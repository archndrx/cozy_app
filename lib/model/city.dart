class City {
  int id;
  String name;
  String imageUrl;
  bool isFav;

  City(
      {required this.id,
      required this.imageUrl,
      required this.name,
      this.isFav = false});
}
