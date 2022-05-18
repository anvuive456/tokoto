class ProfileData {
  String email = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String address = '';

  ProfileData(
      {this.firstName = '',
      this.lastName = '',
      this.phoneNumber = '',
      this.address = '',
      this.email = ''});

  ProfileData.fromJson(Map<String, dynamic> obj) {
    this.address = obj['address'] ?? '';
    this.firstName = obj['name'] == null ? '' : obj['name'].split(' ')[0];
    this.lastName = obj['name'] == null ? '' : obj['name'].toString().split(' ')[1];
    this.phoneNumber = obj['phoneNumber'] ?? '';
    this.email = obj['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'address': this.address,
      'name': this.firstName + ' ' + this.lastName,
      'phoneNumber': this.phoneNumber,
      'email': this.email
    };
  }
}
