class UserDetails {
  late String user_name;
  late String user_email;
  late String user_moblie;
  late String user_id;
  late String user_acc_no;

  UserDetails(this.user_name, this.user_email, this.user_moblie, this.user_id,
      this.user_acc_no);

  Map<String, dynamic> asMap() => {};

  UserDetails.fromJson(Map<String, dynamic> json) {
    user_name = json["user_name"];
    user_email = json["user_email"];
    user_moblie = json["user_moblie"];
    user_id = json["user_id"];
    user_acc_no = json["user_acc_no"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['user_name'] = user_name;
    data['user_email'] = user_email;
    data['user_moblie'] = user_moblie;
    data['user_id'] = user_id;
    data['user_acc_no'] = user_acc_no;

    return data;
  }

  @override
  String toString() {
    return 'UserDetails{user_name: $user_name, user_email: $user_email, user_moblie: $user_moblie, user_id: $user_id, user_acc_no: $user_acc_no}';
  }
}
