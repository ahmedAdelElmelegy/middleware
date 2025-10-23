// Cubit لإدارة المصادقة
import 'package:bloc/bloc.dart';
import 'package:middleware_tasks/manager/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  // تسجيل الدخول
  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));

    // محاكاة عملية تسجيل الدخول
    await Future.delayed(Duration(seconds: 1));

    if (email == 'user@test.com' && password == '123456') {
      emit(
        state.copyWith(
          isLoggedIn: true,
          userName: 'مستخدم التطبيق',
          isLoading: false,
        ),
      );
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  // تسجيل الخروج
  void logout() {
    emit(AuthState());
  }
}
