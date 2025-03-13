import 'package:fitness/features/user/data/repository/delete_account_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountRepoImpl repoImpl;
  DeleteAccountBloc({required this.repoImpl}) : super(DeleteAccountInitial()) {
    on<DeleteAccountEvent>((event, emit) async{
      emit(DeleteAccountLoading());
      try{
        await repoImpl.deleteAccount();
        emit(DeleteAccountSuccess());
      }catch(e){
        emit(DeleteAccountError(errorText: e.toString()));
      }
    });
  }
}
