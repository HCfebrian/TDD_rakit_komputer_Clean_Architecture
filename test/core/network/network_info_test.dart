import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/network/netword_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker{}

void main(){
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfo;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  test(
      "should forward the call to dataConnectionChecker.hasConnection",
      () async {
        //arrange
        when(mockDataConnectionChecker.hasConnection).thenAnswer((realInvocation) async => true);
        //act
        final result = await networkInfo.isConnected;
        //assert
        expect(result, true);
      },
    );

} 