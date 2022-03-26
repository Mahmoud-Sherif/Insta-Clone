import 'package:chat_app/const/colors.dart';
import 'package:chat_app/features/search/cubit/search_cubit.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'units/search_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
          appBar: _SearchAppBar(),
          body: Builder(builder: (context) {
            final cubit = SearchCubit.of(context);
            return BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                return state is SearchUserDataLoading
                    ? const LoadingIndicator()
                    : ListView.builder(
                        itemCount: cubit.searchedUser.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            // onTap: () => Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => ProfileScreen(
                            //       uid: (snapshot.data! as dynamic).docs[index]['uid'],
                            //     ),
                            //   ),
                            // ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  cubit.searchedUser[index].imageUrl,
                                ),
                                radius: 16,
                              ),
                              title: Text(
                                cubit.searchedUser[index].username,
                              ),
                            ),
                          );
                        },
                      );
              },
            );
          })
          // : StaggeredGridView.countBuilder(
          //     crossAxisCount: 3,
          //     itemCount: (snapshot.data! as dynamic).docs.length,
          //     itemBuilder: (context, index) => Image.network(
          //       (snapshot.data! as dynamic).docs[index]['postUrl'],
          //       fit: BoxFit.cover,
          //     ),
          //     staggeredTileBuilder: (index) =>
          //         MediaQuery.of(context).size.width > webScreenSize
          //             ? StaggeredTile.count(
          //                 (index % 7 == 0) ? 1 : 1, (index % 7 == 0) ? 1 : 1)
          //             : StaggeredTile.count(
          //                 (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
          //     mainAxisSpacing: 8.0,
          //     crossAxisSpacing: 8.0,
          //   ),
          ),
    );
  }
}
