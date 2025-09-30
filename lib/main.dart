import 'package:emoti_spend/application/application_bloc.dart';
import 'package:emoti_spend/core/design_system/app_constant.dart';
import 'package:emoti_spend/core/observer/global_bloc_observer.dart';
import 'package:emoti_spend/routes/app_routers.dart';
import 'package:emoti_spend/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (BuildContext context) => ApplicationBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _listenStateChange(_, ApplicationState state) {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationBloc, ApplicationState>(
      listener: _listenStateChange,
      builder: (context, state) {
        return MaterialApp.router(
          title: AppConstant.appName,

          debugShowCheckedModeBanner: false,
          key: state.data.key,
          theme: ThemeConfig.lightTheme,
          routerConfig: appRouter,
        );
      },
    );
  }
}
