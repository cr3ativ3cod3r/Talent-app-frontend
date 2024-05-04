// To parse this JSON data, do
//
//     final homemap = homemapFromJson(jsonString);

import 'dart:convert';

List<Homemap> homemapFromJson(String str) => List<Homemap>.from(json.decode(str).map((x) => Homemap.fromJson(x)));

String homemapToJson(List<Homemap> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Homemap {
    int id;
    int postno;
    String name;
    String type;
    String tag;
    String content;
    int likes;
    String time;

    Homemap({
        required this.id,
        required this.postno,
        required this.name,
        required this.type,
        required this.tag,
        required this.content,
        required this.likes,
        required this.time,
    });

    factory Homemap.fromJson(Map<String, dynamic> json) => Homemap(
        id: json["id"],
        postno: json["postno"],
        name: json["name"],
        type: json["type"],
        tag: json["tag"],
        content: json["content"],
        likes: json["likes"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "postno": postno,
        "name": name,
        "type": type,
        "tag": tag,
        "content": content,
        "likes": likes,
        "time": time,
    };
}
