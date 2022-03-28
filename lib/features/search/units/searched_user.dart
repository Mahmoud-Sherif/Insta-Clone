part of '../view.dart';

class _SearchedUsers extends StatelessWidget {
  const _SearchedUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
                      onTap: () {
                        MagicRouter.navigateTo(
                            ProfileView(uid: cubit.searchedUser[index].uid));
                      },
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
    });
  }
}
