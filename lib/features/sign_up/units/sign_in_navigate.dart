part of '../view.dart';

class _SignInNavigate extends StatelessWidget {
  const _SignInNavigate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: const Text(
            'have an account?',
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        GestureDetector(
          onTap: () => MagicRouter.navigateAndPopAll(const SignInView()),
          child: Container(
            child: const Text(
              ' LogIn.',
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
