import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> askMe({
  required String question,
  required String localData,
}) async {
  const apiKey = 'AIzaSyByv0qxLMM2SLsyBu3L2sAgJbEk3Kdk23w';
  final url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey',
  );

  print("object localData: $localData");


  String prompt = '''
I have this information: $localData
\nCurrent date is: ${DateTime.now()}
\nNow the question is.: $question
\nGive me the response using HTML Format. Make it bold, italic, colored as you want, you may use emojis as well. Answer in an organized way. Keep the date and time format AM/PM.
''';


  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": prompt},
          ],
        },
      ],
    }),
  ).timeout(Duration(seconds: 60));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final text = data['candidates'][0]['content']['parts'][0]['text'];
    return _cleanHtmlResponse(text);
  } else {
    throw Exception('Failed to get response: ${response.body}');
  }
}

String _cleanHtmlResponse(String response) {
  // Remove ```html and ``` markers
  return response.replaceAll(RegExp(r'```html'), '').replaceAll(RegExp(r'```'), '').trim();
}