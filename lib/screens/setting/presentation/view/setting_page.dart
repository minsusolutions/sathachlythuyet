// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sathachlaixe/screens/setting/presentation/bloc/setting_bloc.dart';
// import 'package:sathachlaixe/screens/setting/presentation/view/liciense_tile.dart';

// class SettingPage extends StatelessWidget {
//   const SettingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ScrollController scrollController = ScrollController();

//     return BlocBuilder<SettingBloc, SettingState>(
//       builder: (context, state) {
//         if (state is SettingInitial) {
//           return const CircularProgressIndicator();
//         }
//         if (state is SettingLoadError) {
//           return const Text('Something went wrong');
//         }
//         if (state is SettingLoaded) {
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             child: ListView.separated(
//               controller: scrollController,
//               itemBuilder: (context, position) {
//                 return LicienseTile(
//                   liciense: state.licienses[position],
//                   isSelected:
//                       state.currentLiciense.id == state.licienses[position].id,
//                   onTap: () {
//                     if (state.currentLiciense.id !=
//                         state.licienses[position].id) {
//                       context.read<SettingBloc>().add(
//                         LicienseSelected(liciense: state.licienses[position]),
//                       );
//                     }
//                   },
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const Divider(color: Colors.blueGrey, thickness: 1);
//               },
//               itemCount: state.licienses.length,
//             ),
//           );
//         }
//         return Container();
//       },
//     );
//   }
// }
