import '../database.dart';

class NoteListTable extends SupabaseTable<NoteListRow> {
  @override
  String get tableName => 'note_list';

  @override
  NoteListRow createRow(Map<String, dynamic> data) => NoteListRow(data);
}

class NoteListRow extends SupabaseDataRow {
  NoteListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NoteListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createDate => getField<DateTime>('create_date')!;
  set createDate(DateTime value) => setField<DateTime>('create_date', value);

  String? get createBy => getField<String>('create_by');
  set createBy(String? value) => setField<String>('create_by', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  int? get seq => getField<int>('seq');
  set seq(int? value) => setField<int>('seq', value);
}
