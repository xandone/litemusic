// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => MusicModel(
      json['title'] as String?,
      json['pic'] as String?,
      json['url'] as String?,
      json['lrc'] as String?,
      json['author'] as String?,
    );

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pic': instance.pic,
      'url': instance.url,
      'lrc': instance.lrc,
      'author': instance.author,
    };
