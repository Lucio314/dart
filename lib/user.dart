class User {
   int id;
   String? username;
   String password;

  User(this.id, this.username, this.password);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) => new User(
   
      map['id'],
      map['username'],
      map['password']
  );
}
