import 'package:flutter/material.dart';

import '../../../../../core/utils/routes/route_name.dart';
import '../../../../library/domain/entity/reading_list_entity.dart';
import '../../../../library/presentaion/view/widgets/my_list_item.dart';

class MyListSection extends StatelessWidget {
  final List<ReadingListEntity> readingLists;

  const MyListSection({super.key, required this.readingLists});

  @override
  Widget build(BuildContext context) {
    if (readingLists.isEmpty) {
      return SizedBox(
        height: 100,
        child: Center(
          child: Text(
            'No Lists Available',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      );
    } else {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: readingLists.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final list = readingLists[index];
          return GestureDetector(
            child: MyListItem(
              title: list.name ?? 'Untitled List',
              subtitle: '${list.numberOfBooks ?? 0} books',
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.libraryBookScreen,
                arguments: list,
              );
            },
          );
        },
      );
    }
  }
}
