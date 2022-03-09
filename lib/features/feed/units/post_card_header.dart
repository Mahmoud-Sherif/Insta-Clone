part of '../view.dart';

class _PostCardHeader extends StatelessWidget {
  const _PostCardHeader({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Post data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 20,
      ).copyWith(right: 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(data.profilePic),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.username.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // widget.snap['uid'].toString() == user.uid
          //     ?
          IconButton(
            onPressed: () {
              showDialog(
                useRootNavigator: false,
                context: context,
                builder: (context) {
                  return Dialog(
                    child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shrinkWrap: true,
                        children: [
                          'Delete',
                        ]
                            .map(
                              (e) => InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(e),
                                  ),
                                  onTap: () {
                                    // deletePost(
                                    //   widget.snap['postId']
                                    //       .toString(),
                                    // );
                                    // remove the dialog box
                                    Navigator.of(context).pop();
                                  }),
                            )
                            .toList()),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          )
          // :
          // Container(),
        ],
      ),
    );
  }
}
