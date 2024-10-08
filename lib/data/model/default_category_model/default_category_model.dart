import 'package:json_annotation/json_annotation.dart';
part 'default_category_model.g.dart';

@JsonSerializable()
class DefaultCategoryModel {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'category')
  List<DefaultCategory>? category;

  DefaultCategoryModel({this.status, this.message, this.category});

  factory DefaultCategoryModel.fromJson(Map<String, dynamic> json) {
    return _$DefaultCategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefaultCategoryModelToJson(this);
}

@JsonSerializable()
class DefaultCategory {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'isactive')
  bool? isactive;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'productscount')
  int? productscount;

  DefaultCategory({
    this.id,
    this.isactive,
    this.engTitle,
    this.arbTitle,
    this.image,
    this.productscount,
  });

  factory DefaultCategory.fromJson(Map<String, dynamic> json) {
    return _$DefaultCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefaultCategoryToJson(this);
}
