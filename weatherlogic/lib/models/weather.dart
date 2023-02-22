class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  ///222222
  final String city;
  final String? countru;
  final double temp;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,

    ///222

    required this.city,
    this.countru,
    required this.temp,
  });
}
