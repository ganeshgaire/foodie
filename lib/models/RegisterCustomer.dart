class RegisterCustomer {
  String firstName;
  String lastName;
  String number;
  String password;

  RegisterCustomer({this.firstName, this.lastName, this.number, this.password});

  factory RegisterCustomer.fromJson(Map<String, dynamic> json) {
    return RegisterCustomer(
        firstName: json['firstName'],
        lastName: json['lastName'],
        number: json['number'],
        password: json['password']);
  }
}
