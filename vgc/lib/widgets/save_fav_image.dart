import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgc/bloc/storage/data.dart';
import 'package:vgc/bloc/storage/event.dart';

class SaveFavImage extends StatelessWidget {
  final String image;
  const SaveFavImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<StorageBloc>(context).add(WriteEvent(image));
        return;
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.brown, borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      ),
    );
  }
}
