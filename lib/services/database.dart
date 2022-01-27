import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  //collection referance
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strenth': strength,
    });
  }

//brew list from snapshot
List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.documents.map((doc) {
    return Brew(
        name: doc.data['name'] ?? '',
        sugars: doc.data['sugars'] ?? '0',
        strength: doc.data['strength'] ?? 100
        );
  }).toList();
}

 //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

  //user Data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid,
      snapshot.data['name'], 
      snapshot.data['sugars'], 
      snapshot.data['strength']
    );
  }

  //get user doc stream
  Stream<UserData> get userData{
    return brewCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}
