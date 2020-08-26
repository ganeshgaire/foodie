class Category {
  int id;
  String name;
  String image;
  int items;

  Category({this.id, this.name,this.image,this.items});

   factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        items: json['items']);
  }
}
