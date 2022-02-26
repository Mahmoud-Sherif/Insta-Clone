part of '../view.dart';

class _ProfilePic extends StatelessWidget {
  const _ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.of(context);
    return Stack(
      children: [
        
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return state is SignupImageLoaded
                ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(cubit.file!),
                    backgroundColor: Colors.red,
                  )
                : const CircleAvatar(
                    radius: 64,
                    backgroundImage:
                        NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                    backgroundColor: Colors.red,
                  );
          },
        ),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: cubit.selectImage,
            icon: const Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }
}
