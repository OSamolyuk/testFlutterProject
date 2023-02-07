import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';

import 'login_bloc.dart';
import 'login_screen.dart';

const _title = 'MyApp';
const _listPadding = 16.0;
const _listFontSize = 18.0;
const _wordsTaken = 1;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/l10n'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        LocalJsonLocalization.delegate
      ],
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      home:  Scaffold(
        body: _prepareLoginScreen()
      ),
    );
  }
}

Widget _prepareLoginScreen() {
  return BlocProvider(
    create: (BuildContext context) {
      return LoginBloc();
    },
    child: const LoginScreen(),
  );
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWordsList extends StatefulWidget {
  const RandomWordsList({super.key});

  @override
  State<RandomWordsList> createState() => _RandomWordsListState();
}

class _RandomWordsListState extends State<RandomWordsList> {
  @override
  Widget build(BuildContext context) {
    final suggestions = <WordPair>[];
    const biggerFont = TextStyle(fontSize: _listFontSize);
    return ListView.builder(
      padding: const EdgeInsets.all(_listPadding),
      itemBuilder:  (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(_wordsTaken));
        }
        return ListTile(
          title: Text(
            suggestions[index].asPascalCase,
            style: biggerFont,
          ),
        );
      },
    );
  }
}
