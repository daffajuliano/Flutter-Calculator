import 'package:calculator_app/model/operators_enum.dart';
import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  CalculatorEvent();
}

class AppendNumbers extends CalculatorEvent {
  final int number;

  AppendNumbers({this.number});

  @override
  List<Object> get props => [number];
}

class AppendOperators extends CalculatorEvent {
  final Operators operators;

  AppendOperators({this.operators});

  @override
  List<Object> get props => [operators];
}

class Clear extends CalculatorEvent {
  @override
  List<Object> get props => [];
}

class Backspace extends CalculatorEvent {
  @override
  List<Object> get props => [];
}

class Calculate extends CalculatorEvent {
  @override
  List<Object> get props => [];
}
