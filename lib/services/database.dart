import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tut_firebase/models/brew.dart';
import 'package:tut_firebase/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({
    this.uid,
  });

  //collection reference
  final CollectionReference brewCollections =
      Firestore.instance.collection('brews');

  // function to update user details
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollections.document(uid).setData({
      "sugars": sugars,
      "name": name,
      "strength": strength,
    });
  }

  // brew list from snapshot
  List<BrewModel> _brewsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return BrewModel(
          name: doc.data['name'] ?? '',
          sugars: doc.data['sugars'] ?? '',
          strength: doc.data['strength'] ?? 0);
    }).toList();
  }

  // user data from snapshot
  UserDataModel _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserDataModel(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  //get brew Stream
  Stream<List<BrewModel>> get brews {
    return brewCollections.snapshots().map(_brewsListFromSnapshot);
  }

  // get user document stream
  Stream<UserDataModel> get userData {
    return brewCollections.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
