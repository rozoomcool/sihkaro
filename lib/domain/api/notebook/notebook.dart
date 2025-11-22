import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sihkaro/domain/api/dto/notebook/notebook.dart';
import 'package:sihkaro/domain/constants.dart';
import 'package:sihkaro/domain/model/notebook/notebook.dart';

part 'notebook.g.dart';

@RestApi(baseUrl: '$baseUrl/api/v1/notebooks')
abstract class NotebookRestClient {
  factory NotebookRestClient(Dio dio, {String? baseUrl}) = _NotebookRestClient;

  @GET('/user')
  Future<List<Notebook>> getUserNotebooks();

  @POST("/")
  Future<Notebook> addNotebook(@Body() NotebookCreate data);
}