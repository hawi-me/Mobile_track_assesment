import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnneted;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});
  
  @override
  // TODO: implement isConnneted
  Future<bool> get isConnneted => internetConnectionChecker.hasConnection;
}
