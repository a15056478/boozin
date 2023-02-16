import 'package:bloc/bloc.dart';
import 'package:boozin/models/fitness_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dartz/dartz.dart' as dartz;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateLoading()) {
    HealthFactory health = HealthFactory();
    int _nofSteps = 0;
    int _calories = 0;
    List<HealthDataPoint> _healthDataList = [];
    on<HomeEventInitial>((event, emit) async {
      final data = await fetchData(health, _healthDataList, 0, 0);
      data.fold((l) => emit(HomeStateError(error: l)), (r) {
        emit(HomeStateLoaded(steps: r.steps, calories: r.calories));
      });
    });
  }
}

Future<dartz.Either<String, FitnessDataModel>> fetchData(HealthFactory health,
    List<HealthDataPoint> healthDataList, int noOfStpes, int calories) async {
  final types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  final permissions = [HealthDataAccess.READ, HealthDataAccess.READ];

  final now = DateTime.now();
  final midnight = DateTime(now.year, now.month, now.day);

  bool requested =
      await health.requestAuthorization(types, permissions: permissions);

  await Permission.activityRecognition.request();

  healthDataList.clear();

  if (requested) {
    try {
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(midnight, now, types);
      noOfStpes = await health.getTotalStepsInInterval(midnight, now) ?? 0;
      healthDataList.addAll(healthData);
    } catch (e) {
      // print("Exception in getHealthDataFromTypes: $e");
      return const dartz.Left("Can't fetch data from api...");
    }

    // filter out duplicates
    healthDataList = HealthFactory.removeDuplicates(healthDataList);
    for (var x in healthDataList) {
      calories = calories + double.parse(x.value.toString()).toInt();
    }
    return dartz.Right(FitnessDataModel(noOfStpes, calories.toDouble()));
  } else {
    return const dartz.Left("Required Permissions missing");
    // setState(() => _state = AppState.DATA_NOT_FETCHED);
  }
}
