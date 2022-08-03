import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubbloc/github.user/bloc/user.event.dart';
import 'package:githubbloc/github.user/bloc/user.state.dart';
import 'package:githubbloc/github.user/bloc/users.bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({Key key}) : super(key: key);

  @override
  State<RepoPage> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<UsersBloc>().add(MostRatedRepoEvent());
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [
    //     Container(
    //       child: Center(
    //         child: Text("Trending Repos",
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
    //       ),
    //       height: 70,
    //       color: Colors.grey[200],
    //     ),
    //     ListTile(
    //       title: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "tenserflow",
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //           ),
    //           Text(
    //               "Computation using data flow graphs for scalable machine learning",
    //               style: TextStyle(color: Colors.grey)),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 children: [
    //                   Icon(Icons.image),
    //                   Text(
    //                     "tenserflow",
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   Icon(Icons.star),
    //                   Text(
    //                     "5.1k",
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    // return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
    //   if (state is RepoSuccessState) {
    //     return Text("success");
    //   }
    // });
    return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
      if (state is RepoSuccessState) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: state.listrepo.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.grey[100],
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  state.listrepo.items[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),

                                const SizedBox(
                                  height: 3,
                                ), //SizedBox
                                Text(state.listrepo.items[index].fullName,
                                    style: TextStyle(color: Colors.grey)),
                                const SizedBox(
                                  height: 3,
                                ), //SizedBox
                                SizedBox(
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () {
                                     String url = state.listrepo.items[index].htmlUrl.toString();
                                      // ignore: deprecated_member_use
                                      launch(url);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green)),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.touch_app),
                                        Text('Visit Repo')
                                      ],
                                    ),
                                  ),
                                ) //SizedBox
                              ],
                            ), //Column
                          ), //Padding
                        ), //SizedBox
                      );
                    }),
              ),
            ],
          ),
        );
      } else {
        return CircularProgressIndicator();
      }
    });
    // child:
  }
}
