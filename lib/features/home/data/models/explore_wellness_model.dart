class ExploreWellnessModel {
  final int id;
  final String title;
  final int price;
  final int discountPct;
  final int discountPrice;

  ExploreWellnessModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPct,
    required this.discountPrice,
  });

  factory ExploreWellnessModel.fromJson(Map<String, dynamic> json) {
    return ExploreWellnessModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      discountPct: json['discountPct'],
      discountPrice: json['discountPrice'],
    );
  }
}
