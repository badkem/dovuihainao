
import 'package:get_it/get_it.dart';
import 'package:lichamduong/src/resource/services/sound.dart';

GetIt locator = new GetIt.asNewInstance();

void setupLocator(){
  locator.registerSingleton(SoundService());
}