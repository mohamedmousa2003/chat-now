import 'package:bloc/bloc.dart';
import 'package:chat/features/auth/domain/entities/register_entity.dart';
import 'package:chat/features/auth/domain/use_cases/register_usecase.dart';
import 'package:chat/features/auth/presentation/manager/state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(InitialRegister());

  Future<void> register(RegisterEntity entityRegister) async {
    emit(RegisterLoading());
    try {
      await registerUseCase(entityRegister);
      emit(RegisterLoaded(registerEntity: entityRegister));
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}
