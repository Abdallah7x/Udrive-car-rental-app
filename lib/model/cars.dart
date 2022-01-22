class Car {
  String id;
  String name;
  String number;
  String type;
  String rate;

  Car({this.id, this.name, this.number, this.type, this.rate});


  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['data']['name'],
      number: json['data']['number'],
      type: json['data']['type'],
      rate: json['data']['rate'],
    );
  }

}
