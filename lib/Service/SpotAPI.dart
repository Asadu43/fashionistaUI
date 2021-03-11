import 'package:dio/dio.dart';
import 'package:flutter_login_ui/Api_url/Api_Url.dart';
import 'package:flutter_login_ui/Models/spot_data_entity.dart';

class SpotAPI{

  static Future<List<SpotDataEntity>> getData() async{

    Response res = await Dio().get(ApiUrl.spot_type_url);

    List<SpotDataEntity> entity = List();

    if(res.statusCode == 200){
      (res.data['data'] as List).forEach((element) {
        entity.add(SpotDataEntity().fromJson(element));
      });

    }
    return entity;

  }
}

