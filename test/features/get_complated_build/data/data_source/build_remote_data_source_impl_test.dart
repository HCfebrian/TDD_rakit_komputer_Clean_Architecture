import 'package:cloud_firestore/cloud_firestore.dart';
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

class MockDocumentRef extends Mock implements DocumentReference{}

class MockQuerySnapshot extends Mock implements QuerySnapshot {
  static MockDocumentSnapshot dock = MockDocumentSnapshot();
  final List<DocumentSnapshot> documentList = [dock, dock, dock];

  @override
  List<DocumentSnapshot> get documents => documentList;
}


class MockQuerySnap extends Mock implements QuerySnapshot {
  static MockDocumentSnapshot dock = MockDocumentSnapshot();
  final List<DocumentSnapshot> documentList = [dock, dock, dock];
  @override
  List<DocumentSnapshot> get documents => documentList;
}

void main() {
  BuildRemoteDataSourceImpl buildRemoteDataSourceImpl;


  ///////////////////////////////////////
  MockDocumentRef mockDocumentRef;
  MockFirestore mockFirestore;
  MockCollectionRef mockCollectionRef;
  MockQuerySnap mockQuerySnap;
  MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockDocumentRef = MockDocumentRef();
    mockFirestore = MockFirestore();
    mockCollectionRef = MockCollectionRef();
    mockQuerySnap = MockQuerySnap();
    mockDocumentSnapshot =MockDocumentSnapshot();


    buildRemoteDataSourceImpl =
        BuildRemoteDataSourceImpl(firetoreInstance: mockFirestore);
  });

  group("data recommended build", () {
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

  group("data Completed build", () {
    test(
      "should return List completed Build Guide if succeed",
          () async {
        //arrange
        when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
        when(mockCollectionRef.getDocuments())
            .thenAnswer((realInvocation) async => mockQuerySnap);
        //act
        final result =
        await buildRemoteDataSourceImpl.getCompletedBuildList();
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
        final call = buildRemoteDataSourceImpl.getCompletedBuildList;
        //assert
        expect(() => call(), throwsA(TypeMatcher<UndefinedException>()));
      },
    );

    test(
        "should should get Featured Build when data called",
        () async {
          //arrange
          when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
          when(mockCollectionRef.document(any)).thenReturn(mockDocumentRef);
          when(mockDocumentRef.get()).thenAnswer((realInvocation) async => mockDocumentSnapshot);
          when(mockCollectionRef.getDocuments()).thenAnswer((realInvocation) async => mockQuerySnap);
          //act
          final result = await buildRemoteDataSourceImpl.getFeaturedBuild();
          //assert
          expect(result, isA<BuildModel>());
        },
      );
  });

  test(
      "should",
      () async {
        //arrange

        //act

        //assert
      },
    );


}
