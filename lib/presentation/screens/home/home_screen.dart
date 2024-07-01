
import 'package:currency_app/presentation/screens/home/dialogs/calc_dialog.dart';
import 'package:currency_app/presentation/screens/home/dialogs/lang_change.dart';
import 'package:currency_app/utils/lang_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/source/model/currency_model.dart';
import '../../../utils/status.dart';
import '../../blocs/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext mainContext) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _getCyyText(state.langStatus!),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () async {
                  await _onChangeDate(mainContext);
                },
                  child: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 28
                  )
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: mainContext,
                      builder: (context) {
                        return LangChange(
                            status: state.langStatus!,
                            click: (value) {
                              mainContext.read<HomeBloc>().add(ChangeLang(status: value));
                            }
                        );
                      }
                  );
                },
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 28,
                  )
              ),
              const SizedBox(width: 16)
            ],
            backgroundColor: Colors.deepPurple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: state.status == Status.loading ? _loading() : _success(state.list, state),
            ),
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }

  String _getLangText(LangStatus status, CurrencyModel data){
    switch(status) {
      case LangStatus.uz:
        return data.ccyNmUz!;
      case LangStatus.uzC:
        return data.ccyNmUzc!;
      case LangStatus.ru:
        return data.ccyNmRu!;
      case LangStatus.eng:
        return data.ccyNmEn!;
      default:
        return "";
    }
  }

  String _getCyyText(LangStatus status){
    switch(status) {
      case LangStatus.uz:
        return 'Valyuta';
      case LangStatus.uzC:
        return 'Валюта';
      case LangStatus.ru:
        return 'Валюта';
      case LangStatus.eng:
        return 'Currency';
      default:
        return "";
    }
  }

  String _getCalcText(LangStatus status){
    switch(status) {
      case LangStatus.uz:
        return 'Hisoblash';
      case LangStatus.uzC:
        return 'Хисоблаш';
      case LangStatus.ru:
        return 'Расчитать';
      case LangStatus.eng:
        return 'Calculate';
      default:
        return "";
    }
  }

  Widget _loading() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _success(List<CurrencyModel>? list, HomeState state) {
    if (list == null) {
      return const Center(child: Text('No data available'));
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 12, bottom: 12, right: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              _getLangText(state.langStatus!, state.list![index]),
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              list[index].diff!.startsWith('-') ? list[index].diff! : '+${list[index].diff}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: list[index].diff!.startsWith('-') ? const Color(
                                      0xFFEC4545) : const Color(0xFF06BE23)
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '${list[index].nominal!} ${list[index].ccy!} => ${list[index].rate} | ',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            Image.asset('assets/images/ic_calendar.png', width: 18, height: 18,),
                            Text(
                              ' ${list[index].date!}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<HomeBloc>().add(OpenBottomPart(index: index));
                      },
                        icon: state.openedIndex == index && state.openBottom! ? const Icon(Icons.keyboard_arrow_up, size: 24) : const Icon(Icons.keyboard_arrow_down, size: 24)
                    )
                  ],
                ),
                SizedBox(height: state.openedIndex == index && state.openBottom! ? 12 : 0),
                state.openedIndex == index && state.openBottom! ? Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: CalcDialog(data: state.list![index]),
                              );
                            }
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calculate, size: 18, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(_getCalcText(state.langStatus!), style: const TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ],
                ) : Container()
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemCount: list.length,
    );
  }

  Future<void> _onChangeDate(BuildContext context) async {
    final chosenDate = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (chosenDate == null || !context.mounted) return;
    context.read<HomeBloc>().add(LoadAllByDate(date: chosenDate.toString().substring(0, 10)));
  }
}
