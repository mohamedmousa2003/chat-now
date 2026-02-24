// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/login/data/data_sources/login_data_source.dart' as _i973;
import '../features/login/data/data_sources/login_data_source_impl.dart'
    as _i108;
import '../features/login/data/repositories/login_repo_impl.dart' as _i497;
import '../features/login/domain/repositories/login_repo.dart' as _i168;
import '../features/login/domain/use_cases/login_use_case.dart' as _i463;
import '../features/login/presentation/view_model/login_cubit.dart' as _i321;
import '../features/register/data/data_sources/register_data_source.dart'
    as _i399;
import '../features/register/data/data_sources/register_data_source_imple.dart'
    as _i346;
import '../features/register/data/repositories/register_repo_impl.dart'
    as _i776;
import '../features/register/domain/repositories/register_repo_contract.dart'
    as _i731;
import '../features/register/domain/use_cases/register_use_case.dart' as _i382;
import '../features/register/presentation/view_model/register_cubit.dart'
    as _i1062;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i399.RegisterDataSource>(() => _i346.RegisterDataSourceImpl());
    gh.factory<_i973.LoginDataSource>(() => _i108.LoginDataSourceImpl());
    gh.factory<_i168.LoginRepo>(
      () => _i497.LoginRepoImpl(gh<_i973.LoginDataSource>()),
    );
    gh.factory<_i731.RegisterRepo>(
      () => _i776.RegisterRepoImpl(gh<_i399.RegisterDataSource>()),
    );
    gh.factory<_i382.RegisterUseCase>(
      () => _i382.RegisterUseCase(gh<_i731.RegisterRepo>()),
    );
    gh.factory<_i463.LoginUseCase>(
      () => _i463.LoginUseCase(gh<_i168.LoginRepo>()),
    );
    gh.factory<_i321.LoginCubit>(
      () => _i321.LoginCubit(gh<_i463.LoginUseCase>()),
    );
    gh.factory<_i1062.RegisterCubit>(
      () => _i1062.RegisterCubit(gh<_i382.RegisterUseCase>()),
    );
    return this;
  }
}
