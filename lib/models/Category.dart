class Category {
  int id;
  String name;
  String image;
  int items;
  String slug;

  Category({this.id, this.name, this.image, this.items, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        items: json['items'],
        slug: json['slug']);
  }
}
