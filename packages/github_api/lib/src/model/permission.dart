import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Permissions extends Equatable {
  const Permissions({
    required this.admin,
    required this.maintain,
    required this.push,
    required this.triage,
    required this.pull,
  });

  /// Factory which converts a [Map<String, dynamic>] into a [Permissions].
  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);

  /// Converts the current [Permissions] into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$PermissionsToJson(this);

  final bool admin;
  final bool maintain;
  final bool push;
  final bool triage;
  final bool pull;

  @override
  List<Object> get props {
    return [
      admin,
      maintain,
      push,
      triage,
      pull,
    ];
  }

  Permissions copyWith({
    bool? admin,
    bool? maintain,
    bool? push,
    bool? triage,
    bool? pull,
  }) {
    return Permissions(
      admin: admin ?? this.admin,
      maintain: maintain ?? this.maintain,
      push: push ?? this.push,
      triage: triage ?? this.triage,
      pull: pull ?? this.pull,
    );
  }
}
