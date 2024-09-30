import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../models/models.dart';
import 'widget.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context).add(const SplashEvent());
    return BlocConsumer<DataBloc, Map>(
      buildWhen: (previous, current) => current["file"] != null,
      listener: (BuildContext context, Map state) {
        if (state.keys.first == "message") {
          showCustomSnackBar(context: context, message: state["message"]);
        }
      },
      builder: (BuildContext context, Map state) {
        if (state["file"] != null) {
          Coffee coffee = Coffee.fromJson(state);
          return Center(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 4.0,
                  ),
                  child: Stack(
                    children: [
                      const Positioned.fill(child:  Center(child: Text("loading ...."))),
                      Positioned.fill(
                        child: CustomImage(image: coffee.image!),
                      ),
                      Positioned(
                        right: 5.0,
                        top: 5.0,
                        child: SaveFavImage(image:coffee.image!),
                      ),
                    ],
                  ),
                )),
          );
        } else {
          return const Center(child:  Text("No image to show"));
        }
      },
    );
  }
}
