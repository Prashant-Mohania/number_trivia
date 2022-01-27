part of 'number_cubit.dart';

@immutable
abstract class NumberState {}

class NumberInitial extends NumberState {}

class NumberLoaded extends NumberState {
  final String msg;
  NumberLoaded({required this.msg});
}
