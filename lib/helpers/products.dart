class Products {
  final String title, image;
  final int price;
  Products(this.image, this.price, this.title);
}

List<Products> products = [
  Products(
      "assets/images/gridBanku.jpg",
      10, 
      "Banku with your favourite sauce"),
  Products(
      "assets/images/gridFriedRice.jpg",
      20,
      "Fried rice with a sizeable chicken"),
  Products(
      "assets/images/gridJollof.jpeg",
      15,
      "Delicious Jollof "),
  Products(
      "assets/images/gridKenkey.jpg",
      10,
      "Kenkey"),
  Products(
      "assets/images/gridNoodles.jpg",
      15,
      "Special noodles"),
  Products(
      "assets/images/gridPizza.jpg",
      50,
      "Pizza"),
  Products(
      "assets/images/plainrice.jpg",
      15,
      "Plain rice with your preferred meat"),
  Products(
      "assets/images/gridWaakye.jpeg",
      15,
      "special waakye with ingredients and egg"),
];
