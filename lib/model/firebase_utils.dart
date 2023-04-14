import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_task/model/task_model.dart';

CollectionReference<TaskModel> getTaskCollectionReference() {
  return FirebaseFirestore.instance.collection('task').withConverter<TaskModel>(
        fromFirestore: (snapshot, options) =>
            TaskModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addTaskToFirebase(TaskModel model) {
  var collection = getTaskCollectionReference();
  var docRef = collection.doc();
  model.id = docRef.id;
  return docRef.set(model);
}
