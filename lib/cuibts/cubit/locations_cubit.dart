import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:itiprojectthree/core/models/locations.dart';
import 'package:meta/meta.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitial());
  final Dio dio = Dio();
  Future<void> getLocations() async {
    emit(LocationLoading());
    try {
      Response response = await dio.get(
        'https://api.escuelajs.co/api/v1/locations',
      );
      List<LocationModel> locations =
          (response.data as List)
              .map((e) => LocationModel.fromJson(e))
              .toList();
      emit(LocationSuccess(locations));
    } catch (e) {
      emit(LocationFailure(e.toString()));
    }
  }
}
