import 'package:get/get.dart';
import '../translations/app_translations.dart';

// class FarmerController extends Get

class Farmer {
  final String id;
  final String name;
  final int age;
  final String address;
  final double landSize;
  final List<String> cropTypes;
  final double annualIncome;
  final String contactNumber;

  Farmer({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    required this.landSize,
    required this.cropTypes,
    required this.annualIncome,
    required this.contactNumber,
  });

  // Convert Farmer object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'landSize': landSize,
      'cropTypes': cropTypes,
      'annualIncome': annualIncome,
      'contactNumber': contactNumber,
    };
  }

  // Create Farmer object from Map
  factory Farmer.fromMap(Map<String, dynamic> map) {
    return Farmer(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      address: map['address'] ?? '',
      landSize: map['landSize']?.toDouble() ?? 0.0,
      cropTypes: List<String>.from(map['cropTypes'] ?? []),
      annualIncome: map['annualIncome']?.toDouble() ?? 0.0,
      contactNumber: map['contactNumber'] ?? '',
    );
  }

  // Create a copy of Farmer with some fields updated
  Farmer copyWith({
    String? id,
    String? name,
    int? age,
    String? address,
    double? landSize,
    List<String>? cropTypes,
    double? annualIncome,
    String? contactNumber,
  }) {
    return Farmer(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      address: address ?? this.address,
      landSize: landSize ?? this.landSize,
      cropTypes: cropTypes ?? this.cropTypes,
      annualIncome: annualIncome ?? this.annualIncome,
      contactNumber: contactNumber ?? this.contactNumber,
    );
  }

  // Get translated field names with values
  Map<String, String> getTranslatedFieldNames() {
    return {
      TranslationKeys.farmerId: '${TranslationKeys.farmerId.tr}: $id',
      TranslationKeys.farmerName: '${TranslationKeys.farmerName.tr}: $name',
      TranslationKeys.farmerAge: '${TranslationKeys.farmerAge.tr}: $age',
      TranslationKeys.farmerAddress:
          '${TranslationKeys.farmerAddress.tr}: $address',
      TranslationKeys.farmerLandSize:
          '${TranslationKeys.farmerLandSize.tr}: $landSize',
      TranslationKeys.farmerCropTypes:
          '${TranslationKeys.farmerCropTypes.tr}: ${cropTypes.join(", ")}',
      TranslationKeys.farmerAnnualIncome:
          '${TranslationKeys.farmerAnnualIncome.tr}: $annualIncome',
      TranslationKeys.farmerContactNumber:
          '${TranslationKeys.farmerContactNumber.tr}: $contactNumber',
    };
  }
}
