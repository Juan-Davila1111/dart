import '../core/interfaces/repositories/IProductRepository.dart';
import '../core/models/Product.dart';
import '../core/utils/AppException.dart';

class ProductRepository implements IProductRepository {
  final Map<int, Product> _products = {};
  int _nextId = 1;

  @override
  int create(Product product) {
    final id = _nextId++;
    _products[id] = product;
    return id;
  }

  @override
  void delete(int id) {
    if (!_products.containsKey(id)) {
      throw AppException('No se pudo eliminar: Producto con ID $id no encontrado');
    }
    _products.remove(id);
  }

  @override
  List<Product> getAll() {
    return _products.values.toList();
  }

  @override
  Product getById(int id) {
    final product = _products[id];
    if (product == null) {
      throw AppException('Producto con ID $id no encontrado');
    }
    return product;
  }

  @override
  List<Product> searchByName(String title) {
    return _products.values
        .where((p) => p.name.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  @override
  void update(int id, Product product) {
    if (!_products.containsKey(id)) {
      throw AppException('No se pudo actualizar: Producto con ID $id no encontrado');
    }
    _products[id] = product;
  }
}