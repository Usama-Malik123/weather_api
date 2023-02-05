import 'package:get/get.dart';
import 'package:weather_app/snack_bar.dart';
import 'package:weather_app/weather_model.dart';
import 'package:weather_app/weather_service.dart';

class WeatherController extends GetxController {
  final weatherService = Get.put(WeatherService());

  Future<Weather> getWeatherData() async {
    var res;
    try {
      res = await weatherService.getWeather();
      if (res.statusCode != 200 || res.statusCode != 201) {
      
        return WeatherSnackBars.errorSnackBar(message: res.data['message']);
      } else {}
    } catch (e) {
      WeatherSnackBars.errorSnackBar(message: e.toString());
    }
    return Weather.fromJson(res.data);
  }}
