part of 'register_cubit.dart';

enum FormState { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final Username username;
  final Email email;
  final Password password;
  final FormState formState;
  final bool isValid;

  const RegisterFormState({
    this.formState = FormState.invalid,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  RegisterFormState copyWith({
    Username? username,
    Email? email,
    Password? password,
    FormState? formState,
    bool? isValid,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formState: formState ?? this.formState,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [username, email, password, formState, isValid];
}
