import '../core/interfaces/services/IProductService.dart';
import '../core/models/Product.dart';
import '../repositories/ProductRepository.dart';

class ProductService implements IProductService {
  final ProductRepository _repository;

  ProductService(this._repository);

  // =========================
  // CREAR PRODUCTO
  // =========================
  @override
  void createProduct(String name, double price, int stock) {
    Product product = Product(name, price, stock);

    Product.validate(product);

    _repository.create(product);

    print("Producto agregado correctamente.");
  }

  // =========================
  // OBTENER PRODUCTO POR ID
  // =========================
  @override
  Product getById(int id) {
    List<Product> products = _repository.getAll();

    if (id < 0 || id >= products.length) {
      throw Exception("Producto no encontrado");
    }

    return products[id];
  }

  // =========================
  // LISTAR TODOS
  // =========================
  @override
  List<Product> getAll() {
    return _repository.getAll();
  }

  // =========================
  // BUSCAR POR NOMBRE
  // =========================
  @override
  List<Product> searchByName(String name) {
    return _repository.getAll().where((product) {
      return product.name.toLowerCase().contains(name.toLowerCase());
    }).toList();
  }

  // =========================
  // ACTUALIZAR PRODUCTO
  // =========================
  @override
  void update(int id, String name, double price, int stock) {
    Product product = getById(id);

    if (name.trim().isNotEmpty) {
      product.name = name.trim();
    }

    product.price = price;
    product.stock = stock;

    Product.validate(product);

    print("Producto actualizado correctamente.");
  }

  // =========================
  // ELIMINAR PRODUCTO
  // =========================
  @override
  void delete(int id) {
    List<Product> products = _repository.getAll();

    if (id < 0 || id >= products.length) {
      throw Exception("Producto no encontrado");
    }

    products.removeAt(id);

    print("Producto eliminado correctamente.");
  }
}