import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/core/utils/auth_manger.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';
import 'package:hangery/core/utils/pref_helpers.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await _authRepo.login(email: email, password: password);

      await PrefHelpers.saveToken(user.token!);
      await AuthManager.login(user.token!);

      emit(AuthSuccess(user: user, message: "Login Successful"));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final user = await _authRepo.register(
        name: name,
        email: email,
        password: password,
      );

      await PrefHelpers.saveToken(user.token!);
      await AuthManager.login(user.token!);

      emit(AuthSuccess(user: user, message: "Registration Successful"));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    await PrefHelpers.clearToken();
    await AuthManager.logout();
    emit(AuthInitial());
  }
}
