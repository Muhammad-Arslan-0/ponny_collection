import 'package:pony_collection/models/qa_model.dart';
import 'package:pony_collection/models/review_model.dart';

class ProductModel {
  final String name;
  final String price;
  final String oldPrice;
  final String review;
  final List<String> images;
  final List<QAModel> questions;
  final List<ReviewModel> reviews;
  final String productDetail;
  final int stars;
  ProductModel(
      {required this.name,
      required this.price,
      required this.oldPrice,
      required this.review,
      required this.images,
      required this.productDetail,
      required this.questions,
      required this.reviews,
      required this.stars});
}
