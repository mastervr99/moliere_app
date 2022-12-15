import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:moliere_app/Application/common_widgets/Appbar_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Circular_Progress_Widget.dart';
import 'package:moliere_app/Application/components/Books_Grid_Tiles_Component.dart';
import 'package:moliere_app/Application/usecases/search_books_usecase.dart';
import 'package:moliere_app/Infrastucture/book_repository_sqflite_impl.dart';

class Search_Widget extends StatefulWidget {
  @override
  _Search_Widget_State createState() => _Search_Widget_State();
}

findProducts(var value) async {
  Book_Repository_Sqflite_Impl book_repository = Book_Repository_Sqflite_Impl();

  Search_Books_Usecase search_books_usecase =
      Search_Books_Usecase(book_repository);

  var searched_books = await search_books_usecase.search_books_by_title(value);

  return await searched_books;
}

class _Search_Widget_State extends State<Search_Widget> {
  TextEditingController searchController = TextEditingController();

  var searchTerms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          // **************** TO REMOVE **************** */
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //       textStyle: const TextStyle(fontSize: 20)),
          //   onPressed: () async {
          //     await createProductTable();
          //   },
          //   child: const Text('Enabled'),
          // ),
          // ******************************** */

          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Theme(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          fillColor: Color(0xFFF2F4F5),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          hintText: translate("label_search_bar"),
                        ),
                        autofocus: false,
                        onSubmitted: (value) async {
                          setState(() {
                            searchTerms = value;
                          });
                        },
                      ),
                      data: Theme.of(context).copyWith(
                        primaryColor: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (searchTerms != null && searchTerms.isNotEmpty)
            FutureBuilder(
              future: findProducts(searchTerms),
              builder: (context, AsyncSnapshot snapshot) {
                List<dynamic>? books_list = snapshot.data;

                if (snapshot.hasData) {
                  if (books_list!.isEmpty)
                    return Center(
                      child: Text(translate('label_product_search_failed')),
                    );
                  else
                    return Expanded(
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(1.0),
                        childAspectRatio: 8.0 / 12.0,
                        children:
                            List<Widget>.generate(books_list.length, (index) {
                          return GridTile(
                              child: Books_Grid_Tiles_Component(
                            name: books_list[index]!.getTitle().length <= 35
                                ? books_list[index]!.getTitle()
                                : books_list[index]!
                                        .getTitle()
                                        .substring(0, 35) +
                                    '...',
                            imageUrl: books_list[index]!.getImageUrl(),
                            book: books_list[index]!,
                          ));
                        }),
                      ),
                    );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Circular_Progress_Widget();
                }
              },
            ),
        ],
      ),
    );
  }
}
