import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:test_flutter/app_theme.dart';

import 'login_bloc.dart';

const _boxHeight = 16.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(title: Text('login'.i18n())),
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return _buildParentWidget(context, state);
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('snackbarText'.i18n()),
        ));
      },
      buildWhen: (previous, current) => _shouldBuildFor(current),
      listenWhen: (previous, current) => _shouldListenFor(current),
    );
  }

  bool _shouldListenFor(LoginState currentState) {
    return currentState is ShowSnackbarState;
  }

  bool _shouldBuildFor(LoginState currentState) {
    return currentState is LoginInitial || currentState is UpdateTextState;
  }

  Widget _buildParentWidget(BuildContext context, LoginState state) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextWidget(state),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('leftText'.i18n(), style: appTheme.textStyles.defaultTextStyle()),
              const SizedBox(
                width: _boxHeight,
              ),
              Text('rightText'.i18n(), style: appTheme.textStyles.defaultTextStyle())
            ],
          ),
          const SizedBox(
            height: _boxHeight,
          ),
          TextButton(
            onPressed: () {
              context.read<LoginBloc>().add(LoginButtonTappedEvent());
            },
            child: Text('tapMe'.i18n()),
          ),
          const SizedBox(
            height: _boxHeight,
          ),
          TextButton(
              onPressed: () {
                context.read<LoginBloc>().add(ShowSnackBarButtonTappedEvent());
              },
              child: Text('snackbarButtonText'.i18n()))
        ],
      ),
    );
  }

  Widget _buildTextWidget(LoginState state) {
    debugPrint(state.toString());
    if (state is UpdateTextState) {
      return Text(state.text);
    } else {
      return Text('changeButtonText'.i18n());
    }
  }
}
