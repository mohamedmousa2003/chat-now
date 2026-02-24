import 'package:chat_now/features/register/data/data_sources/register_data_source.dart';
import 'package:chat_now/features/register/domain/entities/register_entity.dart';
import 'package:chat_now/features/register/domain/repositories/register_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo{

  final RegisterDataSource _registerDataSource;
  RegisterRepoImpl(this._registerDataSource);

  @override
  Future<RegisterEntity> register(RegisterEntity entity) async{
   final  response =await _registerDataSource.register(entity);
   return response;
  }

}