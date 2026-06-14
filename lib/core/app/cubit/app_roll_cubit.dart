import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/constants/app_roles.dart';

class AppRoleCubit extends Cubit<AppRoleEnum> {
  AppRoleCubit() : super(AppRoleEnum.patient);
  //

  Future switchRole(AppRoleEnum role) async {
    emit(role);
  }
}
