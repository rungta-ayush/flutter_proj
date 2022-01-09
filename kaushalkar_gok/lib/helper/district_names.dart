import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaushalkar_gok/model/districtModel.dart';

// ignore: camel_case_types
class districtNames {
  List<disNameModel> names = [];

  Future<void> getDisNames() async {
    var url = 'https://www.kaushalkar.com/webservices/ws/getDistrictsByStateId';
    var body = {'stateId': '29'};
    var response = await http.post(url,
        body: json.encode(body),
        headers: {'api': 'c726736ed6a469e5e713118332558b54'});
    var jsonData = jsonDecode(response.body);

    List<Map> myList = jsonData;
    for (var item in myList) {
      if (item['district_id'] != null && item['district_name'] != null) {
        disNameModel disModel = disNameModel(
            distID: item['district_id'], distName: item['district_name']);
        names.add(disModel);
      }
    }
  }
}
