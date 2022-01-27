import 'package:card_task/bloc/task_history_bloc.dart';
import 'package:card_task/bloc/task_history_state.dart';
import 'package:card_task/repository/task_history_repository.dart';
import 'package:card_task/widgets/task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskHistoryRepository taskHistoryRepository = TaskHistoryRepository();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final TaskHistoryBloc taskHistoryBloc = BlocProvider.of<TaskHistoryBloc>(context);
    return BlocProvider(
      create: (context) =>
          TaskHistoryBloc(taskHistoryRepository: taskHistoryRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Column(
          children: [
            const TaskWidget(),
            Expanded(
              child: BlocBuilder<TaskHistoryBloc, TaskHistoryState>(
                builder: (context, state) {
                  if (state is TaskHistoryEmptyState) {
                    return const Center(
                      child: Text("Empty"),
                    );
                  }

                  if (state is TaskHistoryLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is TaskHistoryErrorState) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }

                  if (state is TaskHistoryLoadedState) {
                    return ListView.builder(
                      itemCount: state.loadedTaskHistory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardTask(
                          action: true,
                          title: state.loadedTaskHistory[index].storeName,
                          description: state.loadedTaskHistory[index].storeAddress,
                          comment:
                          "Some comment sdfmk sdjnfksdn fksjdnfjksjdfbjsdjfnsd skdfjnnskdjfjnks skdjfnnksdfn sjdfnksjdfn",
                          address: state.loadedTaskHistory[index].storeAddress,
                          image: "assets/magnum.png",
                        );
                      },
                    );

                  }

                  return const Center();

                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.location_on_sharp)),
      ),
    );
  }
}

class CardTask extends StatelessWidget {
  final bool action;
  final String title;
  final String description;
  final String comment;
  final String address;
  final String image;

  const CardTask({Key? key,
    required this.action,
    required this.title,
    required this.description,
    required this.comment,
    required this.address,
    required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    Color green = const Color(0xff4DC591);
    Color container = const Color(0xffF6F6F5);
    Color black = const Color(0xff212525);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: width * 0.8,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: action == false ? black : Colors.white),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 20,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  description,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: action == false ? black : Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: action == false
                        ? const Color(0xff88889D)
                        : Colors.white,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    address,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: action == false
                            ? const Color(0xff88889D)
                            : Colors.white),
                  ),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Icon(Icons.comment,
                      color: action == false ? Colors.grey : Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: action == false
                          ? Colors.white
                          : const Color(0xff59DFA5),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(0)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        comment,
                        style: GoogleFonts.poppins(
                            color: action == false ? Colors.grey : Colors.white,
                            fontSize: 17),
                      ),
                    ),
                    // padding: EdgeInsets.all(30),
                    width: 250,
                    // height: 510,
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: action == false ? container : green,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
