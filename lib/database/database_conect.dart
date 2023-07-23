import 'package:supabase/supabase.dart';

const subaurl = "https://wesmxtypwfeyxfzxiqve.supabase.co";
const subapass =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indlc214dHlwd2ZleXhmenhpcXZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTEwNjU3NzQsImV4cCI6MTk2NjY0MTc3NH0.t-zqDDml_G9UcI01xooLLc9EspMDSGiildnQ3IqiflA";

final clinet = SupabaseClient(subaurl, subapass);

Future getdata(String _table, String categor, String com) async {
  final response =
      await clinet.from(_table).select().eq(com, categor).execute();
  if (response.data != null) {
    final res = response.data as List;
    return res.toList();
  }
}

// select every database from clinet
Future getalldata(
  String _table,
) async {
  final response = await clinet.from(_table).select().execute();
  if (response.data != null) {
    final res = response.data as List;
    return res.toList();
  }
}
