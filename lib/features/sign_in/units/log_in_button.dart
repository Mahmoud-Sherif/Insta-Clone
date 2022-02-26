part of '../view.dart';

class _LogInButton extends StatelessWidget {
  const _LogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SigninCubit.of(context);
    return Column(
      children: [
        InkWell(
          child: Container(
            child: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                return state is! SigninLoading
                    ? const Text(
                        'Log in',
                      )
                    : const CircularProgressIndicator(
                        color: primaryColor,
                      );
              },
            ),
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              color: blueColor,
            ),
          ),
          onTap: cubit.signIn,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
