import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgc/bloc/storage/data.dart';

class SavedPictures extends StatelessWidget {
  const SavedPictures({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StorageBloc, Map>(
        builder: (BuildContext context, state) {
      var files = state["files"];
      if (files == null) {
        return const Center(
          child: Text("No saved pictures"), 
        );
      }
      return GridView.builder(
        itemCount: files.length,
        padding: const EdgeInsets.all(2.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          childAspectRatio: 0.90,
        ),
        itemBuilder: (BuildContext context, int index) {
          var file = files[index]["filePath"];
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
            child: Image.file(
              File(file),
              fit: BoxFit.fill,
            ),
          );
        },
      );
    });
  }
}
