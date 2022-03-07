class AllProducts {
  String? title;
  String? image;
  int? price;
  String? description;

  AllProducts(this.image, this.price, this.title, this.description);

  AllProducts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
  }
}

// List carousel = [
//   "assets/images/fried_rice.jpg",
//   "assets/images/rice.jpg",
//   "assets/images/waakye.jpg"
// ];

class Product {
  final String title;
  final int price;
  final String image;
  Product(this.image, this.price, this.title);
}

List<Product> products = [
  Product("assets/images/banku.jpg", 10, "Banku with your favourite sauce"),
  Product("assets/images/fried_rice.jpg", 20,
      "Fried rice with a sizeable chicken"),
  Product("assets/images/jollof.jpeg", 15, "Delicious Jollof "),
  Product("assets/images/kenkey.jpg", 10, "Kenkey"),
  Product("assets/images/noodles.jpg", 15, "Special noodles"),
  Product("assets/images/pizza.jpg", 50, "Pizza"),
  Product(
      "assets/images/plainrice.jpg", 15, "Plain rice with your preferred meat"),
  Product("assets/images/waakye.jpeg", 15,
      "special waakye with ingredients and egg"),
];
