import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:news_app/providers/providers.dart";

import "country_icon.dart";
import "country_list.dart";

class CountryButton extends StatefulWidget {
  final String country;
  final double size;

  const CountryButton(this.country, {Key? key, this.size = 30})
      : super(key: key);

  @override
  State<CountryButton> createState() => _CountryButtonState();
}

class _CountryButtonState extends State<CountryButton> {
  void _onPressed(BuildContext context) async {
    String? country = await showModalBottomSheet(
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      context: context,
      builder: (_) => const CountryList(),
    );

    if (country == null || !mounted) return;

    context.read<NewsNotifier>().setCountry(country);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _onPressed(context),
      splashRadius: 24,
      icon: CountryIcon(widget.country, size: widget.size),
    );
  }
}
