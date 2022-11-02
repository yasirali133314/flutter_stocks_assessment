import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stocks_assessment/cubits/base_cubit.dart';
import 'package:flutter_stocks_assessment/cubits/stock_detail_cubit.dart';
import 'package:flutter_stocks_assessment/models/stocks_response.dart';
import 'package:flutter_stocks_assessment/widgets/error_widget.dart';

class StockDetailScreen extends StatelessWidget {
  const StockDetailScreen({Key? key, this.symbol = ''}) : super(key: key);
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(symbol),
      ),
      body: BlocProvider<StocksDetailCubit>(
        create: (_) => StocksDetailCubit()..fetchStocksForSymbol(symbol),
        child: BlocBuilder<StocksDetailCubit, CubitState>(
            builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoaded) {
            if (state.customModel == null) {
              return MyErrorWidget();
            }
            StocksResponse? response = state.customModel as StocksResponse;
            if (response.data != null &&
                response.data!.eod != null &&
                response.data!.eod!.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.data!.eod!.length,
                  itemBuilder: (_, int index) {
                    return ListTile(
                      title: Text(
                          response.data!.eod![index].high?.toStringAsFixed(2) ??
                              ''),
                      subtitle: Text(response.data!.eod![index].symbol ?? ''),
                      trailing: Text(
                          response.data!.eod![index].low?.toStringAsFixed(2) ??
                              ''),
                    );
                  });
            }
            return MyErrorWidget(
              message: response.message,
            );
          }
          return MyErrorWidget();
        }),
      ),
    );
  }
}
