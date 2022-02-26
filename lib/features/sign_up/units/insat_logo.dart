part of '../view.dart';

class _InstaLogo extends StatelessWidget {
  const _InstaLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: SvgPicture.asset(
        'assets/images/logo_instagram.svg',
        color: primaryColor,
        height: 64,
      ),
    );
  }
}
