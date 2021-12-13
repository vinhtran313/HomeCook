class Food {
  String? id;
  String? name;
  String? description;
  String? thumbnail;
  String? price;
  String? creatorName;

  Food({
    this.id,
    this.name,
    this.description,
    this.price,
    this.creatorName,
    this.thumbnail,
  });

  Food.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    creatorName = json["creatorName"];
    thumbnail = json["thumbnail"];
  }
}

