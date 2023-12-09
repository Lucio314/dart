class user {
   int id;
   String name;
   String pass;

  user(this.id, this.name, this.pass);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'pass': pass};
  }

  factory user.fromMap(Map<String, dynamic> map) => new user(
        map['id'],
        map['name'],
        map['pass'],
      );
}
