import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stocks_assessment/cubits/base_cubit.dart';
import 'package:flutter_stocks_assessment/cubits/stocks_cubit.dart';
import 'package:flutter_stocks_assessment/models/company_stocks_response.dart';
import 'package:flutter_stocks_assessment/models/stocks_company_response.dart';
import 'package:flutter_stocks_assessment/router/routes.dart';
import 'package:flutter_stocks_assessment/widgets/action_button.dart';
import 'package:flutter_stocks_assessment/widgets/common_text_field.dart';
import 'package:flutter_stocks_assessment/widgets/error_widget.dart';
import 'package:flutter_stocks_assessment/widgets/labeled_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stocks'),
          centerTitle: true,
        ),
        body: BlocProvider<StocksCubit>(
            create: (_) => StocksCubit()..fetchStocks(),
            child:
                BlocBuilder<StocksCubit, CubitState>(builder: (context, state) {
              var cubit = context.read<StocksCubit>();
              // cubit.initDatesController();
              return Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: LabeledTextField(
                          controller: cubit.dateFromController,
                          hintText: 'Date from',
                          maxLines: 1,
                          readOnly: true,
                          height: 45,
                          contentPadding:
                              const EdgeInsets.fromLTRB(17, 0, 17, 0),
                          onTapTextField: () async {
                            var date = await cubit.selectDate(context);
                            if (date != null && date.isNotEmpty) {
                              cubit.dateFromController.text = date;
                              cubit.refreshUI();
                            }
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: LabeledTextField(
                          controller: cubit.dateToController,
                          hintText: 'Date to',
                          maxLines: 1,
                          height: 45,
                          readOnly: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(17, 0, 17, 0),
                          onTapTextField: () async {
                            var date = await cubit.selectDate(context);
                            if (date != null && date.isNotEmpty) {
                              cubit.dateToController.text = date;
                              cubit.refreshUI();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ActionButton(
                    title: 'Get stocks',
                    onPressed: () {
                      var valid = cubit.datesValid();
                      if (!valid) {
                        return;
                      }
                      cubit.fetchStocks(
                          dateFrom: cubit.dateFromController.text,
                          dateTo: cubit.dateToController.text);
                    },
                    width: 200,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(child: _getStocksList(state))
                ],
              );
            })));
  }

  Widget _getStocksList(CubitState state) {
    return Builder(builder: (_) {
      if (state is DataLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is DataLoaded) {
        if (state.customModel == null) {
          return MyErrorWidget();
        }
        CompanyStocksResponse? response =
            state.customModel as CompanyStocksResponse;
        if (response.data != null && response.success) {
          return Column(
            children: [
              Expanded(
                child: response.data!.isNotEmpty
                    ? Column(
                      children: [

                        ListView.separated(
                            shrinkWrap: true,
                            itemCount: response.data?.length ?? 0,
                            separatorBuilder: (_, index) {
                              return Container(
                                height: .5,
                                color: Colors.grey,
                              );
                            },
                            itemBuilder: (_, int index) {
                              return ListTile(
                                title: Text(response.data![index].high
                                        ?.toStringAsFixed(2) ??
                                    ''),
                                subtitle: Text(
                                    response.data?[index].low?.toStringAsFixed(2) ??
                                        ''),
                                trailing: Text(response.data?[index].symbol ?? ''),
                              );
                            }),
                      ],
                    )
                    : MyErrorWidget(
                        message: 'No stocks data found in this range. Change date selection.',
                      ),
              ),
            ],
          );
        }
        return MyErrorWidget(
          message: response.message,
        );
      }
      return MyErrorWidget();
    });
  }
}
