import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store/common/exeptions.dart';
import 'package:nike_store/data/comment.dart';
import 'package:nike_store/data/repo/comment_repository.dart';
part 'comment_listbloc_event.dart';
part 'comment_listbloc_state.dart';

class CommentListBloc extends Bloc<CommentListblocEvent, CommentListblocState> {
  final ICommentRepository repository;
  final int productId;
  CommentListBloc({required this.repository, required this.productId})
      : super(CommentListLoading()) {
    on<CommentListblocEvent>((event, emit) async {
      if (event is CommentListStarted) {
        emit(CommentListLoading());
        try {
          final comments = await repository.getAll(productId: productId);
          emit(CommentListSuccess(comments));
        } catch (e) {
          emit(CommentListError(AppExeption()));
        }
      }
    });
  }
}
