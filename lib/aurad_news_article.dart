
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'artical_news.dart';

class AuradNewsArticle extends StatefulWidget {
  const AuradNewsArticle({super.key, required this.news});
  final dynamic news;
  @override
  _AuradNewsArticleState createState() => _AuradNewsArticleState();
}

class _AuradNewsArticleState extends State<AuradNewsArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('News')),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      placeholder: (BuildContext context, String url) =>
                          Container(),
                      errorWidget: (BuildContext context, String url, error) =>
                          const SizedBox(),
                      imageUrl: widget.news['urlToImage'] as String,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Author: ${widget.news['author'] as String}',),
                  Text('Published On: ${widget.news['publishedAt'] as String}'.substring(0, 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    if (widget.news['description'] != null) Text(widget.news['description'] as String) else Text(widget.news['title'] as String),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (BuildContext context) =>
                                            ArticalNews(
                                          newsUrl: widget.news['url'] as String,
                                        ),
                                      ),
                                    );
                                  }
              },
              child: const Text('Read full Article'),
            ),
            const Spacer(),
            Positioned(
                      bottom: 8,
                      right: 8,
                      child: Card(
                        elevation: 0,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Text(
                            "${widget.news['source']['name']}",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    ),
          ],
        ),
      );
  }

  @override
  void initState() {
    super.initState();
  }
}
