import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

/// Serializer for [DateTime] that uses ISO time formatting.
///
/// An exception will be thrown on attempt to serialize local DateTime
/// instances; you must use UTC.
class Iso8601DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  final bool structured = false;
  @override
  final Iterable<Type> types = new BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType: FullType.unspecified}) {
    if (!dateTime.isUtc) {
      throw new ArgumentError.value(
          dateTime, 'dateTime', 'Must be in utc for serialization.');
    }

    return dateTime.toIso8601String();
  }

  @override
  DateTime deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final iso8601 = serialized as String;
    return DateTime.parse(iso8601);
  }
}