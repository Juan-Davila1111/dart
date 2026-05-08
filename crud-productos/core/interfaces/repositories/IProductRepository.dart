import '../../models/Product.dart';

abstract class IProductRepository {
  int create(Product product);

  Product getById(int id);

  List<Product> getAll();

  List<Product> searchByName(String title);

  void update(int id, Product product);

  void delete(int id);
}
