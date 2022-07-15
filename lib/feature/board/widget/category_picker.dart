import 'package:flutter/material.dart';
import 'package:testovoe/feature/board/widget/category_button.dart';
import 'package:testovoe/shared/categories.dart';

class CategoryPicker extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  CategoryPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   _scrollController.jumpTo(0);
    // });
    return Container(
      width: double.infinity,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: Categories.categories.length,
        itemBuilder: _chipBuilder,
        separatorBuilder: (_, index) => const SizedBox(width: 8),
      ),
    );
  }

  Widget _chipBuilder(BuildContext context, int index) {
    Widget btn = CategoryButton(
      category: Categories.categories[index],
    );
    if (index == 0) {
      btn = Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: btn,
      );
    } else if (index == Categories.categories.length - 1) {
      btn = Padding(
        padding: const EdgeInsets.only(right: 32.0),
        child: btn,
      );
    }
    return btn;
  }
}
