import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListCubit extends Cubit<int> {
  int buttonClicked;

  CategoryListCubit(this.buttonClicked) : super(0);

  void clickButton(buttonClicked) {
   this.buttonClicked = buttonClicked;
   print(this.buttonClicked);
    emit(buttonClicked);
  }
}