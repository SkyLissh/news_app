import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:scrollable_positioned_list/scrollable_positioned_list.dart";

import "package:news_app/constants/constants.dart";
import "package:news_app/providers/providers.dart";

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final _controller = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final category = context.select((NewsState n) => n.category);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index = _categories.indexWhere((c) => c.toLowerCase() == category);

      _controller.scrollTo(
        index: index,
        alignment: 0.3,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("Category", style: kTextNormal),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          height: 40,
          child: ScrollablePositionedList.builder(
            itemScrollController: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(_categories[index]),
                  selected: category == _categories[index].toLowerCase(),
                  onSelected: (selected) {
                    if (selected) {
                      context.read<NewsNotifier>().setCategory(
                            _categories[index].toLowerCase(),
                          );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }
}

final _categories = [
  "General",
  "Business",
  "Entertainment",
  "Health",
  "Science",
  "Sports",
  "Technology",
];
