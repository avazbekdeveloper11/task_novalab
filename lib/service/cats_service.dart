import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/core/constant/constant.dart';
import 'package:task/models/fact_model.dart';

class ServiceCat {
  Future<List> getData() async {
    Response res = await Dio().get(ConstantData.instance.factAPiUrl);
    return res.data;
  }
}
