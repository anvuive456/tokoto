import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/Cart.dart';

class History {
  DateTime receiveTime = DateTime.now();
  DateTime purchasedTime = DateTime.now();
  String phoneNum = '';
  String address = '';
  String id='';
  bool status= false;
  List<Cart> carts = [];

  History();

  History.fromJson(Map<String, dynamic> obj) {
    this.phoneNum = obj['phoneNumber'];
    this.address = obj['address'];
    Timestamp rT = obj['receiveDate'];
    Timestamp pT = obj['purchasedDate'];
    this.receiveTime = DateTime.fromMillisecondsSinceEpoch(rT.millisecondsSinceEpoch);
    this.purchasedTime = DateTime.fromMillisecondsSinceEpoch(pT.millisecondsSinceEpoch);
    var contents = obj['carts'] as List;
    contents.forEach((element) {
      this.carts.add(Cart.fromJson(element));
    });
    this.status = obj['status'];
    this.id = obj['id'];
  }
  Map<String,dynamic> toJson(){
    return {
      'phoneNumber':this.phoneNum,
      'address':this.address,
      'receiveDate':this.receiveTime,
      'purchasedDate':this.purchasedTime,
      'carts':this.carts.map((e) => e.toJson()),
      'status':this.status,
      'id':this.id,
    };
  }
}
