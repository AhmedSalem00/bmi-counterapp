import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/modules/todo_app/archived_tasks/archived_tasks.dart';
import 'package:flutter_app/modules/todo_app/done_tasks/done_tasks.dart';
import 'package:flutter_app/modules/todo_app/new_tasks/new_tasks.dart';



import 'package:flutter_app/shared/shared_cubit/states.dart';
import 'package:flutter_app/shared/shared_network/local/cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context)=> BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles =
  [
    ' NewTasks',
    ' DoneTasks',
    ' ArchivedTasks',
  ];
  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }


  late Database database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archivedTasks =[];
  void createDatabase()
  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'create table tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error when creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
          print('database opened');
      },
    ).then((value)
    {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
   await database.transaction((txn)async   {
      txn.rawInsert(
        'INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","New")',
      ).then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database).then((value)
        {

          emit(AppGetDatabaseState());
        });
      }).catchError((error) {
        print('Error when inserting New Record ${error.toString()}');
      });
      //return null;    });
   });
  }

   getDataFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element) {
         if (element['status'] == 'new') {
           newTasks.add(element);
         } else if (element['status'] == 'done') {
           doneTasks.add(element);
         } else {
           archivedTasks.add(element);
         }
       });
       emit(AppGetDatabaseState());
     });
  }

  void updateDate({
  required String status,
  required int id ,
})
  async {
    database.rawUpdate(
        'UPDATE tasks SET status = ?, WHERE id = ?',
        ['$status', id ]).then((value) {
          getDataFromDatabase(database);
          emit(AppUpdateDatabaseState());
    });

  }

  void deleteDate({

    required int id ,
  })
  async {
    database.rawDelete(
        'DELETE FROM Tasks WHERE id = ?', [id])
            .then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });

  }


  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void ChangeBottomSheetState
      ({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());

  }
  bool isDark = false;

  void changeAppMode({ bool? fromShared})
  {
    if (fromShared !=null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else
      {
        isDark = !isDark;
        CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
          emit(AppChangeModeState());
        });
      }
  }
}

