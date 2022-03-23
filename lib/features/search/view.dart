import 'package:chat_app/const/colors.dart';
import 'package:chat_app/features/search/cubit/search_cubit.dart';
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
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              final cubit = SearchCubit.of(context);
              return Container(
                child: TextButton(onPressed: () {}, child: Text('fsdgdfg')),
              )
                  //  InkWell(
                  //   onTap: () => Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => ProfileScreen(
                  //         uid: (snapshot.data! as dynamic).docs[index]['uid'],
                  //       ),
                  //     ),
                  //   ),
                  //   child: ListTile(
                  //     leading: CircleAvatar(
                  //       backgroundImage: NetworkImage(
                  //         (snapshot.data! as dynamic).docs[index]['photoUrl'],
                  //       ),
                  //       radius: 16,
                  //     ),
                  //     title: Text(
                  //       (snapshot.data! as dynamic).docs[index]['username'],
                  //     ),
                  //   ),
                  // )
                  ;
            },
          )
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
