import '../widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VGC Cafe",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ScreenBloc, int>(
          builder: (BuildContext context, int state) {
        return IndexedStack(
          index: state,
          children: const [
            CustomPageView(),
            SavedPictures(),
          ],
        );
      }),
      bottomNavigationBar: SizedBox(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text("LOAD"),
              onPressed: () {
                BlocProvider.of<DataBloc>(context).add(const SplashEvent());
                BlocProvider.of<ScreenBloc>(context).add(const Zero());
              },
            ),
            const VerticalDivider(),
            TextButton(
              onPressed: () {
                BlocProvider.of<ScreenBloc>(context).add(const One());
                BlocProvider.of<StorageBloc>(context).add(const ReadEvent());
              },
              child: const Text("SAVED"),
            ),
          ],
        ),
      ),
    );
  }
}
