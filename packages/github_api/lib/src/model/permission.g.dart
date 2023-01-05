// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permissions _$PermissionsFromJson(Map<String, dynamic> json) => Permissions(
      admin: json['admin'] as bool,
      maintain: json['maintain'] as bool,
      push: json['push'] as bool,
      triage: json['triage'] as bool,
      pull: json['pull'] as bool,
    );

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'maintain': instance.maintain,
      'push': instance.push,
      'triage': instance.triage,
      'pull': instance.pull,
    };
