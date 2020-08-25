import 'package:foodie/models/models.dart';

final List<Category> categories = [
  Category(id: 1, name: "Burger"),
  Category(id: 2, name: "Pizza"),
  Category(id: 3, name: "Momo"),
  Category(id: 4, name: "Chaumean"),
  Category(id: 5, name: "Drinks"),
  Category(id: 6, name: "Salads"),
  Category(id: 7, name: "Lolipop"),
];

final List<Item> items = [
  Item(
      id: 1,
      name: "Chicken Burger",
      price: 200,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
  Item(
      id: 2,
      name: "Foggy Pizza",
      price: 300,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
  Item(
      id: 3,
      name: "Halal Bryani",
      price: 150,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
  Item(
      id: 4,
      name: "Chicken Chaumean",
      price: 230,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
];

final List<Deal> deals = [
  Deal(
      id: 1,
      name: "Chicken Burger",
      price: 200,
      discount: 10,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
  Deal(
      id: 2,
      name: "Foggy Pizza",
      price: 300,
      discount: 5,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
  Deal(
      id: 3,
      name: "Halal Bryani",
      price: 150,
      discount: 15,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
  Deal(
      id: 4,
      name: "Chicken Chaumean",
      price: 230,
      discount: 12,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      detail: "Nice one"),
];

final List<Combo> combos = [
  Combo(
      id: 1,
      name: "Teej Special",
      items: [
        "200 ML Coke",
        "1 Chicken Pizza",
        "1 Chicken Burger",
        "1 plate Fry chicken momo"
      ],
      detail: "Teez special combo",
      price: 500,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      validTill: "4 days remaining"),
  Combo(
      id: 2,
      name: "Dashain Special",
      items: [
        "200 ML Coke",
        "2 Chicken Pizza",
        "2 Chicken Burger",
        "2 plate Fry chicken momo"
      ],
      detail: "Dashain++ special combo",
      price: 600,
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      validTill: "7 days remaining"),
];

final List<Popular> populars = [
  Popular(
      id: 1,
      name: "Fuggy Pizza",
      price: 300,
      detail: "fuggy pizza",
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      rating: 4.5),
  Popular(
      id: 2,
      name: "Hyderbad Bryani",
      price: 350,
      detail: "best bryani in town",
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      rating: 4.5),
  Popular(
      id: 3,
      name: "Chicken Spring Rolls",
      price: 100,
      detail: "spring rolls",
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      rating: 4),
  Popular(
      id: 4,
      name: "Chicken Manchurian",
      price: 250,
      detail: "chicken manchurian",
      image:
          "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png",
      rating: 4.5),
];
