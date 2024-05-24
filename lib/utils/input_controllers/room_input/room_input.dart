import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomInput{


   final idController = TextEditingController().obs;
  final capacityController = TextEditingController().obs;
  final blockController = TextEditingController().obs;
  final RxBool isLab = false.obs;


  dispose(){

    idController.value.dispose();
    capacityController.value.dispose();
    blockController.value.dispose();
  }

  clear(){
    idController.value.clear();
    capacityController.value.clear();
    blockController.value.clear();
    isLab.value = false;
  }
}