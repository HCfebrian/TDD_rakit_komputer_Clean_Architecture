part of 'part_detail_bloc.dart';

abstract class PartDetailEvent extends Equatable {
  const PartDetailEvent();
}

class GetPartEvent extends PartDetailEvent{
  final partID, partType;

  GetPartEvent({@required this.partID, @required this.partType});

  @override
  List<Object> get props => [partID, partType];
}
