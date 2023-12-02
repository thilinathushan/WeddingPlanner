class UserData {
  String budget;
  String dateTime;
  String location;
  String partnerName;
  String yourName;
  String displayName;
  String email;
  String uid;
  String yourPhotoUrl;
  String? timeCounterPhotoURL;

  UserData({
    required this.budget,
    required this.dateTime,
    required this.location,
    required this.partnerName,
    required this.yourName,
    required this.displayName,
    required this.email,
    required this.uid,
    required this.yourPhotoUrl,
    this.timeCounterPhotoURL,
  });

  factory UserData.fromJSON(Map<String, dynamic> json) {
    return UserData(
      budget: json['budget'],
      dateTime: json['dateTime'],
      location: json['location'],
      partnerName: json['partnerName'],
      yourName: json['yourName'],
      displayName: json['displayName'],
      email: json['email'],
      uid: json['uid'],
      yourPhotoUrl: json['yourPhotoUrl'],
      timeCounterPhotoURL: json['timeCounterPhotoURL'],
    );
  }
}
