part of '../view.dart';

AppBar _appBar() {
  return AppBar(
    backgroundColor: mobileBackgroundColor,
    centerTitle: false,
    title: SvgPicture.asset(
      'assets/images/logo_instagram.svg',
      color: primaryColor,
      height: 32,
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.messenger_outline,
          color: primaryColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}
