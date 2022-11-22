class Space {
  late int id;
  late String name;
  late String imageUrl;
  late int price;
  late String city;
  late String country;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int kitchenNum;
  late int bedNum;
  late int wardrobeNum;
  late int rating;

  Space(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.city,
      required this.country,
      required this.address,
      required this.bedNum,
      required this.kitchenNum,
      required this.mapUrl,
      required this.phone,
      required this.photos,
      required this.wardrobeNum,
      required this.rating});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    bedNum = json['number_of_bedrooms'];
    wardrobeNum = json['number_of_cupboards'];
    kitchenNum = json['number_of_kitchens'];
  }
}
