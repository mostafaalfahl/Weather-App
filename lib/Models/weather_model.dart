class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String condtion;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.condtion,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['location']['localtime']),
      image: json['current']['condition']['icon'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      condtion: json['current']['condition']['text'],
    );
  }
}
