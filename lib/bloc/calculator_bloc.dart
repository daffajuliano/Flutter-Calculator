import 'package:bloc/bloc.dart';
import 'package:calculator_app/bloc/calculator_event.dart';
import 'package:calculator_app/bloc/calculator_state.dart';
import 'package:calculator_app/model/operators_enum.dart';
import 'package:expressions/expressions.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc(CalculatorState initialState) : super(initialState);

  bool lastNumber;
  var cal = "";
  var view = "";

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    if (event is AppendNumbers) {
      lastNumber = true;
      cal = cal + "${event.number}";
      view = view + "${event.number}";

      yield Inserting(view: view);
    }

    if (event is AppendOperators) {
      if (lastNumber) {
        lastNumber = false;
        if (event.operators == Operators.addition) {
          cal = cal + "+";
          view = view + " + ";
        } else if (event.operators == Operators.substraction) {
          cal = cal + "-";
          view = view + " - ";
        } else if (event.operators == Operators.division) {
          cal = cal + "/";
          view = view + " / ";
        } else if (event.operators == Operators.multiplication) {
          cal = cal + "*";
          view = view + " * ";
        } else {
          cal = cal + "Unknown Operators";
          view = view + " Unknown Operators ";
        }
      }

      yield Inserting(view: view);
    }

    if (event is Clear) {
      cal = "";
      view = "";

      yield CalculatorInitial();
    }

    if (event is Backspace) {
      if (view.length == 1) {
        cal = "";
        view = "";

        yield CalculatorInitial();
      } else {
        cal = cal.substring(0, cal.length - 1);
        if (view.endsWith(' ')) {
          view = view.substring(0, view.length - 3);
        } else {
          view = view.substring(0, view.length - 1);
        }
        yield Inserting(view: view);
      }
    }

    if (event is Calculate) {
      var expression = Expression.parse(cal);
      var context;
      final evaluator = const ExpressionEvaluator();
      var calculated = evaluator.eval(expression, context);
      var result = getClearNumber(calculated);
      yield Calculated(result: result);
    }
  }

  static String getClearNumber(var number) {
    number = number.abs();
    final str = number.toStringAsFixed(number.truncateToDouble() == number ? 0 : 2);
    if (str == '0') return '0';
    if (str.endsWith('.0')) return str.substring(0, str.length - 2);
    if (str.endsWith('0')) return str.substring(0, str.length - 1);
    return str;
  }
}
