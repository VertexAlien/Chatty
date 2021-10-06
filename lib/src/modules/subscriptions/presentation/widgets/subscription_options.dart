// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_social_messenger/src/modules/subscriptions/presentation/controller.dart';
//
// class SubOptions extends StatelessWidget {
//   SubOptions({
//     Key key,
//   }) : super(key: key);
//
//   SubsController subsController = SubsController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         margin: EdgeInsets.only(left: 10, right: 10),
//         child: Observer(
//           builder: (context) {
//             return Column(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   height: 200,
//                   color: Colors.white10,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         "1 Month",
//                       ),
//                       FlatButton(
//                           onPressed: () {
//                             print("1 month subscribed! ");
//                             subsController.buyProduct(productIndex: 0);
//                             if (subsController.hasPurchased) {
//                               //subsController.subscribe(month: 1);
//                               print('has purchased!!!!!!!!!!!!!!!!');
//                             }
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             alignment: Alignment.center,
//                             color: Colors.green,
//                             child: Text("\$0.99"),
//                           )),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   height: 200,
//                   color: Colors.white10,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         "6 Month",
//                       ),
//                       FlatButton(
//                           onPressed: () {
//                             print("6 month subscribed! ");
//                             if (subsController.hasPurchased) {
//                               subsController.subscribe(month: 6);
//                             }
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             alignment: Alignment.center,
//                             color: Colors.green,
//                             child: Text("\$5.99"),
//                           )),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 10),
//                   height: 200,
//                   color: Colors.white10,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         "12 Month",
//                       ),
//                       FlatButton(
//                           onPressed: () {
//                             print("12 month subscribed! ");
//                             if (subsController.hasPurchased) {
//                               subsController.subscribe(month: 12);
//                             }
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 100,
//                             alignment: Alignment.center,
//                             color: Colors.green,
//                             child: Text("\$11.99"),
//                           )),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
