import '../../models/Product.dart';

abstract class IProductService {

  void createProduct(String name, double price, int stock);

  Product getById(int id);

  List<Product> getAll();

  List<Product> searchByName(String name);

  void update(int id, String name, double price, int stock);

  void delete(int id);
}