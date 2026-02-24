import 'package:bloc/bloc.dart';
import 'package:chat_now/features/login/domain/use_cases/login_use_case.dart';
import 'package:injectable/injectable.dart';

import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final LoginUseCase _loginUseCase;


  Future<void> login(String email , String password)async{
    emit(LoginLoading());
    try {
    final response = await _loginUseCase.call(email, password);
    emit(LoginLoaded(response));
    } catch (e) {
    emit(LoginError(e.toString()));
    }

  }
}
