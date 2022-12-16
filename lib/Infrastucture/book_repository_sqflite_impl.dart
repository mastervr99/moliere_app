import 'package:moliere_app/Domain/Entity/book.dart';
import 'package:moliere_app/Domain/Repositories_abstractions/book_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Book_Repository_Sqflite_Impl extends Book_Repository {
  late var database;

  @override
  _init_database() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'books.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute('''
          CREATE TABLE IF NOT EXISTS books (
            id INTEGER PRIMARY KEY,
            book_title TEXT,
            book_url TEXT
          )
        ''');
      },
    );
  }

  @override
  register_book(Book book) async {
    await _init_database();

    await database.insert('books', book.toMap());

    await _close_database();
  }

  @override
  retrieve_books_by_title(String book_title) async {
    await _init_database();

    var searchTerms = book_title.split(' ');

    var search_query = "SELECT * FROM books";

    for (var i = 0; i < searchTerms.length; i++) {
      String searchTerm = searchTerms[i].toString();
      if (i == 0) {
        search_query += " WHERE book_title like '%$searchTerm%'";
      } else {
        search_query += " AND book_title like '%$searchTerm%'";
      }
    }

    var books_data = await database.rawQuery(search_query);

    List<Book> books = [];

    await books_data;

    books_data.forEach((book_data) {
      Book book = Book();
      book.set_title(book_data['book_title'] ?? '');
      book.set_url(book_data['book_url'] ?? '');

      books.add(book);
    });

    await _close_database();

    return books;
  }

  @override
  retrieve_all_books() async {
    await _init_database();

    var books_data = await database.rawQuery("SELECT * FROM books");

    if (await books_data.isEmpty) {
      await _close_database();

      return [];
    } else {
      List<Book> books = [];

      await books_data.forEach((book_data) {
        Book book = Book();
        book.set_title(book_data['book_title']);
        book.set_url(book_data['book_url']);

        books.add(book);
      });

      await _close_database();

      return books;
    }
  }

  @override
  _close_database() async {
    // final _database = await get_database();
    // database = null;
    // await _database.close();
  }
}
