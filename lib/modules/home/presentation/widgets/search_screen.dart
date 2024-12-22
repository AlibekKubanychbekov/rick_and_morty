// import 'package:flutter/material.dart';
// import 'package:rick_and_morty/core/extensions/extaensions.dart';
// import 'package:rick_and_morty/core/theme/app_dimens.dart';
// import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List<CharacterEntity> result = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               textInputAction: TextInputAction.search,
//               onChanged: (value) {
//                 result.clear();
//                 _searchUser(value, result);
//                 setState(() {});
//               },
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
//                 focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
//               ),
//             ),
//             result.isEmpty
//                 ? const Center(child: Text(''))
//                 : Expanded(
//                     child: ListView.separated(
//                       separatorBuilder: (context, index) =>
//                           AppDimens.bigPadding.verticalSpace,
//                       itemCount: result.length,
//                       itemBuilder: (context, index) => ListTile(
//                         leading: Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                               fit: BoxFit.fitWidth,
//                               image: NetworkImage(result[index].image),
//                             ),
//                           ),
//                         ),
//                         title:
//                             Text('${result[index].name} ${result[index].name}'),
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<CharacterEntity> _searchUser(
//       String searchValue, List<CharacterEntity> result) {
//     final results = CharacterResponseEntity(results: result);
//     for (var element in result) {
//       if (element.name.contains(searchValue) ||
//           element.name.contains(searchValue.toUpperCase())) {
//         result.add(element);
//       }
//     }

//     return result;
//   }
// }
