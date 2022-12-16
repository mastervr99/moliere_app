import 'package:moliere_app/Domain/Entity/book.dart';

abstract class Book_Repository {
  _init_database();

  register_book(Book book);

  retrieve_books_by_title(String book_title);

  retrieve_all_books();

  _close_database();
}
