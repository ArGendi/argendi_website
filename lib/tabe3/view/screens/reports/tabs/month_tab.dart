import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:AG/tabe3/cubits/all_sells/all_sells_cubit.dart';
import 'package:AG/tabe3/cubits/reports/reports_cubit.dart';
import 'package:AG/tabe3/models/sell.dart';
import 'package:AG/tabe3/view/screens/all_sells_screen.dart';
import 'package:AG/tabe3/view/widgets/report_card.dart';

class MonthTab extends StatefulWidget {
  const MonthTab({super.key});

  @override
  State<MonthTab> createState() => _MonthTabState();
}

class _MonthTabState extends State<MonthTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<Sell> all = AllSellsCubit.get(context).sells;
    ReportsCubit.get(context).setMonthReport(all);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<ReportsCubit, ReportsState>(
        builder: (context, state) {
          return ListView(
            children: [
              GestureDetector(
                onTap: () {
                  if(ReportsCubit.get(context).month!.sells.isNotEmpty)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AllSellsScreen(
                                sells: ReportsCubit.get(context).month!.sells,
                              )));
                },
                child: ReportCard(
                  text: "Number of sells",
                  quantity: ReportsCubit.get(context).month?.noOfSells ?? 0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ReportCard(
                  text: "Total income",
                  quantity: ReportsCubit.get(context).month?.totalIncome ?? 0),
              SizedBox(
                height: 15,
              ),
              ReportCard(
                text: "Profit",
                quantity: ReportsCubit.get(context).month?.totalProfit ?? 0,
                color: (ReportsCubit.get(context).month?.totalProfit ?? 0) >= 0
                    ? Colors.green.shade600
                    : Colors.red.shade600,
              ),
            ],
          );
        },
      ),
    );
  }
}