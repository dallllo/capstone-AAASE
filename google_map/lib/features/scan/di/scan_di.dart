import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'scan_di.config.dart'; 

@InjectableInit(
  initializerName: 'initScan',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/scan'],
)
void configureScan(GetIt getIt) {
  // getIt.allowReassignment = true;
  getIt.initScan();
}
