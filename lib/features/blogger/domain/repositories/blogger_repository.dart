import '../../data/models/blogger_model.dart';

abstract class BloggerRepository {
  Future<List<BloggerModel>> getAllBloggers();
  Future<ExerciseGroupCard> getExerciseCard(String id);
}
