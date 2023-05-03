import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/config/db_helper.dart';
import 'package:todo_task/feature/home/data/task_model.dart';
import 'package:todo_task/feature/home/presentation/cubit/states.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(InitialTaskState());

  static TaskCubit get(context) => BlocProvider.of(context);

  DBHelper dbHelper = DBHelper();

  void insertIntoDatabase(TaskModel model) {
    dbHelper.insert(model);
    emit(AppInsertDatabaseState());
  }

  getDataFromDatabase() {
    dbHelper.getDataList();
    emit(AppGetDatabaseState());
  }

  deleteDatabase(int id) {
    dbHelper.delete(id);
    emit(AppDeleteDatabaseState());
  }

  updateDatabase(TaskModel model) {
    dbHelper.update(model);
    emit(AppUpdateDatabaseState());
  }
}
