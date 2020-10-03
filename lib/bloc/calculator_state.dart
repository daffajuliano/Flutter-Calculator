import 'package:equatable/equatable.dart';

abstract class CalculatorState extends Equatable {
  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {}

class LastNumbers extends CalculatorState {}

class LastOperators extends CalculatorState {}

class Inserting extends CalculatorState {
  final String view;

  Inserting({this.view});

  @override
  List<Object> get props => [view];
}

class Calculated extends CalculatorState {
  final String result;

  Calculated({this.result});

  @override
  List<Object> get props => [result];
}
