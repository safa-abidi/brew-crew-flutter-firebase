import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';

class DatabaseService{

  //collection referance
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
}