import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_exzimpil/bloc/note_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
   void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    context.read<NoteBloc>().add(const NoteNetworkEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: Text(
          "Notes"
        ),
      ),
      body: Column(
        children: [
          Text("Country:${context.select((NoteBloc bloc) => bloc.state.country)}"),
          Center(
            child: Text(
              "Temp:${context.select((NoteBloc bloc)=>bloc.state.temp)}",
              style: const TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
