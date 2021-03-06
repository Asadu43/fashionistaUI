import 'package:flutter_login_ui/Models/spot_data_entity.dart';

spotDataEntityFromJson(SpotDataEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['types'] != null) {
		data.types = new List<SpotDataType>();
		(json['types'] as List).forEach((v) {
			data.types.add(new SpotDataType().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> spotDataEntityToJson(SpotDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	if (entity.types != null) {
		data['types'] =  entity.types.map((v) => v.toJson()).toList();
	}
	return data;
}

spotDataTypeFromJson(SpotDataType data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['spot_id'] != null) {
		data.spotId = json['spot_id'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	return data;
}

Map<String, dynamic> spotDataTypeToJson(SpotDataType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['spot_id'] = entity.spotId;
	data['title'] = entity.title;
	data['icon'] = entity.icon;
	return data;
}