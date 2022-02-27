import 'package:chat_app/const/colors.dart';
import 'package:chat_app/core/responsive/screan_size.dart';
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/features/add_post/cubit/addpost_cubit.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/features/home/view.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'units/pick_image.dart';
part 'units/acount_avatar.dart';
part 'units/caption_fields.dart';
part 'units/image_selected.dart';
part 'units/uplaod_icon.dart';
part 'units/app_par.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCubit = MainCubit.of(context);
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocBuilder<AddPostCubit, AddpostState>(
        builder: (context, state) {
          final cubit = AddPostCubit.of(context);
          return state is AddpostInitial
              ? const _UploadIcons()
              : Scaffold(
                  appBar: _appBar(cubit, mainCubit),
                  // POST FORM
                  body: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      return state is AddpostLoading
                          ? const LoadingIndicator()
                          : Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    _AccountAvatar(),
                                    _CaptionField(),
                                    _ImageSelected(),
                                  ],
                                ),
                                const Divider(),
                              ],
                            );
                    },
                  ),
                );
        },
      ),
    );
  }
}
