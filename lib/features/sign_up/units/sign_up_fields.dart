part of '../view.dart';

class _SignUpFields extends StatelessWidget {
  const _SignUpFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.of(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          const SizedBox(height: 24),
          TextFieldInput(
            onSaved: (s) => cubit.name = s!,
            validator: Validator.name,
            hintText: 'Enter your name',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          TextFieldInput(
            onSaved: (s) => cubit.email = s!,
            validator: Validator.email,
            hintText: 'Enter your email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          TextFieldInput(
            onSaved: (s) => cubit.password = s!,
            validator: Validator.password,
            hintText: 'Enter your password',
            textInputType: TextInputType.text,
            isPass: true,
          ),
          const SizedBox(height: 24),
          TextFieldInput(
            onSaved: (s) => cubit.bio = s!,
            validator: Validator.name,
            hintText: 'Enter your paio',
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
