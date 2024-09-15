import '../models/house.dart';

class HouseRepositoty{
  final List<House> _dummyHouse = [
    House(posjuso: "신길동",household: "3",monthAmt: "350000",mAmt: "24300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동",household: "2",monthAmt: "100000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
    House(posjuso: "대림동(김태섭)",household: "3",monthAmt: "600000",mAmt: "2300",imageName: "assets/images/test.png"),
  ];

  List<House> getHouses(){
    return _dummyHouse;
  }
}