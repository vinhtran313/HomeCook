class Order {
  String? id;
  String? foodName;
  int? quantity;
  String? buyerName;
  String? sellerName;
  String? status;
  String? thumbnail;
  String? price;
  String? totalPrice;

  Order({
    this.id,
    this.foodName,
    this.quantity,
    this.price,
    this.buyerName,
    this.thumbnail,
    this.sellerName,
    this.status,
    this.totalPrice,
  });

  Order.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    foodName = json["foodName"];
    quantity = json["quantity"];
    totalPrice = json["totalPrice"];
    buyerName = json["buyerName"];
    sellerName = json["sellerName"];
    price = json["price"];
    status = json["status"];
    thumbnail = json["thumbnail"];
  }
}

