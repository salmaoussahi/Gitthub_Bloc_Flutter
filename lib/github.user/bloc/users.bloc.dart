import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubbloc/github.user/bloc/user.event.dart';
import 'package:githubbloc/github.user/bloc/user.state.dart';
import 'package:githubbloc/github.user/models/users.models.dart';
import 'package:githubbloc/github.user/repository/users.repository.dart';

class UsersBloc extends Bloc<UserEvent, UsersState> {
  UserRepository userRepository = UserRepository();
  UsersBloc() : super(UsersInitialState()) {
    on((SearchUsersEvent event, emit) async {
      emit(SearchUsersLoadingState());
      try {
        ListUsers listUsers = await userRepository.searchUsers(
            event.keyword, event.page, event.pageSize);
        int totalPages = listUsers.totalCount ~/ event.pageSize;
        emit(SearchUsersSuccessState(
            listUsers: listUsers,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentKeyword: event.keyword));
      } catch (e) {
        emit(SearchUsersErrorState(errorMessage: e.toString()));
      }
    });

    on((NextPageEvent event, emit) async {
      emit(SearchUsersLoadingState());
      try {
        ListUsers listUsers = await userRepository.searchUsers(
            event.keyword, event.page, event.pageSize);
        int totalPages = listUsers.totalCount ~/ event.pageSize;
        emit(SearchUsersSuccessState(
            listUsers: listUsers,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentKeyword: event.keyword));
       
      } catch (e) {
        emit(SearchUsersErrorState(errorMessage: e.toString()));
      }
    });
  }
}
