abstract class AuthEvent {}

class SelectRoleEvent extends AuthEvent{
  final bool isDriver;
  SelectRoleEvent(driver, {required this.isDriver});

}

class DriverLoginEvent extends AuthEvent{
  final String mobile;
  final String password;

  DriverLoginEvent({required this.mobile,required this.password});

}

class ParentLoginEvent extends AuthEvent{
  final String mobile;
  final String password;

  ParentLoginEvent({required this.mobile,required this.password});
  
}