import '../api_provider/api_provider.dart';
import '../models/shopping_model.dart';

class ShoppingHomeRepository {
  final _apiProvider = ApiProvider();

  Future<List<ShoppingHomeModel>> getShoppingItems() async {
    return _apiProvider.getShoppingItems();
  }
}