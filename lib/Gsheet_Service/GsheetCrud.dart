import 'package:notepad_demo_app_gsheet_project/Gsheet_Service/GsheetSetup.dart';

List dataFromSheet = [];
insertDataIntoSheet({ID, heading, details, color, time}) async {
  List<Map<String, dynamic>> NotesDetailsList = await [
    {
      'id': '${ID}',
      'heading': '${heading}',
      'details': '${details}',
      'color': '${color}',
      'time': '${time}'
    }
  ];
  await gsheetCrudUserDetails!.values.map.appendRows(NotesDetailsList);
  print('Data Stored');
}

readDataFromSheet() async {
  try {
    dataFromSheet = (await gsheetCrudUserDetails!.values.map.allRows())!;
    print('{Data Fetched}');
  } catch (e) {
    dataFromSheet = [];
    print(e);
  }
}

updateDataFromSheet({IDFromNotes, heading, details, color, time}) async {
  await gsheetCrudUserDetails!.values.map.insertRowByKey('${IDFromNotes}', {
    'heading': '${heading}',
    'details': '${details}',
    'color': '${color}',
    'time': '${time}'
  });
  print('Data Updated');
}

deleteDataFromSheet({IDFromNotes}) async {
  final index =
      await gsheetCrudUserDetails!.values.rowIndexOf('${IDFromNotes}');

  await gsheetCrudUserDetails!.deleteRow(index);

  print('Row Deleted');
}
