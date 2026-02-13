import 'package:bus_tracker/features/driver/add_student/bloc/address_bloc/student_event.dart';
import 'package:bus_tracker/features/driver/add_student/bloc/address_bloc/student_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBloc extends Bloc<StudentEvent,StudentState>{
  StudentBloc():super(StudentState()){
    on<AddressChanged>((event,emit)=>emit(state.copyWith(address: event.address)));
    on<ToggleEntryMode>((event,emit)=>emit(state.copyWith(isManual: !state.isManual)));

  }
}