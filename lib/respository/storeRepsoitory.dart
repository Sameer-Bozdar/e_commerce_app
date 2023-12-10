
import '../data/network/baseApiService.dart';
import '../data/network/networkApiServices.dart';
import '../model/storeModel.dart';
import '../res/app_url.dart';

class StoreRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<StoreModel>> fetchStore() async {
    try {
      List<dynamic> response =
          await _apiServices.getGetApiResponse(AppUrl.productEndPoint);

      // return StoreModel.fromJson(response); // 2 issue here ( its list of Maps not one item)
      List<StoreModel> responseList =
          response.map((e) => StoreModel.fromJson(e)).toList();
      return responseList;
      // print(response + 'in respository');
      // return response;
    } catch (e) {
      rethrow;
    }
  }
}
