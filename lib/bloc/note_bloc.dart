import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_exzimpil/network/api_client.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState>{
  NoteBloc():super( NoteState(temp: 0, country: "")){
    on<NoteNetworkEvent>(onAdd);
  }
  Future<void>onAdd(NoteNetworkEvent event,Emitter<NoteState>emit)async
  {
    final response=await ApiClient.instance.getWeather();
    emit(state.copyWith(temp:response.main?.temp??0, country: response.sys?.country??""));
  }
}