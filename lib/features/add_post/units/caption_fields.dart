part of '../view.dart';

class _CaptionField extends StatelessWidget {
  const _CaptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AddPostCubit.of(context);
    return SizedBox(
      width: sizeFromWidth(context, 4),
      child: TextField(
        controller: cubit.captionController,
        decoration: const InputDecoration(
            hintText: "Write a caption...", border: InputBorder.none),
        maxLines: 8,
      ),
    );
  }
}
