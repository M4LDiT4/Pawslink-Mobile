import 'package:isar/isar.dart';

mixin Timestamped {
  @Index()
  late DateTime? createdAt;

  @Index()
  late DateTime? updatedAt;
}

extension TimestampedCollection<T extends Timestamped> on IsarCollection<T> {
  Future<void> putWithTimestamps(T object) async {
    final now = DateTime.now();

    // createdAt only if this is new
    object.createdAt ??= now;

    // updatedAt always refreshes
    object.updatedAt = now;

    await put(object);
  }
}


