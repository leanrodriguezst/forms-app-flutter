import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/email.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';
import 'package:forms_app/infrastructure/inputs/username.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formState: FormState.validating,
        username: Username.dirty(value: state.username.value),
        password: Password.dirty(value: state.password.value),
        email: Email.dirty(value: state.email.value),
        isValid: Formz.validate([state.username, state.password, state.email]),
      ),
    );

    print('State: $state');
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value: value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password, state.email]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value: value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password, state.username]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value: value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }
}
