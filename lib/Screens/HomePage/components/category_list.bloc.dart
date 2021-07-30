import 'package:flutter_auth/Services/Storage/user_storage_service.dart';
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
