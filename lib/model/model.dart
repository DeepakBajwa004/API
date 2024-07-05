// To parse this JSON data, do
//
//     final instagramApiModelClass = instagramApiModelClassFromJson(jsonString);

import 'dart:convert';

InstagramApiModelClass instagramApiModelClassFromJson(String str) => InstagramApiModelClass.fromJson(json.decode(str));

String instagramApiModelClassToJson(InstagramApiModelClass data) => json.encode(data.toJson());

class InstagramApiModelClass {
  Data data;
  String paginationToken;

  InstagramApiModelClass({
    required this.data,
    required this.paginationToken,
  });

  factory InstagramApiModelClass.fromJson(Map<String, dynamic> json) => InstagramApiModelClass(
    data: Data.fromJson(json["data"]),
    paginationToken: json["pagination_token"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "pagination_token": paginationToken,
  };
}

class Data {
  int count;
  List<Item> items;
  int total;

  Data({
    required this.count,
    required this.items,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "total": total,
  };
}

class Item {
  String fullName;
  String id;
  bool isPrivate;
  bool isVerified;
  int? latestStoryTs;
  String profilePicUrl;
  String username;

  Item({
    required this.fullName,
    required this.id,
    required this.isPrivate,
    required this.isVerified,
    required this.latestStoryTs,
    required this.profilePicUrl,
    required this.username,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    fullName: json["full_name"],
    id: json["id"],
    isPrivate: json["is_private"],
    isVerified: json["is_verified"],
    latestStoryTs: json["latest_story_ts"],
    profilePicUrl: json["profile_pic_url"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "id": id,
    "is_private": isPrivate,
    "is_verified": isVerified,
    "latest_story_ts": latestStoryTs,
    "profile_pic_url": profilePicUrl,
    "username": username,
  };
}
