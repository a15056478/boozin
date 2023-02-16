import 'package:boozin/miscellaneous/text-style.dart';
import 'package:boozin/miscellaneous/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/health_data_card_widget.dart';
import '../home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _bloc = HomeBloc()..add(HomeEventInitial());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is HomeStateError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
            body: state is HomeStateLoaded
                ? Container(
                    width: width,
                    color: context.isDarkMode ? Colors.black : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0.w),
                          child: Text(
                            'Hi!',
                            style: context.isDarkMode
                                ? ThemeText.s32w700White
                                : ThemeText.s32w700Black,
                          ),
                        ),
                        HeathDataCardWidget(
                          headerText: 'Steps',
                          imgPath: context.isDarkMode
                              ? 'assets/images/ion_footsteps-sharp_dark.png'
                              : 'assets/images/ion_footsteps-sharp_light.png',
                          goalValue: 5000,
                          width: width,
                          value: state.steps.toDouble(),
                        ),
                        HeathDataCardWidget(
                          headerText: 'Calories Burned:',
                          imgPath: context.isDarkMode
                              ? 'assets/images/icon_calori_burned_dark.png'
                              : 'assets/images/icon_calori_burned_light.png',
                          goalValue: 5000,
                          width: width,
                          value: state.calories,
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          );
        },
      ),
    );
  }
}
