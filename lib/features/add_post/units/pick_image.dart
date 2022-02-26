part of '../view.dart';

_showImageSelectSource(BuildContext context) {
  final cubit = AddPostCubit.of(context);

  showDialog(
    context: context,
    builder: (context) => _Dialog(
      cubit: cubit,
    ),
  );
}

class _Dialog extends StatelessWidget {
  const _Dialog({Key? key, required this.cubit}) : super(key: key);
  final AddPostCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Create a Post'),
      children: [
        SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a photo'),
            onPressed: () async {
              Navigator.of(context).pop();

              await cubit.pickImage(ImageSource.camera);
            }),
        SimpleDialogOption(
          padding: const EdgeInsets.all(20),
          child: const Text('Choose from Gallery'),
          onPressed: () async {
            Navigator.of(context).pop();

            await cubit.pickImage(ImageSource.gallery);
          },
        ),
        SimpleDialogOption(
          padding: const EdgeInsets.all(20),
          child: const Text("Cancel"),
          onPressed: () {
            MagicRouter.pop();
          },
        )
      ],
    );
  }
}

