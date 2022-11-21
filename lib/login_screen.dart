import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc.dart';

const _boxHeight = 16.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return _buildParentWidget(context, state);
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Just a snackbar'),
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
          const SizedBox(
            height: _boxHeight,
          ),
          TextButton(
            onPressed: () {
              context.read<LoginBloc>().add(LoginButtonTappedEvent());
            },
            child: const Text("Tap me"),
          ),
          const SizedBox(
            height: _boxHeight,
          ),
          TextButton(
              onPressed: () {
                context
                    .read<LoginBloc>()
                    .add(ShowSnackBarButtonTappedEvent());
              },
              child: const Text("Show Snackbar"))
        ],
      ),
    );
  }

  Widget _buildTextWidget(LoginState state) {
    debugPrint(state.toString());
    if (state is UpdateTextState) {
      return Text(state.text);
    }
    else {
      return const Text("This will change on button tap");
    }
  }
}