import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_pedia/api/api_repository.dart';
import 'package:number_pedia/logic/cubit/number_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<NumberCubit>(
        create: (context) => NumberCubit(apiRepository: ApiRepository()),
        child: const MyHomePage(title: 'Number Trivia'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NumberCubit>(context).fetchNumTrivia();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<NumberCubit>(context).fetchNumTrivia();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NumberCubit, NumberState>(builder: (context, state) {
          if ((state is! NumberLoaded)) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.msg.split(" ")[0], textScaleFactor: 5),
              const SizedBox(height: 20),
              Text(
                state.msg,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              )
            ],
          );
        }),
      ),
    );
  }
}
