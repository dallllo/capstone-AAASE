import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_map/features/home/sub/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:google_map/features/home/sub/expenses/presentation/cubit/expenses_state.dart';
import 'package:google_map/features/home/sub/expenses/presentation/pages/expense_history_page.dart';
import 'package:google_map/features/home/sub/expenses/presentation/pages/expense_statistics_page.dart';
import 'package:google_map/features/home/sub/expenses/presentation/widgets/expense_loading_widget.dart';


class ExpensesFeatureWidget extends StatelessWidget {
   final String vehicleId;
  const ExpensesFeatureWidget(this.vehicleId, {super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesCubit(GetIt.I.get()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Expenses'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Statistics'),
                  Tab(text: 'History'),
                ],
              ),
          ),
          body: BlocBuilder<ExpensesCubit, ExpensesState>(
            builder: (context, state){
             switch(state){
              case ExpensesLoadingState _:
              return const ExpenseLoadingWidget();
              case ExpensesErrorState _:
              return Center(child: Text(state.message));
              case ExpensesLoadedState _: 
                  return TabBarView(
                    children: [
                      ExpenseStatisticsPage(
                        stats: state.stats,
                      ),
        
                      ExpenseHistoryPage(
                        expenses: state.expenses,
                      ),
                    ],
                  );
                // default: const SizedBox();
            }
            return const SizedBox();
          }),),
      )
    );
  }
}
