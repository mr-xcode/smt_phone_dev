class UserModel {
  final String userName;
  final String userEmail;
  final String userPhoneNumber;
  final String userAddress;
  final String userProfileUrl;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.userAddress,
    required this.userProfileUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPhoneNumber: json['userPhoneNumber'],
      userAddress: json['userAddress'],
      userProfileUrl: json['userProfileUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPhoneNumber': userPhoneNumber,
      'userAddress': userAddress,
      'userProfileUrl': userProfileUrl,
    };
  }
}
