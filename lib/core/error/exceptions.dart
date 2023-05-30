import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends ServerException {
  const FetchDataException({message}) : super('Error During Communication');
}

class BadRequestException extends ServerException {
  const BadRequestException({message}) : super('Bad Request');
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException({message}) : super('Unauthorized');
}

class NotFoundException extends ServerException {
  const NotFoundException({message}) : super('Request Not Found');
}

class ConflictException extends ServerException {
  const ConflictException({message}) : super('Conflict Occurred');
}

class InternalServerException extends ServerException {
  const InternalServerException({message}) : super('Internal Server Error');
}

class NoInternetException extends ServerException {
  const NoInternetException({message}) : super('No Internet Connection');
}

class CacheException implements Exception {}
