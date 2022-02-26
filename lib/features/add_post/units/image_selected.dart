part of '../view.dart';

class _ImageSelected extends StatelessWidget {
  const _ImageSelected({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AddPostCubit.of(context);
    // final mainCubit = MainCubit.of(context);

    return SizedBox(
      height: 45.0,
      width: 45.0,
      child: AspectRatio(
        aspectRatio: 487 / 451,
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return state is AddpostImageFinshed
                ? Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                      image: MemoryImage(cubit.file!),
                    )),
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
