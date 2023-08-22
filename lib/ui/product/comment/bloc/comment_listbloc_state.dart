part of 'comment_listbloc_bloc.dart';

sealed class CommentListblocState extends Equatable {
  const CommentListblocState();

  @override
  List<Object> get props => [];
}

final class CommentListLoading extends CommentListblocState {}

class CommentListSuccess extends CommentListblocState {
  final List<CommentEntity> comments;

  const CommentListSuccess(this.comments);

  @override
  List<Object> get props => [comments];
}

class CommentListError extends CommentListblocState {
  final AppException exeption;

  const CommentListError(this.exeption);

  @override
  List<Object> get props => [exeption];
}
