// import 'package:flutter/material.dart';
//
// import '../../../core/constants/app_colors.dart';
// import '../../../core/constants/app_sizes.dart';
// import '../../people/widget/people_view.dart';
//
// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 160,
//             decoration: BoxDecoration(
//               gradient: AppColors.gradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: 50,),
//                 Container(
//                   padding: EdgeInsets.all(AppSizes.paddingInside),
//                   margin: EdgeInsets.symmetric(horizontal:AppSizes.paddingBody),
//                   decoration: BoxDecoration(
//                     color: Colors.white10,
//                     borderRadius: BorderRadius.circular(
//                       AppSizes.textFieldRadius,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.arrow_back_ios, color: Colors.white),
//                       Expanded(
//                         child: TextFormField(
//                           cursorColor: Colors.white,
//                           style: TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             hintText: 'Search here...',
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: InputBorder.none,
//                             isDense: true,
//                             isCollapsed: true,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: AppSizes.paddingBody,),
//                 //!for tab
//                 SizedBox(
//                   height: 32,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(width: AppSizes.paddingBody,),
//                       Container(
//                         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8)
//                           ),
//                           child: Text("People")),
//                       Container(
//                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           decoration: BoxDecoration(
//                               // color: Colors.white,
//                               borderRadius: BorderRadius.circular(8)
//                           ),
//                           child: Text("Session",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white,))),
//                       Container(
//                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           decoration: BoxDecoration(
//                               // color: Colors.white,
//                               borderRadius: BorderRadius.circular(8)
//                           ),
//                           child: Text("Project",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white,))),
//                       Container(
//                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           decoration: BoxDecoration(
//                               // color: Colors.white,
//                               borderRadius: BorderRadius.circular(8)
//                           ),
//                           child: Text("Communication",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white,))),
//                       Container(
//                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           decoration: BoxDecoration(
//                               // color: Colors.white,
//                               borderRadius: BorderRadius.circular(8)
//                           ),
//                           child: Text("Task",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white,),)),
//                     ],
//                   ),
//                 )
//                 //!end for tab
//               ],
//             ),
//           ),
//
//           //for tab view
//           Expanded(child: PeopleView())
//         ],
//       ),
//     );
//   }
// }
