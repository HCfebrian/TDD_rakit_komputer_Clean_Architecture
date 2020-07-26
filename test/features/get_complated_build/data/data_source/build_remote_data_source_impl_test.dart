import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/auth/exception.dart';
import 'package:rakit_komputer/features/get_build_list/data/data_source/build_remote_data_source_impl.dart';
import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';

class MockFirestore extends Mock implements Firestore {}

class MockCollectionRef extends Mock implements CollectionReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {
  @override
  String get documentID => "PC_Dewa_123";

  @override
  Map<String, dynamic> get data => {
        "title": "PC DEWA",
        "overall_price": "20000000",
        "picURL": "facebook.com"
      };
}

class MockQuerySnapshot extends Mock implements QuerySnapshot {
  static MockDocumentSnapshot dock = MockDocumentSnapshot();
  final List<DocumentSnapshot> documentList = [dock, dock, dock];

  @override
  List<DocumentSnapshot> get documents => documentList;
}

class MockDocumentRef extends Mock implements DocumentReference {
  @override
  // TODO: implement documentID
  String get documentID => "1234";
}

class MockQuerySnap extends Mock implements QuerySnapshot {
  @override
  static MockDocumentSnapshot dock = MockDocumentSnapshot();
  final List<DocumentSnapshot> documentList = [dock, dock, dock];

  List<DocumentSnapshot> get documents => documentList;
}

void main() {
  final instance = MockFirestoreInstance();
  BuildRemoteDataSourceImpl buildRemoteDataSourceImpl;

  final mapBuild = {
    "buildId": "PCDEWA1234",
    "data": {
      "title": "PC DEWA",
      "overallPrice": "20000000",
      "picURL": "facebook.com",
    }
  };
  ///////////////////////////////////////

  MockFirestore mockFirestore;
  MockCollectionRef mockCollectionRef;
  MockDocumentSnapshot mockDocumentSnapshot;
  MockDocumentRef mockdocumentRef;
  MockQuerySnap mockQuerySnap;

  setUp(() {
    mockFirestore = MockFirestore();
    mockCollectionRef = MockCollectionRef();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockdocumentRef = MockDocumentRef();
    mockQuerySnap = MockQuerySnap();

    //////////
    buildRemoteDataSourceImpl =
        BuildRemoteDataSourceImpl(firetoreInstance: mockFirestore);
  });

  group("datasource", () {
    test(
      "should return List Build Guide if succeed",
      () async {
        //arrange
        when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
        when(mockCollectionRef.getDocuments())
            .thenAnswer((realInvocation) async => mockQuerySnap);
        //act
        final result =
            await buildRemoteDataSourceImpl.getRecommendedBuildList();
        //assert
        expect(result, isA<List<BuildModel>>());
        expect(result.isNotEmpty, true);
      },
    );

    test(
      //todo: change some exception with better error handling.
      "should throw [some exception] when get data is failed",
      () async {
        //arrange
        when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
        when(mockCollectionRef.getDocuments()).thenThrow(SomeException());
        //act
        final call = buildRemoteDataSourceImpl.getRecommendedBuildList;
        //assert
        expect(() => call(), throwsA(TypeMatcher<UndefinedException>()));
      },
    );
  });
}
