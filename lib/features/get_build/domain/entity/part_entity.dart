import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BuildPartEntity extends Equatable {
  final String buildId, name, partType, rating, avgPrice, picURL, partId;

  BuildPartEntity(
      {@required this.buildId,
      @required this.partId,
      @required this.name,
      @required this.partType,
      @required this.rating,
      @required this.avgPrice,
      @required this.picURL});

  @override
  List<Object> get props => [buildId,name, partType, rating, avgPrice, picURL, partId];
}
