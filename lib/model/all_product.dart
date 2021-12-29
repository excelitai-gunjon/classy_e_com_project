class AllProduct {
  String? message;
  List<Product>? products;

  AllProduct({this.message, this.products});

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      message: json['message'],
      products: json['products'] != null
          ? (json['products'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? brand_id;
  int? category_id;
  String? created_at;
  String? discount_price;
  int? featured;
  int? hot_deals;
  int? id;
  String? product_code;
  String? product_color;
  String? product_long_descp;
  String? product_name;
  String? product_qty;
  String? product_short_descp;
  String? product_size;
  String? product_tags;
  String? product_thambnail;
  int? product_views;
  String? selling_price;
  int? special_deals;
  int? special_offer;
  int? status;
  int? subcategory_id;
  int? subsubcategory_id;
  String? updated_at;
  String? vedio;

  Product(
      {this.brand_id,
      this.category_id,
      this.created_at,
      this.discount_price,
      this.featured,
      this.hot_deals,
      this.id,
      this.product_code,
      this.product_color,
      this.product_long_descp,
      this.product_name,
      this.product_qty,
      this.product_short_descp,
      this.product_size,
      this.product_tags,
      this.product_thambnail,
      this.product_views,
      this.selling_price,
      this.special_deals,
      this.special_offer,
      this.status,
      this.subcategory_id,
      this.subsubcategory_id,
      this.updated_at,
      this.vedio});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand_id: json['brand_id'],
      category_id: json['category_id'],
      created_at: json['created_at'],
      discount_price: json['discount_price'] != null
          ? "String?.fromJson(json['discount_price'])"
          : null,
      featured: json['featured'] != null ? json['featured'] : null,
      hot_deals: json['hot_deals'] != null ? json['hot_deals'] : null,
      id: json['id'],
      product_code: json['product_code'],
      product_color: json['product_color'],
      product_long_descp: json['product_long_descp'],
      product_name: json['product_name'],
      product_qty: json['product_qty'],
      product_short_descp: json['product_short_descp'],
      product_size: json['product_size'],
      product_tags: json['product_tags'],
      product_thambnail: json['product_thambnail'],
      product_views: json['product_views'],
      selling_price: json['selling_price'],
      special_deals:
          json['special_deals'] != null ? json['special_deals'] : null,
      special_offer:
          json['special_offer'] != null ? json['special_offer'] : null,
      status: json['status'],
      subcategory_id: json['subcategory_id'],
      subsubcategory_id: json['subsubcategory_id'],
      updated_at: json['updated_at'] != null ? json['updated_at'] : null,
      vedio: json['vedio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brand_id;
    data['category_id'] = this.category_id;
    data['created_at'] = this.created_at;
    data['id'] = this.id;
    data['product_code'] = this.product_code;
    data['product_color'] = this.product_color;
    data['product_long_descp'] = this.product_long_descp;
    data['product_name'] = this.product_name;
    data['product_qty'] = this.product_qty;
    data['product_short_descp'] = this.product_short_descp;
    data['product_size'] = this.product_size;
    data['product_tags'] = this.product_tags;
    data['product_thambnail'] = this.product_thambnail;
    data['product_views'] = this.product_views;
    data['selling_price'] = this.selling_price;
    data['status'] = this.status;
    data['subcategory_id'] = this.subcategory_id;
    data['subsubcategory_id'] = this.subsubcategory_id;
    data['vedio'] = this.vedio;
    // if (this.discount_price != null) {
    //     data['discount_price'] = this.discount_price;
    // }
    // if (this.featured != null) {
    //     data['featured'] = this.featured;
    // }
    // if (this.hot_deals != null) {
    //     data['hot_deals'] = this.hot_deals;
    // }
    // if (this.special_deals != null) {
    //     data['special_deals'] = this.special_deals.toJson();
    // }
    // if (this.special_offer != null) {
    //     data['special_offer'] = this.special_offer.toJson();
    // }
    // if (this.updated_at != null) {
    //     data['updated_at'] = this.updated_at.toJson();
    // }
    return data;
  }
}
