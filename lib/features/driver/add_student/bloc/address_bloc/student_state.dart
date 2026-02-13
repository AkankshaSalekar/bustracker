class StudentState {
  final String address;
  final bool isManual;

  StudentState({
    this.address='',
    this.isManual=false,
  });

  StudentState copyWith({String? address,bool? isManual}){
    return StudentState(
      address: address??this.address,
      isManual: isManual??this.isManual,
    );
  }
}