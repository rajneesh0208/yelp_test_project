import 'package:flutter/cupertino.dart';

import '../service/api.dart';
import '../service/model.dart';

class StoreProvider with ChangeNotifier{

  List<Business> businessesList = [];
   int total = 0;

  storeData(context) async{
    var res = await Api().getStoreList(context);
    if(res != null){
      businessesList = res.businesses;
    }
}

}