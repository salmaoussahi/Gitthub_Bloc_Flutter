import 'package:bloc/bloc.dart';
import 'package:githubbloc/github.user/bloc/user.event.dart';
import 'package:githubbloc/github.user/models/users.models.dart';

abstract class UsersState {}

//state qui contient les données quand la recherche connait un success
class SearchUsersSuccessState extends UsersState {
  ListUsers listUsers;
  int currentPage;
  int totalPages;
  int pageSize;
  String currentKeyword;
  SearchUsersSuccessState(
      {this.listUsers, this.currentPage, this.totalPages, this.pageSize,this.currentKeyword});
}

//chargement des données
class SearchUsersLoadingState extends UsersState {}

//cas d'echec de telechargement de données
class SearchUsersErrorState extends UsersState {
  String errorMessage;
  SearchUsersErrorState({this.errorMessage});
}

//state initial
class UsersInitialState extends UsersState {}
