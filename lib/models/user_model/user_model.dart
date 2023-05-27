// import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserModel {
  String? hAddress;
  String? bAddress;
  String? name;
  String? image;

  LatLng? homeAddress;
  LatLng? officeAddress;

  UserModel({this.name, this.bAddress, this.hAddress, this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    hAddress = json['home_address'];
    bAddress = json['office_address'];
    name = json['name'];
    image = json['image'];
    homeAddress =
        LatLng(json['home_latlng'].latitude, json['home_latlng'].longitude);
    officeAddress =
        LatLng(json['office_latlng'].latitude, json['office_latlng'].longitude);
  }
}
