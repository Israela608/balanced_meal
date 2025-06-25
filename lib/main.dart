import 'package:balanced_meal/core/utils/constants.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/modules/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/repos/user_repo.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(AppConst.kWidth, AppConst.kHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child!,
        );
      },
      child: OnboardingScreen(),
      //child: AuthWrapper(),
    );
  }
}

class AuthWrapper extends HookConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSplashComplete = useState(false);
    final isDetailsComplete = useState<bool?>(null);

    /* init() async {
      await UserRepo.getFirstName()
          .then((value) => isDetailsComplete.value = value);
    }*/

    useEffect(() {
      //init();
      // Show Splash for 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        isSplashComplete.value = true;
      });
      return null;
    }, []);

    //if (!isSplashComplete.value) return SplashScreen();

    //if (isDetailsComplete.value == null) return SignUpScreen();

    //if (isDetailsComplete.value!.isEmpty) return SignUpScreen();

    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
