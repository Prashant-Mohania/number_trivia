import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:number_pedia/api/api_repository.dart';
import 'package:number_pedia/models/number_model.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  final ApiRepository apiRepository;

  NumberCubit({required this.apiRepository}) : super(NumberInitial());

  void fetchNumTrivia() async {
    await apiRepository
        .fetchNum()
        .then((NumberModel value) => emit(NumberLoaded(msg: value.number)));
  }
}
