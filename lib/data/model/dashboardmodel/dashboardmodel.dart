import 'package:json_annotation/json_annotation.dart';

part 'dashboardmodel.g.dart';

@JsonSerializable()
class Dashboardmodel {
	bool? status;
	int? totalproduct;
	int? totalcategory;
	int? totalorder;
	int? activeorder;
	int? completeorder;

	Dashboardmodel({
		this.status, 
		this.totalproduct, 
		this.totalcategory, 
		this.totalorder, 
		this.activeorder, 
		this.completeorder, 
	});

	factory Dashboardmodel.fromJson(Map<String, dynamic> json) {
		return _$DashboardmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DashboardmodelToJson(this);
}
