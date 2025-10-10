import 'package:emoti_spend/application/application_bloc.dart';
import 'package:emoti_spend/core/design_system/app_constant.dart';
import 'package:emoti_spend/core/observer/global_bloc_observer.dart';
import 'package:emoti_spend/firebase_options.dart';
import 'package:emoti_spend/routes/app_routers.dart';
import 'package:emoti_spend/theme/theme_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
