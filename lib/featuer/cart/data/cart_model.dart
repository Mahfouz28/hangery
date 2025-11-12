class CartModel {
  final int id;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> options;

  CartModel({
    required this.id,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.options,
  });

  Map<String, dynamic> toJson() => {
    'product_id': id,
    'quantity': quantity,
    'spicy': spicy,
    'toppings': toppings,
    'side_options': options,
  };
}

class CartRequestModel {
  final List<CartModel> items;

  CartRequestModel({required this.items});

  Map<String, dynamic> toJson() => {
    'items': items.map((e) => e.toJson()).toList(),
  };
}

// ------------------------ RESPONSE MODELS ------------------------

class GetCartResponseModel {
  final int code;
  final String message;
  final CartData data;

  GetCartResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) {
    return GetCartResponseModel(
      code: json['code'] ?? 200,
      message: json['message']?.toString() ?? '',
      data: CartData.fromJson(json['data'] ?? {}),
    );
  }
}

class CartData {
  final int id;
  final List<CartItem> items;
  final double totalPrice;

  CartData({required this.id, required this.items, required this.totalPrice});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'] ?? 0,
      totalPrice:
          double.tryParse(json['total_price']?.toString() ?? '0') ?? 0.0,
      // ✅ FIX: Corrected key name (was "itmes") + null safety
      items:
          (json['items'] as List?)?.map((e) => CartItem.fromJson(e)).toList() ??
          [],
    );
  }
}

class CartItem {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double spicy;
  final List<Topping> toppings;
  final List<SideOption> sideOptions;

  CartItem({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['item_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      spicy: double.tryParse(json['spicy']?.toString() ?? '0') ?? 0.0,
      toppings:
          (json['toppings'] as List?)
              ?.map((e) => Topping.fromJson(e))
              .toList() ??
          [],
      sideOptions:
          (json['side_options'] as List?)
              ?.map((e) => SideOption.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Topping {
  final int id;
  final String name;
  final String image;

  Topping({required this.id, required this.name, required this.image});

  factory Topping.fromJson(Map<String, dynamic> json) {
    return Topping(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class SideOption {
  final int id;
  final String name;
  final String image;

  SideOption({required this.id, required this.name, required this.image});

  factory SideOption.fromJson(Map<String, dynamic> json) {
    return SideOption(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
