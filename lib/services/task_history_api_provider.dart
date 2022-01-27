import 'dart:convert';
import 'dart:developer';
import 'package:card_task/graphql/graphql_config.dart';
import 'package:card_task/models/task_history_model.dart';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';

class TaskHistoryProvider {
  Future<List<TaskHistoryModel>> getTaskHistory() async {
    print("Aidar GraphQL geting start");

    /// GraphQl initialize
    // await initHiveForFlutter();

    /// Link GraphQL
    final Link _link = HttpLink('https://sarqytapp.kz/graphql/');

    /// Query to get tasks
    String taskQuery = '''
           query getTask {
              magnums {
                id,
                name,
                adress,
                number 
              }
            }
    ''';

    print("Aidar query");


    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    print("Aidar initialize graph config");

    GraphQLClient _client = GraphQLClient(link: _link, cache: GraphQLCache());
    print("Aidar initialize graph client");


    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(taskQuery),
      ),
    );
    // print(result);

    // final List<dynamic> taskHistoryJson = (json.decode(result.data!['magnums']));
    final List<dynamic> taskHistoryJson = result.data!['magnums'];
    final List<dynamic> json1 = result.data!['magnums'];
    print(json1);

    List<TaskHistoryModel> taskHistoryModels = json1.map((json) => TaskHistoryModel.fromJson(json)).toList();

    return taskHistoryModels;
    // return taskHistoryJson.map((json) => TaskHistoryModel.fromJson(json)).toList();
  }




// if(result.hasException){
//   print(result.exception?.graphqlErrors[0]?.message);
// }else if(result.data != null){
//   return taskHistoryJson.map((json) => TaskHistoryModel.fromJson(json)).toList();
// }

// try {
//   /// Initializing GraphQLConfig
//   GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
//   GraphQLClient _client = graphQLConfiguration.clientToQuery();
//
//   QueryResult result = await _client.query(
//     QueryOptions(
//         document: gql(taskQuery),
//     ),
//   );
//
//   taskHistoryJson.add(json.decode(result.data!['magnums']));
//   print(json.decode(result.data!['magnums']));
//   if(result.hasException){
//     print(result.exception?.graphqlErrors[0]?.message);
//   }else if(result.data != null){
//     return taskHistoryJson.map((json) => TaskHistoryModel.fromJson(json)).toList();
//   }
// }catch(e){
//   return taskHistoryJson.map((json) => TaskHistoryModel.fromJson(json)).toList();
// }
//
// return taskHistoryJson.map((json) => TaskHistoryModel.fromJson(json)).toList();
}

// final response = await http.get(Uri.parse('https://10.0.2.2:8080/api/post/all'));
//
//
//
// if (response.statusCode == 200) {
// final List<dynamic> taskHistoryJson = json.decode(response.body);
// print(response.body);
// print(json.decode(response.body));
// return taskHistoryJson.map((json) => TaskHistoryModel.fromJson(json)).toList();
// } else {
// throw Exception('Error fetching user!');
// }
