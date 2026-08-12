import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload PDF"),
      ),
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          if (state is UploadSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("PDF uploaded successfully"),
              ),
            );
            context.go("/chat");
          }

          if (state is UploadFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UploadLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text("Choose PDF"),
              onPressed: () {
                context.read<UploadCubit>().pickAndUpload();
              },
            ),
          );
        },
      ),
    );
  }
}