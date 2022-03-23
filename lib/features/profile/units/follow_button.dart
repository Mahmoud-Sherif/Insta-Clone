part of '../view.dart';

class _FollowButton extends StatelessWidget {
  const _FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FollowButtonWid(
          text: 'Sign Out',
          backgroundColor: mobileBackgroundColor,
          textColor: primaryColor,
          borderColor: Colors.grey,
          function: () async {},
        )
        // :
        // : isFollowing
        //     ? FollowButton(
        //         text: 'Unfollow',
        //         backgroundColor: Colors.white,
        //         textColor: Colors.black,
        //         borderColor: Colors.grey,
        //         function: () async {
        //           // await FireStoreMethods().followUser(
        //           //   FirebaseAuth
        //           //       .instance.currentUser!.uid,
        //           //   userData['uid'],
        //           // );

        //           // setState(() {
        //           //   isFollowing = false;
        //           //   followers--;
        //           // });
        //         },
        //       )
        //     :
        // FollowButton(
        //     text: 'Follow',
        //     backgroundColor: Colors.blue,
        //     textColor: Colors.white,
        //     borderColor: Colors.blue,
        //     function: () async {
        //       // await FireStoreMethods().followUser(
        //       //   FirebaseAuth
        //       //       .instance.currentUser!.uid,
        //       //   userData['uid'],
        //       // );

        //       // setState(() {
        //       //   isFollowing = true;
        //       //   followers++;
        //       // });
        //     },
        //   )
      ],
    );
  }
}