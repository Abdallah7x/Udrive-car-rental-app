List menus = ["Suv", "Cross over", "Sedan", "coupe", "exiotics"];

List items = [];

class ProductDetailPage {
  final int id;
  final String name;
  final String img;
  final String description;
  final String pPrice;
  final String pPromotionPrice;

  ProductDetailPage(
      {this.id,
      this.name,
      this.img,
      this.description,
      this.pPrice,
      this.pPromotionPrice}) {
    print(id);
  }
}
