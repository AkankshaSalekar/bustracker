abstract class StudentEvent {}

class AddressChanged extends StudentEvent{
  final String address;
  AddressChanged(this.address);
}

class ToggleEntryMode extends StudentEvent{}