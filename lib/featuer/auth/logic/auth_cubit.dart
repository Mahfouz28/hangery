import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';

part 'auth_State.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await _authRepo.login(email: email, password: password);

      emit(AuthSuccess(user: user, message: "LOGIN SUCCESSFUL"));
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
      emit(AuthSuccess(user: user, message: "Registration Successful"));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
