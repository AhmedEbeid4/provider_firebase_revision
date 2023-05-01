import 'package:flutter/foundation.dart';

import '../api/api_service.dart';

class ProviderExample with ChangeNotifier{
  late ApiService _apiService;
  String _currId = '';
  bool isLoading = false;
  List<String> currData = [];

  ProviderExample(){
    _apiService = ApiService();
  }

  set currId(String input){
    _currId = input;
    _fetch(input);
  }

  void add(String value)async{
    currData.add(value);
    await _apiService.putData(_currId, currData);
    notifyListeners();
  }
  void _fetch(String id) async {
    isLoading = true;
    notifyListeners();
    final res = await _apiService.getData(id);
    print('$res');
    if(res != null){
      List<String> l = [];
      for (var element in res) {
        l.add('$element');
      }
      currData = l;
    }
    isLoading = false;
    notifyListeners();
  }
}