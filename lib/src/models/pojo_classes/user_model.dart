class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? city;
  String? shippingAddress;
  String? email;
  String? createdAt;
  String? updatedAt;
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.city,
    this.shippingAddress,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? city,
    String? shippingAddress,
    String? email,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      city: city ?? this.city,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'city': city,
      'shippingAddress': shippingAddress,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      mobileNumber: map['mobileNumber'] as String,
      city: map['city'] as String,
      shippingAddress: map['shippingAddress'] as String,
      email: map['email'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    mobileNumber = map['mobile'];
    city = map['city'];
    shippingAddress = map['shippingAddress'];
    email = map['email'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
  }

  // true if profile complete
  bool isValid() {
    if (firstName == null) return false;
    if (lastName == null) return false;
    if (mobileNumber == null) return false;
    if (city == null) return false;
    if (shippingAddress == null) return false;
    if (email == null) return false;
    return true;
  }
}
