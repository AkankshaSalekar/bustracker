class AuthState {

  final bool isDriver;
  final bool isLoading;
  final String? errorMessage;
  

  AuthState({required this.isDriver, this.isLoading=false,this.errorMessage});

  AuthState copyWith({bool? isDriver,bool? isLoading,String? errorMessage}){
    return AuthState(isDriver:  isDriver??this.isDriver, isLoading: isLoading??this.isLoading,errorMessage: errorMessage);
  }
}