import "package:freezed_annotation/freezed_annotation.dart";

part "source.freezed.dart";
part "source.g.dart";

@freezed
class Source with _$Source {
  const factory Source({
    required String? id,
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}