import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_map/core/constants/app_colors.dart';
import 'package:google_map/features/home/sub/expenses/domain/entities/expenses_entity.dart';

class ExpenseHistoryPage extends StatelessWidget {
  final List<ExpensesEntity> expenses;

  const ExpenseHistoryPage({
    super.key,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return 
    
    ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final item = expenses[index];
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              /// TIMELINE
              Column(
                children: [

                  /// line top
                  Container(
                    width: 2,
                    height: 30,
                    color: AppColors.textSecondary,
                  ),

                  /// dot
                  Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),

                  /// line bottom
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const Gap(16),

              /// CONTENT
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:
                        BorderRadius.circular(16),
                  ),

                  child: Column(
                    crossAxisAlignment: .start,

                    children: [

                      Text(
                        item.category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Gap(8),

                      Text(
                        '${item.cost} SAR',
                      ),

                      const Gap(4),

                      Text(
                        '${item.odometer} KM',
                      ),

                      const Gap(4),

                      Text(DateFormat('dd MMM yyyy').format(item.expenseDate!))
                      
                      // Text(
                      //   item.expenseDate
                      //       .toString(),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}