import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  try {
    // Fetch data from API
    HttpClient client = HttpClient();
    HttpClientRequest request =
        await client.getUrl(Uri.parse('https://api.example.com/data'));
    HttpClientResponse response = await request.close();
    String data = await response.transform(utf8.decoder).join();

    // Process response
    Map<String, dynamic> jsonData = json.decode(data);
    // Example processing, replace with your logic
    print('Weather: ${jsonData['weather']}');
  } catch (e) {
    print('Error: $e');
  }
}
