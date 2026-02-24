// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
//
// part 'register_state.dart';
//
import 'package:bloc/bloc.dart';
import 'package:chat_now/features/register/presentation/view_model/register_state.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/register_entity.dart';
import '../../domain/use_cases/register_use_case.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());
  final RegisterUseCase _registerUseCase;
  Future<void> createAccount(RegisterEntity entity)async{
    emit(RegisterLoading());
    try {
      final response = await _registerUseCase.call(entity);
      emit(RegisterLoaded(response));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }

  }
}
