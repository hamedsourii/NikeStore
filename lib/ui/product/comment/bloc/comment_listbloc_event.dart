part of 'comment_listbloc_bloc.dart';

sealed class CommentListblocEvent extends Equatable {
  const CommentListblocEvent();

  @override
  List<Object> get props => [];
}

class CommentListStarted extends CommentListblocEvent{
  
}