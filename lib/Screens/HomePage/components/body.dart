import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/LoadingComponent/loading_component.dart';
import 'package:flutter_auth/Repository/quote_repository.dart';
import 'package:flutter_auth/Function/handleURL.dart';
import 'package:flutter_auth/Screens/HomePage/components/category_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repo = QuoteRepository();

    return Container(
      child: ListView(
        children: [
          CategoryList(),
          FutureBuilder<List<dynamic>>(
            future: repo.getQuote(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final articles = snapshot.data ?? [];
                // return Text('hjksdnc');

                return Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        articles.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              width: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      articles[index]["urlToImage"].toString()),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: InkWell(
                                  onTap: () => NewsLink.handleURL(context, articles[index]["url"]),
                                  child: Text(
                                    articles[index]["title"].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return LoadingComponent(context);
            },
          )
        ],
      ),
    );
  }
}
