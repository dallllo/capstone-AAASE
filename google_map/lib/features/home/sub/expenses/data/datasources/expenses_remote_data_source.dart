import 'package:google_map/features/home/sub/expenses/domain/entities/expense_stats_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_map/core/services/local_keys_service.dart';
import 'package:google_map/features/home/sub/expenses/data/models/expenses_model.dart';
import 'package:google_map/core/errors/network_exceptions.dart';

abstract class BaseExpensesRemoteDataSource {
  // Future<ExpensesModel> getExpenses();
  Future<List<ExpensesModel>> getExpenses(String vehicleId);
  Future<ExpenseStatsEntity> getExpenseStats(String vehicleId);
}

@LazySingleton(as: BaseExpensesRemoteDataSource)
class ExpensesRemoteDataSource implements BaseExpensesRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ExpensesRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<ExpensesModel>> getExpenses(String vehicleId) async {
    // try {
    //   return ExpensesModel(id: 1, firstName: "Last Name", lastName: "First Name");
    // } catch (error) {
    //  throw FailureExceptions.getException(error);
    // }
    try {
      print('❤️');
      final response = await _supabase
          .from('expense_records')
          .select()
          .eq('vehicle_id', vehicleId) // vehicleId
          .order('expense_date', ascending: false);
      return response
          .map<ExpensesModel>((e) => ExpensesModel.fromJson(e))
          .toList();
      print('😍');
      print('$response 💕');
    } catch (error) {
      print('❌');
      print(error);
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<ExpenseStatsEntity> getExpenseStats(String vehicleId) async {
    print('❤️');
    final response = await _supabase
        .from('expense_records')
        .select()
        .eq('vehicle_id', 'd4c4ffb3-7d73-415c-be14-b98e1907f9ef');

    double monthly = 0;
    double yearly = 0;
    double fuel = 0;
    double maintenance = 0;

    final now = DateTime.now();

    for (final item in response) {
      // final amount = (item['amount'] as num).toDouble();
      final amount = (item['cost'] as num?)?.toDouble() ?? 0.0;

      final date = DateTime.parse(item['expense_date']);

      if (date.month == now.month) {
        monthly += amount;
      }
      if (date.year == now.year) {
        yearly += amount;
      }

      if (item['category'] == 'service') {
        fuel += amount;
      }

      if (item['category'] == 'maintenance') {
        maintenance += amount;
      }
      print('👀');
      print('$response  👀');

    }
    return ExpenseStatsEntity(
      monthlyTotal: monthly,
      yearlyTotal: yearly,
      fuelTotal: fuel,
      maintenanceTotal: maintenance,
    );
  }
}
