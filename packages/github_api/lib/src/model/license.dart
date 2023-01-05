import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class License extends Equatable {
  const License({
    required this.key,
    required this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  /// Factory which converts a [Map<String, dynamic>] into a [License].
  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  /// Converts the current [License] into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  final String key;
  final String name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  @override
  List<Object?> get props {
    return [
      key,
      name,
      spdxId,
      url,
      nodeId,
    ];
  }

  License copyWith({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) {
    return License(
      key: key ?? this.key,
      name: name ?? this.name,
      spdxId: spdxId ?? this.spdxId,
      url: url ?? this.url,
      nodeId: nodeId ?? this.nodeId,
    );
  }
}
