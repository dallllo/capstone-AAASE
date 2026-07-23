import 'package:equatable/equatable.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expense_stats_entity.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expenses_entity.dart';

abstract class ExpensesState extends Equatable {
  const ExpensesState();
  @override
  List<Object?> get props => [];
}

class ExpensesInitialState extends ExpensesState {}
class ExpensesLoadingState extends ExpensesState {}
class ExpensesLoadedState extends ExpensesState {
  final List<ExpensesEntity> expenses;
  final ExpenseStatsEntity stats;
  const ExpensesLoadedState(this.expenses, this.stats);
  @override
  List<Object?> get props => [expenses, stats];
}

class ExpensesErrorState extends ExpensesState {
  final String message;
  const ExpensesErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

