import 'package:dart_guard/app/modules/main/repositories/user/firebase_user_repository.dart';
import 'package:dart_guard/app/modules/main/repositories/user/user_repository.dart';
import 'package:dart_guard/app/modules/main/services/login/login_service.dart';
import 'package:dart_guard/app/modules/main/views/login/viewmodel/login_viewmodel.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/auth_repository.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/firebase_auth_repository.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/wrapper_viewmodel.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications__implement.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<WrapperViewmodel>(create: (context) => WrapperViewmodel()),
  Provider<CustomNotifications>(create: (context) => CustomNotificationsImplement()),
  Provider<AuthRepository>(create: (context) => FirebaseAuthRepository()),
  Provider<UserRepository>(create: (context) => FirebaseUserRepository()),
  Provider<LoginService>(
    create: (context) {
      final authRepository = context.read<AuthRepository>();
      final userRepository = context.read<UserRepository>();
      return LoginService(authRepository: authRepository, userRepository: userRepository);
    },
  ),
  ChangeNotifierProvider<LoginViewmodel>(
    create: (context) {
      final loginService = context.read<LoginService>();
      final wrapperViewmodel = context.read<WrapperViewmodel>();
      return LoginViewmodel(loginService: loginService, onSuccessfulLogin: wrapperViewmodel.logIn);
    },
  ),
];
