import 'dart:convert';

import 'package:flutter_auth/Services/Utility/custom_dio_2.dart';

class QuoteRepository {
  final QuoteAPIClient quoteAPIClient = QuoteAPIClient();

  Future<List<dynamic>> getQuote() async {
    final rp = await quoteAPIClient.get('', {"q": "tesla", "from": "2021-06-23", "sortBy": "publishedAt", "apiKey": QuoteAPIClient.accessKey});
    print(rp);
    final parsed = json.decode(rp.toString());
    print(parsed["articles"].toString());

    return parsed["articles"];
  }
}