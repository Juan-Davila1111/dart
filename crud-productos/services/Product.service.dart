import '../core/interfaces/services/IProductService.dart';
import '../repositories/ProductRepository.dart';

class ProductService implements IProductService {
  final ProductRepository _repository;

  ProductService(this._repository);
}