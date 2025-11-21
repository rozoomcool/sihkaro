import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sihkaro/domain/constants.dart';
import 'package:sihkaro/domain/model/notebook/notebook.dart';

part 'notebook.g.dart';

@RestApi(baseUrl: '$baseUrl/api/v1/notebooks')
abstract class NotebookRestClient {
  factory NotebookRestClient(Dio dio, {String? baseUrl}) = _NotebookRestClient;

  @GET('/')
  Future<List<Notebook>> getTasks();
}