import 'package:moliere_app/Domain/Repositories_abstractions/book_repository.dart';

class Search_Books_Usecase {
  Book_Repository book_repository;

  Search_Books_Usecase(this.book_repository);

  search_books_by_title(String book_title) async {
    var search_results =
        await book_repository.retrieve_books_by_title(book_title);

    return await search_results;
  }
}
