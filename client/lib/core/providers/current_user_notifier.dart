import 'package:client/features/auth/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  @override
  //because we are not sure if the user is logged in or not
  UserModel? build() {
    return null;
  }

  void addUser(UserModel user) {
    state = user;
  }
}
