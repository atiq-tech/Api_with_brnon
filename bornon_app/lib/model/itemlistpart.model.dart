class ItemListPartModel {
  String itemheadline;
  ItemListPartModel(this.itemheadline);
  static List<ItemListPartModel> generatedMySourecList() {
    return [
      ItemListPartModel("Hot Deal"),
      ItemListPartModel("Top Seller"),
      ItemListPartModel("New Arrival"),     
    ];
  }
}
