import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  try {
    // Fetch data from API
    HttpClient client = HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m&timezone=auto'));
    HttpClientResponse response = await request.close();
    String data = await response.transform(utf8.decoder).join();

    print(data);

    // Process response
    Map<String, dynamic> jsonData = json.decode(data);
    // Example processing, replace with your logic
    print('Weather: ${jsonData['weather']}');
  } catch (e) {
    print('Error: $e');
  }
}
