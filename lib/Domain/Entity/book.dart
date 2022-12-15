class Book {
  var book_title = '';
  var book_url = '';

  set_title(String book_title) {
    this.book_title = book_title;
  }

  set_url(String book_url) {
    this.book_url = book_url;
  }

  get_title() {
    return book_title;
  }

  get_url() {
    return book_url;
  }

  Map<String, dynamic> toMap() {
    return {'book_title': book_title, 'book_url': book_url};
  }
}
