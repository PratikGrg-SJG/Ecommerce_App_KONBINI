import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final bool? approved;
  final String? panNumber,
      address,
      businessEmail,
      businessLogo,
      businessName,
      city,
      contactNumber,
      municipality,
      province,
      storeImage;
  final Timestamp? time;

  VendorModel({
    this.approved,
    this.address,
    this.panNumber,
    this.businessEmail,
    this.businessLogo,
    this.businessName,
    this.city,
    this.contactNumber,
    this.municipality,
    this.province,
    this.storeImage,
    this.time,
  });

  VendorModel.fromFirestore(Map<String, dynamic> data)
      : approved = data['approved'],
        address = data['address'],
        panNumber = data['PANnumber'],
        businessEmail = data['businessEmail'],
        businessLogo = data['businessLogo'],
        businessName = data['businessName'],
        city = data['city'],
        contactNumber = data['contactNumber'],
        municipality = data['municipality'],
        province = data['province'],
        storeImage = data['storeImage'],
        time = data['time'] as Timestamp;

  Map<String, dynamic> toJson() {
    return {
      'approved': approved,
      'address': address,
      'panNumber': panNumber,
      'businessEmail': businessEmail,
      'businessLogo': businessLogo,
      'businessName': businessName,
      'city': city,
      'contactNumber': contactNumber,
      'municipality': municipality,
      'province': province,
      'storeImage': storeImage,
      'time': time
    };
  }
}
