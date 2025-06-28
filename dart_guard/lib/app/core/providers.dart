import 'package:dart_guard/app/modules/auth/login/viewmodel/login_viewmodel.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications.dart';
import 'package:dart_guard/app/shared/notifications/custom_notifications__implement.dart';
import 'package:provider/provider.dart';

final providers = [
  Provider<CustomNotifications>(create: (context) => CustomNotificationsImplement()),
  ChangeNotifierProvider<LoginViewmodel>(create: (context) => LoginViewmodel()),
];
