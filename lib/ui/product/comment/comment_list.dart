import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store/data/repo/comment_repository.dart';
import 'package:nike_store/ui/product/comment/bloc/comment_listbloc_bloc.dart';
import 'package:nike_store/ui/product/comment/comment.dart';
import 'package:nike_store/ui/widgets/error.dart';

class CommentList extends StatelessWidget {
  final int productId;
  const CommentList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final CommentListBloc bloc = CommentListBloc(
            repository: commentRepository, productId: productId);
        bloc.add(CommentListStarted());
        return bloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListblocState>(
        builder: (context, state) {
          if (state is CommentListSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return CommentItem(
                  data: state.comments[index],
                );
              }, childCount: state.comments.length),
            );
          } else if (state is CommentListLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CommentListError) {
            return SliverToBoxAdapter(
              child: AppErrorWidget(
                  exeption: state.exeption,
                  onPressed: () {
                    BlocProvider.of<CommentListBloc>(context)
                        .add(CommentListStarted());
                  }),
            );
          } else {
            throw Exception('state is not supported');
          }
        },
      ),
    );
  }
}

