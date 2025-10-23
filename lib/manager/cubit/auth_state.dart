// حالة التطبيق
class AuthState {
  final bool isLoggedIn;
  final String? userName;
  final bool isLoading;

  AuthState({this.isLoggedIn = false, this.userName, this.isLoading = false});

  AuthState copyWith({bool? isLoggedIn, String? userName, bool? isLoading}) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userName: userName ?? this.userName,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
