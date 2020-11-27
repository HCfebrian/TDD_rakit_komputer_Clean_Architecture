import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BuildEntity extends Equatable {
  final String buildId, title, overallPrice, picURL, owner, gpu, cpu;

  BuildEntity({
    @required this.owner,
    @required this.buildId,
    @required this.title,
    @required this.overallPrice,
    @required this.picURL,
    @required this.gpu,
    @required this.cpu,
  });

  @override
  List<Object> get props =>
      [buildId, title, overallPrice, picURL, owner, gpu, cpu];
}
