import 'package:json_annotation/json_annotation.dart';

part 'music_model.g.dart';

/// @author: xiao
/// created on: 2025/1/18 15:33
/// description:
@JsonSerializable()
class MusicModel {
  String? title;
  String? pic;
  String? url;
  String? lrc;
  String? author;

  MusicModel(this.title, this.pic, this.url, this.lrc, this.author);

  // 1、_${类名}FromJson(json) json转对象固定写法 flutter pub run build_runner build --delete-conflicting-outputs
  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);

  // 2、_${类名}ToJson(json)  对象转json固定写法 }
  Map<String, dynamic> toJson() => _$MusicModelToJson(this);
}
