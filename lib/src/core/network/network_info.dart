part of 'network.dart';


abstract class NetworkInfo {
  Future<bool> get isConncted;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  Future<bool> get isConncted => connectionChecker.hasConnection;
}
