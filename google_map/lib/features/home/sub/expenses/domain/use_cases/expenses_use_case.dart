import 'package:google_map/features/home/sub/expenses/domain/entities/expense_stats_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expenses_entity.dart';
import 'package:google_map/features/home/sub/expenses/domain/repositories/expenses_repository_domain.dart';


@lazySingleton
class ExpensesUseCase {
  final ExpensesRepositoryDomain _repositoryData;

  ExpensesUseCase(this._repositoryData);

    Future<Result<List<ExpensesEntity>, Failure>> getExpenses(String vehicleId) async {
    return _repositoryData.getExpenses(vehicleId);
  }

   Future<Result<ExpenseStatsEntity, Failure>> getExpenseStats(String vehicleId) async {
    return _repositoryData.getExpenseStats(vehicleId);
  }
}
