abstract class ListEvent {}

class AddMapEvent extends ListEvent {
  Map<String, dynamic> newMap;

  AddMapEvent({required this.newMap});
}

class FetchAllMap extends ListEvent {
  FetchAllMap();
}

class EditMap extends ListEvent {
  int index;
  Map<String, dynamic> newMap;

  EditMap({required this.index, required this.newMap});
}

class DeleteMap extends ListEvent {
  int index;

  DeleteMap({required this.index});
}
