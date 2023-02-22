class User {
  String? id;
  String? username;
  String? email;
  String? name;
  String? createdAt;
  String? token;
  String? refreshToken;

  User(
      {this.id,
      this.username,
      this.email,
      this.name,
      this.createdAt,
      this.token,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    createdAt = json['createdAt'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
