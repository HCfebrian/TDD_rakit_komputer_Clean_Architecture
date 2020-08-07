import 'package:meta/meta.dart';

class ComputerPartEntity {
  final String name, partType, rating, avgPrice, photoUrl, partId;

  ComputerPartEntity(
      {
      @required this.partId,
      @required this.name,
      @required this.partType,
      @required this.rating,
      @required this.avgPrice,
      @required this.photoUrl});
}
