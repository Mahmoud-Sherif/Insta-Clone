part of '../view.dart';

class _SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  const _SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      title: Form(
        key: cubit.formKey,
        child: TextFormField(
          controller: cubit.searchController,
          decoration: const InputDecoration(labelText: 'Search for a user...'),
          onSaved: (s) async {
            await cubit.getAllUser(s!);
          },
          // onFieldSubmitted: (String _) {
          //   setState(() {
          //     isShowUsers = true;
          //   });
          //   print(_);
          // },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
