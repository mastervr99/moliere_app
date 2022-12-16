import 'package:flutter_test/flutter_test.dart';
import 'package:moliere_app/Application/usecases/search_books_usecase.dart';
import 'package:moliere_app/Domain/Entity/book.dart';
import 'package:moliere_app/Domain/Repositories_abstractions/book_repository.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'Repositories_test/book_repository_sqflite_ffi_impl.dart';

// import 'Repositories_test/product_repository_sqflite_ffi_impl.dart';

void main() {
  closeSqfliteFfiDatabase() async {
    var db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.close();
  }

  group(' Book Repository', () {
    test('retrieve all books', () async {
      var book = Book();
      book.set_title('La femme malgré lui');

      var book_01 = Book();
      book_01.set_title('Les femmes savantes');

      Book_Repository book_repository = Book_Repository_Sqflite_Ffi_Impl();

      await book_repository.register_book(book);
      await book_repository.register_book(book_01);

      var books = await book_repository.retrieve_all_books();
      expect(await books[0].get_title(), 'La femme malgré lui');
      expect(await books[1].get_title(), 'Les femmes savantes');
    });
  });
}
