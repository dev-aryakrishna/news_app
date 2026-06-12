import '../entities/news_entity.dart';


abstract class NewsRepository {


  Future<List<NewsEntity>>getTopHeadliness({
    required int page,
  });


  Future<List<NewsEntity>>searchNews({
     required String query,
     required int page,
  });


}