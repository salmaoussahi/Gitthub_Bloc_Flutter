import 'package:bloc/bloc.dart';

abstract class UserEvent {}

class SearchUsersEvent extends UserEvent {
  //la valeur de ce qu'on va saisir
  final String keyword;
  int page;
  int pageSize;
  SearchUsersEvent({this.keyword, this.page, this.pageSize});
}

class NextPageEvent extends SearchUsersEvent {
  NextPageEvent({String keyword, int page, int pageSize})
      : super(keyword: keyword, page: page, pageSize: pageSize);
}
