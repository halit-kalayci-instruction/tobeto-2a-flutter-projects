import 'package:firebasebloc/blocs/users/user_event.dart';
import 'package:firebasebloc/blocs/users/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(FetchUserInitial()) {}
}
