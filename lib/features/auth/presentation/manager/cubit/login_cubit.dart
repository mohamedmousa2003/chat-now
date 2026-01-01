import 'package:bloc/bloc.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(InitialLogin());

  Future<void> login(LoginEntity entityLogin) async {
    emit(LoadingLogin());
    try {
      await loginUseCase(entityLogin);
      emit(LoadedLogin(login: entityLogin));
    } catch (e) {
      emit(ErrorLogin(error: e.toString()));
    }
  }

}
