import 'package:equatable/equatable.dart';
import 'package:lets_chat/features/status/domain/entities/status_entity.dart';



abstract class StatusState extends Equatable {
  const StatusState();
}

class StatusInitial extends StatusState {
  @override
  List<Object> get props => [];
}

class StatusLoading extends StatusState {
  @override
  List<Object> get props => [];
}

class StatusLoaded extends StatusState {
  final List<StatusEntity> statuses;

  StatusLoaded({required this.statuses});
  @override
  List<Object> get props => [statuses];
}

class StatusFailure extends StatusState {
  @override
  List<Object> get props => [];
}
