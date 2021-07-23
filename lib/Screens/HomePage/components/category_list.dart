import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/CustomButton/category_button.dart';
import 'category_list.bloc.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryListCubit buttonCubit = CategoryListCubit(0);
    const categoryList = ['Business', 'Magazine', 'World', 'Environment', 'Education'];

    return Container(
        height: 50,
        child: BlocBuilder<CategoryListCubit, int>(
          bloc: buttonCubit,
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.only(top: 5),
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                  categoryList.length,
                      (index) => InkWell(
                    child: CategoryButton(
                      category: categoryList[index],
                      clicked: buttonCubit.buttonClicked == index,
                    ),
                    onTap: () {
                      buttonCubit.clickButton(index);
                    },
                  ),
                ),
              ],
            );
          },

        )
    );
  }
}
