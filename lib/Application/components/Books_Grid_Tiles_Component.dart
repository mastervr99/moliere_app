import 'package:flutter/material.dart';
import 'package:moliere_app/Domain/Entity/book.dart';

class Books_Grid_Tiles_Component extends StatelessWidget {
  String name;
  String imageUrl;
  Book book;
  bool? fromSubBooks = false;

  Books_Grid_Tiles_Component(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.book,
      this.fromSubBooks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => Product_Detail_Screen(
        //             product: product,
        //           )),
        // );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          elevation: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 150,
                  height: 150,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Text(
                      (name.length <= 40 ? name : name.substring(0, 40)),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF444444),
                          fontFamily: 'Roboto-Light.ttf',
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                ),
                //   Container(
                //     alignment: Alignment.bottomLeft,
                //     padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                //     child: Text("€  ${(price != null) ? price : 'Unavailable'}",
                //         style: TextStyle(
                //             color: (price != null)
                //                 ? Color(0xFFf67426)
                //                 : Color(0xFF0dc2cd),
                //             fontFamily: 'Roboto-Light.ttf',
                //             fontSize: 20,
                //             fontWeight: FontWeight.w500)),
                //   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
