

import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';

class HomeViewModel extends ChangeNotifier {
  final DialogService _dialogService = locator<DialogService>();
  Future doThings() async  {
    print("dialog shown");
    var dialogResult = await _dialogService.showDialog(
      title: 'Dialog Manager',
      description: 'Tutorial of dialog manager',
    );
   if (dialogResult.confirm){
     print('User has confirmed');}
     else{
       print ('User has canceled');
   }
  }
}