class HistoryTileModel {
  String type;
  String price;
  String quantity;
  bool isPositive;
  String dateTime;

  HistoryTileModel({
    this.type,
    this.dateTime,
    this.price,
    this.quantity,
    this.isPositive,
  });
}
