import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itiprojectthree/core/helpers/app_color.dart';
import 'package:itiprojectthree/core/widgets/title_app_bar.dart';
import 'package:itiprojectthree/cuibts/cubit/locations_cubit.dart';

class Locations extends StatelessWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationsCubit()..getLocations(),
      child: BlocBuilder<LocationsCubit, LocationsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: TitleAppBar(title: "Address"),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Builder(
              builder: (context) {
                if (state is LocationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LocationFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is LocationSuccess) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      final location = state.locations[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColor.color808
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text(location.name),
                            subtitle: Text(location.description),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}