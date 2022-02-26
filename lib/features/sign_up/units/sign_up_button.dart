part of '../view.dart';

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.of(context);
    return Column(
      children: [
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return InkWell(
              child: Container(
                child: state is! SignupLoading
                    ? const Text(
                        'Sign Up',
                      )
                    : const CircularProgressIndicator(
                        color: primaryColor,
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
              onTap: cubit.signUP,
            );
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
