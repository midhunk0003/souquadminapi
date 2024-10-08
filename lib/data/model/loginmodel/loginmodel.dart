import 'package:json_annotation/json_annotation.dart';

part 'loginmodel.g.dart';

@JsonSerializable()
class Loginmodel {
	bool? status;
	String? message;
	String? token;

	Loginmodel({this.status, this.message, this.token});

	factory Loginmodel.fromJson(Map<String, dynamic> json) {
		return _$LoginmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LoginmodelToJson(this);
}
