import 'package:vgc/bloc/data/data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/screen/data.dart';
import 'bloc/storage/data.dart';
import 'constants/constants.dart';
import 'routes/routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DataBloc>(create: (context) => DataBloc()),
        BlocProvider<ScreenBloc>(create: (context) => ScreenBloc()),
        BlocProvider<StorageBloc>(create: (context) => StorageBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: routers,
    );
  }
}
