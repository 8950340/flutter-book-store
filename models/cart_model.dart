class CartModel {
  String p_img;
  String id;
  String productName;
  double productAmount;
  int productQty;

  CartModel({required this.p_img,
    required this.id,
    required this.productName,
    required this.productAmount,
    this.productQty = 1,
  });
}
