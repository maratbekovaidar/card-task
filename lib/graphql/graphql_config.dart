import 'package:card_task/repository/task_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig  {



  static Link httpLink = HttpLink(
    'https://sarqytapp.kz/graphql/',
  );

  ///if you want to pass token
  static  GraphQLClient graphInit()  {

    GraphQLClient client =
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(
        ),
      );

    return client;
  }


  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: httpLink,
    );
  }
}