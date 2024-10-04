import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/widgets/image_dialog.dart';

class BookImageWidget extends StatelessWidget {
  final bool bordered;
  final bool canShowDialog;
  final double borderRadius;
  final double? height;
  final double? width;
  final String? url;

  const BookImageWidget({
    super.key,
    this.bordered = false,
    this.canShowDialog = false,
    this.borderRadius = 60,
    this.height,
    this.width,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: _isBordered(context),
      ),
    );
  }

  Widget _getWidget(BuildContext context) {
    if (url == null) {
      return const Icon(Icons.book);
    }

    return GestureDetector(
      onTap: () => url != null ? _showDialog(url!, context) : null,
      child: Image.network(
        url!,
        fit: BoxFit.fitHeight,
        loadingBuilder: (context, widget, progress) {
          if (progress != null) {
            return const CircularProgressIndicator();
          }

          return widget;
        },
        errorBuilder: (_, __, ___) => const Icon(Icons.book),
      ),
    );
  }

  Widget _isBordered(BuildContext context) {
    if (bordered) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: _getWidget(context),
      );
    }

    return _getWidget(context);
  }

  void _showDialog(String imageUrl, BuildContext context) {
    if (!canShowDialog) {
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ImageDialog(imageUrl: imageUrl);
      },
    );
  }
}
