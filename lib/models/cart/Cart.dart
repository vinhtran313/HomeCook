class Cart {
  String? id;
  String? name;
  String? description;
  String? thumbnail;
  String? price;
  String? creatorName;

  Cart({
    this.id,
    this.name,
    this.description,
    this.price,
    this.creatorName,
    this.thumbnail,
  });

  Cart.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    creatorName = json["creatorName"];
    thumbnail = json["thumbnail"];
  }
}

