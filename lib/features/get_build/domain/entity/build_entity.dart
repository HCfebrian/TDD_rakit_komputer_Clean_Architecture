import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'computer_part_entity.dart';

class BuildEntity extends Equatable {
  final String buildId, title, overallPrice, picURL, owner;

    List<ComputerPartEntity> partList;

  BuildEntity({
    @required this.owner,
    @required this.buildId,
    @required this.title,
    @required this.overallPrice,
    @required this.picURL,
      @required this.partList
  });

  @override
  List<Object> get props => [
        buildId,
        title,
        overallPrice,
        picURL,
        owner,
        partList,
      ];
}
