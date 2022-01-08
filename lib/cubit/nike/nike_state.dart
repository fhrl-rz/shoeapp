part of 'nike_cubit.dart';

@immutable
abstract class NikeState {}

class NikeInitial extends NikeState {}

class NikeLoading extends NikeState {}

class NikeSuccess extends NikeState {
  final ResGetNike? resGetNike;
  NikeSuccess(this.resGetNike);
}

class NikeError extends NikeState {
  final String? message;
  NikeError(this.message);
}
