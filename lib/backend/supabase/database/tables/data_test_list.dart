import '../database.dart';

class DataTestListTable extends SupabaseTable<DataTestListRow> {
  @override
  String get tableName => 'data_test_list';

  @override
  DataTestListRow createRow(Map<String, dynamic> data) => DataTestListRow(data);
}

class DataTestListRow extends SupabaseDataRow {
  DataTestListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DataTestListTable();

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

  String? get detail => getField<String>('detail');
  set detail(String? value) => setField<String>('detail', value);
}
