part of 'locations_cubit.dart';

@immutable
sealed class LocationsState {}

final class LocationsInitial extends LocationsState {}
final class LocationLoading extends LocationsState {}

final class LocationSuccess extends LocationsState {
  final List<LocationModel> locations;
  LocationSuccess(this.locations);
}

final class LocationFailure extends LocationsState {
  final String message;

  LocationFailure(this.message);
}