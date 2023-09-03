import 'package:mobx/mobx.dart';
part 'main_viev_model.g.dart';

// ignore: library_private_types_in_public_api
class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  @observable
  ObservableSet<String> selectedCategories = ObservableSet<String>();

  @action
  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }
}
