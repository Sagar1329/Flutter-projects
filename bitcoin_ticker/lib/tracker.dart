import 'package:http/http.dart';

void getData() async {
  Response response = await get(Uri.parse(
      "https://rest.coinapi.io/v1/exchangerate/BTC/INR?apikey=DF8B4BAC-94FA-414B-A43E-5E10BD0A1306"));
  print(response.body);
}
