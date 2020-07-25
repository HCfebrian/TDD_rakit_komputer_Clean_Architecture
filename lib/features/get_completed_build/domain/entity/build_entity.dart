import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BuildEntity extends Equatable {
  final String buildId, title, overallPrice, picURL;

  BuildEntity({
    @required this.buildId,
    @required this.title,
    @required this.overallPrice,
    @required this.picURL,
  });

  @override
  List<Object> get props => [buildId, title, overallPrice, picURL];

}
