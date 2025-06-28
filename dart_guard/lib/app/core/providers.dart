import 'package:dart_guard/app/modules/main/views/login/viewmodel/login_viewmodel.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/auth_repository.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/firebase_auth_repository.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications__implement.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider<CustomNotifications>(create: (context) => CustomNotificationsImplement()),
  Provider<AuthRepository>(create: (context) => FirebaseAuthRepository()),
  ChangeNotifierProvider<LoginViewmodel>(create: (context) => LoginViewmodel()),
];
