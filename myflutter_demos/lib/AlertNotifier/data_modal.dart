
import 'dart:convert';

List<DataModal> dataFromJson(String str) => List<DataModal>.from(json.decode(str).map((x) => DataModal.fromJson(x)));

class DataModal {
  final int id;
  final String username;

  DataModal({
    required this.id,
    required this.username,
  });

  factory DataModal.fromJson(Map<String, dynamic> json) {
    return DataModal(
      id: json['id'],
      username: json['username'],
    );
  }
}