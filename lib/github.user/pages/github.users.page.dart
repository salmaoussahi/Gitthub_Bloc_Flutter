import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubbloc/github.user/bloc/user.event.dart';
import 'package:githubbloc/github.user/bloc/user.state.dart';
import 'package:githubbloc/github.user/bloc/users.bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query = '';
  TextEditingController queryText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextFormField(
          onChanged: (value) {
            setState(() {
              this.query = value;
            });
          },
          controller: queryText,
          decoration: InputDecoration(
              icon: Icon(Icons.person_search),
              hintText: 'Find a user',
              labelText: 'User Github',
              suffixIcon: IconButton(
                  onPressed: () {
                    String k = queryText.text;

                    context.read<UsersBloc>().add(
                        SearchUsersEvent(keyword: k, page: 0, pageSize: 20));
                  },
                  icon: Icon(Icons.search_outlined))),
        ),

        //blocbuilder fait un subscribe vers le bloc
        //si le bloc emet un state il le reçoit et regénere les éléments au sein de lui
        BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
          if (state is SearchUsersLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchUsersErrorState) {
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ERROR : " + state.errorMessage,
                      style: TextStyle(color: Colors.red)),
                  IconButton(onPressed: null, icon: Icon(Icons.repeat_rounded))
                ],
              ),
            );
          } else if (state is SearchUsersSuccessState) {
            // print(state.listUsers.toJson());
            return Expanded(
              child: Column(
                children: [
                  Text(
                    "Page ${state.currentPage}/${state.totalPages}",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Expanded(
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        context.read<UsersBloc>().add(NextPageEvent(
                          keyword: state.currentKeyword,
                          page:state.currentPage+1,
                          pageSize: state.pageSize
                        ));
                      },
                      child: ListView.builder(
                          itemCount: state.listUsers.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      state.listUsers.items[index].avatarUrl),
                                ),
                                trailing: Text(
                                  state.listUsers.items[index].score.toString(),
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15),
                                ),
                                title: Text(state.listUsers.items[index].login),
                                subtitle:
                                    Text(state.listUsers.items[index].nodeId));
                          }),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}
