// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) =>
    ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
  List<String>? images;
  List<String>? pdf;
  int? timestamp;
  String? text;

  ActivityModel({
    this.images,
    this.pdf,
    this.timestamp,
    this.text,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        pdf: json["pdf"] == null
            ? []
            : List<String>.from(json["pdf"]!.map((x) => x)),
        timestamp: json["timestamp"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "pdf": pdf == null ? [] : List<dynamic>.from(pdf!.map((x) => x)),
        "timestamp": timestamp,
        "text": text,
      };
}
