import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/features/home/presentation/cubit/home_cubit.dart';
import 'package:google_map/features/home/sub/add_car/presentation/pages/add_car_feature_widget.dart';
import 'package:google_map/features/home/sub/expenses/presentation/pages/expenses_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Feature Screen')),
      body: Column(
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final screenSize = MediaQuery.of(context).size;
                    return Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(20),
                        child: Container(
                          width: screenSize.width * 0.85,
                          height: screenSize.height * 0.60,
                          padding: const EdgeInsets.all(16),
                          child: const AddCarFeatureWidget(),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.money),
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ExpensesFeatureWidget('d4c4ffb3-7d73-415c-be14-b98e1907f9ef')),
              );
            },
            child: SizedBox(child: Text('expenses ..')),
          ), //Text('expences'))
        ],
      ),
    );
  }
}
