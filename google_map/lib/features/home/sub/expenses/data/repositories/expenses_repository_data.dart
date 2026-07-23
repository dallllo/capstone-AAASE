
import 'package:google_map/features/home/sub/expenses/data/models/expenses_model.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expense_stats_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/network_exceptions.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expenses_entity.dart';
import 'package:google_map/features/home/sub/expenses/data/datasources/expenses_remote_data_source.dart';
import 'package:google_map/features/home/sub/expenses/domain/repositories/expenses_repository_domain.dart';

@LazySingleton(as: ExpensesRepositoryDomain)
class ExpensesRepositoryData implements ExpensesRepositoryDomain{
  final BaseExpensesRemoteDataSource remoteDataSource;


  ExpensesRepositoryData(this.remoteDataSource);

  @override
  Future<Result<ExpenseStatsEntity, Failure>> getExpenseStats(String vehicleId) async {
   try{
    final response = await remoteDataSource.getExpenseStats(vehicleId);
    // response.toList();
      return Success(response);
   }
   catch(error){
      return Error(FailureExceptions.getException(error));
   }
  }

  @override
  Future<Result<List<ExpensesEntity>, Failure>> getExpenses(String vehicleId) async{
    try{
      final response = await remoteDataSource.getExpenses(vehicleId);
      final entities = response.map((item) => item.toEntity()).toList();

      return Success(entities);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }
}


