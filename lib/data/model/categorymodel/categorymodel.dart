import 'package:json_annotation/json_annotation.dart';

part 'categorymodel.g.dart';

@JsonSerializable()
class Categorymodel {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  List<Allcategory>? allcategory;

  Categorymodel({this.status, this.message, this.allcategory});

  factory Categorymodel.fromJson(Map<String, dynamic> json) {
    return _$CategorymodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategorymodelToJson(this);
}

@JsonSerializable()
class Allcategory {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'eng_title')
  String? engTitle;
  @JsonKey(name: 'arb_title')
  String? arbTitle;
  @JsonKey(name: 'image')
  String? image;

  Allcategory({this.id, this.engTitle, this.arbTitle, this.image});

  factory Allcategory.fromJson(Map<String, dynamic> json) {
    return _$AllcategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllcategoryToJson(this);
}
