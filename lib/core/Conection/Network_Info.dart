import 'package:cinemax/core/Errors/NetworkErrors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
class Conectivity {
   static void connectivty_checker (context)async{
    var conected = await Connectivity().checkConnectivity() ;
    print(conected.first) ;
    if (conected.first==ConnectivityResult.none){
      print(conected) ;
      return Networkhandle_erorrs.showMyDialog(context);
    }
 }
}