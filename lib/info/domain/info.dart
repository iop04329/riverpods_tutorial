import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.freezed.dart';
part 'info.g.dart';

@freezed
class info with _$info {
  factory info({
    required int id,
    @Default('') String name,
    @Default(0) int gender,
    required String date,
  }) = _info;

  factory info.fromJson(Map<String, dynamic> json) => _$infoFromJson(json);
}
