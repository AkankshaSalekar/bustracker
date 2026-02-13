
import 'package:bus_tracker/core/utils/pref_helper.dart';
import 'package:bus_tracker/features/auth/bloc/auth_event.dart';
import 'package:bus_tracker/features/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(isDriver: true)) {
    on<SelectRoleEvent>((event, emit) {
      emit(AuthState(isDriver: event.isDriver, errorMessage: null));
    });

    on<DriverLoginEvent>(_driverLogin);

    on<ParentLoginEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      Future.delayed(Duration(seconds: 2));
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(isLoading: false));
    });
  }

  void _loadSavedRole() async {
    final role = await PerfsHelper.getRole();
    emit(state.copyWith(isDriver: role));
  }

  Future<void> _driverLogin(
      DriverLoginEvent event, Emitter<AuthState> emit) async {
    if (_isValidMobile(event.mobile)) {
      emit(state.copyWith(errorMessage: "Enter valid Mobile Number"));
      return;
    }

    if (event.password.length < 6) {
      emit(state.copyWith(errorMessage: "Password must be 6+ characters"));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));
    await PerfsHelper.saveMobile(event.mobile);

    //API call
    await Future.delayed(Duration(seconds: 2));

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _parentLogin(ParentLoginEvent event,Emitter<AuthState> emit)async{
    if(!_isValidMobile(event.mobile)){
      emit(state.copyWith(errorMessage: "Enter Valid Mobile Number"));
      return;
    }

    if(event.password.length<6){
      emit(state.copyWith(errorMessage: "Password must be 6+ characters"));
      return;
    }

    emit(state.copyWith(isLoading: true,errorMessage: null));
    await PerfsHelper.saveMobile(event.mobile);

    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }

  bool _isValidMobile(String mobile) {
    return RegExp(r'^[6-9]\d{9}$').hasMatch(mobile);
  }
}
