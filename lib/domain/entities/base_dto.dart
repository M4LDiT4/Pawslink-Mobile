abstract class BaseDto<T> {
  int? localId;
  String? remoteId;

  BaseDto({
    this.localId,
    this.remoteId
  });


  T toLocalModel();

  Map<String, dynamic> toMap();
}