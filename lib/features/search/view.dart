import 'package:chat_app/const/colors.dart';
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/features/feed/cubit/feed_cubit.dart';
import 'package:chat_app/features/profile/view.dart';
import 'package:chat_app/features/search/cubit/search_cubit.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
part 'units/search_app_bar.dart';
part 'units/post_image_search.dart';
part 'units/searched_user.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: const _SearchAppBar(),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state is SearchInitial
                ? const _PostImageInSearch()
                : const _SearchedUsers();
          },
        ),
      ),
    );
  }
}
