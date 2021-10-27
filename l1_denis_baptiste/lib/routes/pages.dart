import 'package:get/get.dart';

import 'routes.dart';
import '../screens/index.dart';
import '../bindings/index.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<HomeScreen>(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      //binding: StartBinding(),
      preventDuplicates: true,
    ),
    GetPage<ProfileScreen>(
      name: AppRoutes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      preventDuplicates: true,
    ),
    GetPage<SettingsScreen>(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsScreen(),
      //binding: StartBinding(),
      preventDuplicates: true,
    ),
    GetPage<LoginScreen>(
      name: AppRoutes.LOGIN,
      page: () => const LoginScreen(),
      //binding: StartBinding(),
      preventDuplicates: true,
    ),
    GetPage<RegisterScreen>(
      name: AppRoutes.REGISTER,
      page: () => const RegisterScreen(),
      //binding: StartBinding(),
      preventDuplicates: true,
    ),
    GetPage<PostScreen>(
      name: AppRoutes.POST,
      page: () => const PostScreen(),
      //binding: StartBinding(),
      preventDuplicates: true,
    ),
  ];
}
