import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgc/bloc/storage/data.dart';
import 'package:vgc/bloc/storage/event.dart';
import 'package:vgc/models/coffee.dart';
import 'package:flutter/material.dart';

import '../bloc/data/data.dart';
import '../bloc/data/event.dart';
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
                        child: Image.network(
                          coffee.image!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("images/logos/logo.png",
                                scale: 2.2,);
                          },
                          loadingBuilder: (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        right: 5.0,
                        top: 5.0,
                        child: GestureDetector(
                          onTap: () => BlocProvider.of<StorageBloc>(context)
                              .add(WriteEvent(coffee.image!)),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
    // return
  }
}
