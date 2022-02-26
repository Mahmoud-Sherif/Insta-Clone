part of '../view.dart';

class _InstaLogo extends StatelessWidget {
  const _InstaLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logo_instagram.svg',
          color: primaryColor,
          height: 64,
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
