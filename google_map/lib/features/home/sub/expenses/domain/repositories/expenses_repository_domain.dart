import 'package:google_map/features/home/sub/expenses/domain/entities/expense_stats_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expenses_entity.dart';

abstract class ExpensesRepositoryDomain {
    Future<Result<List<ExpensesEntity>, Failure>> getExpenses(String vehicleId);
    Future<Result<ExpenseStatsEntity, Failure>> getExpenseStats(String vehicleId);
}
