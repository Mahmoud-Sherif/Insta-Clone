part of '../view.dart';

class _UploadIcons extends StatelessWidget {
  const _UploadIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.upload),
        onPressed: () {
          _showImageSelectSource(context);
        },
      ),
    );
  }
}
