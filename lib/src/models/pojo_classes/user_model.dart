// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String city;
  final String shippingAddress;
  final String email;
  final String createdAt;
  final String updatedAt;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.city,
    required this.shippingAddress,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
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

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, city: $city, shippingAddress: $shippingAddress, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.mobileNumber == mobileNumber &&
        other.city == city &&
        other.shippingAddress == shippingAddress &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ mobileNumber.hashCode ^ city.hashCode ^ shippingAddress.hashCode ^ email.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
  }
}
