class UserInfo {
  String? _username;
  String? _password;
  String? _email;
  String? _address;
  String? _city;
  String? _province;
  String? _gender;
  String? _hobby;

  String test() {
    return _username!;
  }

  set setUsername(String name) {
    _username = name;
  }

  String get username {
    return _username!;
  }

  set setPassword(String name) {
    _password = name;
  }

  String get password {
    return _password!;
  }

  set setEmail(String name) {
    _email = name;
  }

  String get email {
    return _email!;
  }

  set setAddress(String name) {
    _address = name;
  }

  String get address {
    return _address!;
  }

  set setCity(String name) {
    _city = name;
  }

  String get city {
    return _city!;
  }

  set setProvince(String name) {
    _province = name;
  }

  String get province {
    return _province!;
  }

  set setGender(String name) {
    _gender = name;
  }

  String get gender {
    return _gender!;
  }

  set setHobby(String name) {
    _hobby = name;
  }

  String get hobby {
    return _hobby!;
  }
}
