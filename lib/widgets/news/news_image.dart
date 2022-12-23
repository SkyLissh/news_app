import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "package:news_app/constants/constants.dart";

class NewsImage extends StatelessWidget {
  final String? url;
  final double height;

  const NewsImage(this.url, {Key? key, this.height = 200.0}) : super(key: key);

  Future<bool> _validImage() async {
    if (url == null) return false;

    try {
      final res = await http.get(Uri.parse(url!));
      if (res.statusCode != 200) return false;

      final contentType = res.headers["content-type"];
      if (contentType != null && contentType.contains("image")) return true;
    } catch (e) {
      return false;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _validImage(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return NoImage(
            height: height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.data!) {
          return ClipRRect(
            borderRadius: kBorderRadius,
            child: Image.network(
              url!,
              height: height,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return NoImage(
                  height: height,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  NoImage(height: height),
            ),
          );
        } else {
          return NoImage(height: height);
        }
      },
    );
  }
}

class NoImage extends StatelessWidget {
  final Widget? child;
  final double height;

  const NoImage({
    Key? key,
    required this.height,
    this.child = _noImageIcon,
  }) : super(key: key);

  static const _noImageIcon = Icon(
    Icons.hide_image,
    color: Colors.blueGrey,
    size: 64,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: kBorderRadius,
      ),
      child: child,
    );
  }
}
