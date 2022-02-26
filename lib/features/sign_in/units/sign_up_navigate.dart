part of '../view.dart';

class _SignUpNavigate extends StatelessWidget {
  const _SignUpNavigate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: const Text(
            'Dont have an account?',
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        GestureDetector(
          onTap: () => MagicRouter.navigateAndPopAll(const SignUpView()),
          child: Container(
            child: const Text(
              ' Signup.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ],
    );
  }
}
