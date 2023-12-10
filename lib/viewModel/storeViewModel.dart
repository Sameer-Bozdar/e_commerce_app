import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../model/storeModel.dart';
import '../respository/storeRepsoitory.dart';
import '../utils/utils.dart';

class StoreViewModel extends ChangeNotifier {
  StoreViewModel() {
    init();
  }

  init() async {
    await fetchStoreApi();
  }

  final _myrepo = StoreRepository();
  ApiResponse<List<StoreModel>> apiResponse = ApiResponse.loading();

  setResponseData(ApiResponse<List<StoreModel>> response) async {
    apiResponse = response;
    notifyListeners();
  }

  fetchStoreApi() async {
    setResponseData(ApiResponse.loading());
    var result = await _myrepo.fetchStore().then((value) {
      // ---------- ye function return nai kar raha result
      // print('${value.title}valueeeeeeeeeeeeeeeeee');
      setResponseData(ApiResponse.completed(value));
      notifyListeners();
      Utils.toastMessage('Completed');
      print('$value + in viewmodel');
    }).onError((error, stackTrace) {
      setResponseData(ApiResponse.error(error.toString()));
      notifyListeners();
    });
    // ye result null he ku ke
    print('$result + in viewmodel'); // 1 issue here that result is null
    // return result;
  }
}
