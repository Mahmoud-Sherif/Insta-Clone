part of'../view.dart';
class _PostImageInSearch extends StatelessWidget {
  const _PostImageInSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedCubit = FeedCubit.of(context);

    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Image.network(
          feedCubit.post[index].postUrl,
          fit: BoxFit.cover,
        );
      },
      staggeredTileBuilder: (index) => MediaQuery.of(context).size.width > 600
          ? StaggeredTile.count(
              (index % 7 == 0) ? 1 : 1, (index % 7 == 0) ? 1 : 1)
          : StaggeredTile.count(
              (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}