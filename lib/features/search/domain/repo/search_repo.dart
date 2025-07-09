import 'package:library_app/core/utils/networking/api_result.dart';

import '../../../home/domain/entity/book_entity.dart';

abstract class SearchRepo {
  Future<Result<List<BookEntity>>> searchBook(String query);
}
