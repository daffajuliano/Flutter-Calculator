import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_app/bloc/calculator_bloc.dart';
import 'package:calculator_app/bloc/calculator_event.dart';
import 'package:calculator_app/bloc/calculator_state.dart';
import 'package:calculator_app/model/operators_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CalculatorBloc _calculatorBloc;

  @override
  void initState() {
    _calculatorBloc = CalculatorBloc(CalculatorInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // view
            Expanded(
              key: Key('calculator_view'),
              flex: 2,
              child: Container(
                key: Key("expanded_container_bagian_atas"),
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    BlocBuilder<CalculatorBloc, CalculatorState>(
                      cubit: _calculatorBloc,
                      builder: (context, state) {
                        if (state is Inserting) {
                          return AutoSizeText(
                            state.view,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                          );
                        } else if (state is Calculated) {
                          return AutoSizeText(
                            state.result,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.blue[500],
                            ),
                            maxLines: 1,
                          );
                        } else {
                          return AutoSizeText(
                            "0",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            // button
            Expanded(
              key: Key('calculator_button'),
              flex: 3,
              child: Column(
                children: [
                  // first row
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              'C',
                              style: TextStyle(fontSize: 18, color: Colors.orange),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(Clear());
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Icon(Icons.backspace, color: Colors.grey),
                            onPressed: () {
                              _calculatorBloc.add(Backspace());
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '/',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendOperators(operators: Operators.division));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // second row
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '7',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 7));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '8',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 8));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '9',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 9));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              'x',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendOperators(operators: Operators.multiplication));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // third row
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 4));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 5));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '6',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 6));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendOperators(operators: Operators.substraction));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // fourth row
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 1));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 2));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendNumbers(number: 3));
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(AppendOperators(operators: Operators.addition));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // fifth row
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.blue[300],
                            child: Text(
                              '=',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              _calculatorBloc.add(Calculate());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
