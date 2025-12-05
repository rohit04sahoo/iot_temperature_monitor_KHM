class IotData {
  final double temperature;
  final double humidity;
  final int soilMoisture;
  final String status;
  final DateTime updatedAt;

  IotData({
    required this.temperature,
    required this.humidity,
    required this.soilMoisture,
    required this.status,
    required this.updatedAt,
  });

  factory IotData.fromJson(Map<String, dynamic> json) {
    return IotData(
      temperature: double.tryParse(json['temperature'].toString()) ?? 0.0,
      humidity: double.tryParse(json['humidity'].toString()) ?? 0.0,
      soilMoisture: int.tryParse(json['soilMoisture'].toString()) ?? 0,
      status: json['status'] ?? "",
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
