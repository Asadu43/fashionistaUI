import 'package:flutter_login_ui/generated/json/base/json_convert_content.dart';
import 'package:flutter_login_ui/generated/json/base/json_field.dart';

class SpotDataEntity with JsonConvert<SpotDataEntity> {
	int id;
	String title;
	List<SpotDataType> types;
}

class SpotDataType with JsonConvert<SpotDataType> {
	int id;
	@JSONField(name: "spot_id")
	String spotId;
	String title;
	String icon;
}
