import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/core/constant/constant.dart';
import 'package:task/models/fact_model.dart';

class ServiceCat {
  Future<List<FactModel>> getData() async {
    Response res = await Dio().get(ConstantData.instance.factAPiUrl);
    return res.data;
  }

  Future<List<FactModel>> getDataModel() async {
    Response res = await Dio().get(ConstantData.instance.factAPiUrl);
    return (res.data as List).map((e) => FactModel.fromJson(e)).toList();
  }
}
