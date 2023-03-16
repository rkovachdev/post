class ApiModel{
  final String message;
  final dynamic body;
  final int statusCode;

  ApiModel({required this.body, required this.message, required this.statusCode});

  Map<String, dynamic> toJson(){
    return {
      "statusCode": statusCode,
      "body": body,
      "message": message
    };
  }
}
