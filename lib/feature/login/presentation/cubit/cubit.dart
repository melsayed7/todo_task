import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/feature/login/presentation/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void login(String email, String password) async {
    emit(LoadingLoginState());
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email).then((value) {
      prefs.setString('password', password);
      emit(SuccessfulLoginState());
    }).catchError((error) {
      emit(ErrorLoginState());
    });
  }
}
