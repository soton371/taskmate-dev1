import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate/app/routes/app_router.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/core/services/db_services.dart';
import 'features/chat/presentation/bloc/assistant_bloc.dart';
import 'features/splash/page/splash_page.dart';
import 'features/task/presentation/bloc/task_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBServices.setup();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (BuildContext context) => TaskBloc(),
        ),
        BlocProvider<AssistantBloc>(
          create: (BuildContext context) => AssistantBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Task Mate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
          fontFamily: 'Lato',
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            backgroundColor: AppColors.seed,
            foregroundColor: Colors.white
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  double.maxFinite,
                  AppSizes.buttonHeight,
                ),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
              textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: AppSizes.buttonText,fontFamily: 'Lato')
            )
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                fixedSize: Size(
                  double.maxFinite,
                  AppSizes.buttonHeight,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
                textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: AppSizes.buttonText,fontFamily: 'Lato'),
              backgroundColor: AppColors.seed
            )
          ),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(
                    double.maxFinite,
                    AppSizes.buttonHeight,
                  ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
                    textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: AppSizes.buttonText,fontFamily: 'Lato'),)
            ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.scaffoldBg,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.black,
              fontFamily: 'Lato'
            )
          ),
          scaffoldBackgroundColor: AppColors.scaffoldBg
        ),
        home: const SplashPage(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
