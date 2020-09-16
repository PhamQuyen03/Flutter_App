import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Number Trivia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: buildBody(context),
          ),
        ),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NumberTriviaBloc>(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          //top half screen
          BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
            builder: (context, state) {
              if (state is Empty) {
                return MessageDisplay(
                  messsage: 'Start Searching',
                );
              } else if (state is Loading) {
                return LoadingWidget();
              } else if (state is Loaded) {
                return TriviaDisplay(trivia: state.trivia);
              } else if (state is Error) {
                return MessageDisplay(
                  messsage: state.message,
                );
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TriviaControls()
        ],
      ),
    );
  }
}
