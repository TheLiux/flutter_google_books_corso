import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';
import 'package:flutter_google_books/common/widgets/book_image_widget.dart';
import 'package:go_router/go_router.dart';

class BookListTile extends StatelessWidget {
  final VolumeInfo volumeInfo;

  const BookListTile({
    super.key,
    required this.volumeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 60,
        child: BookImageWidget(
          url: volumeInfo.imageLinks?.smallThumbnail,
        ),
      ),
      title: bookListText(
        text: volumeInfo.title!,
      ),
      subtitle: _subTitleWidget(),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: () => _navigateToBookDetails(
          context,
          volumeInfo,
        ),
      ),
    );
  }

  Widget bookListText({
    required String text,
    TextStyle? style,
  }) {
    if (style != null) {
      style = style.copyWith(
        overflow: TextOverflow.ellipsis,
      );
    }

    return Text(
      text,
      maxLines: 2,
    );
  }

  Widget? _subTitleWidget() {
    List<Widget> children = [];
    children.add(
      bookListText(
        text: volumeInfo.authorsToString(),
      ),
    );

    if (volumeInfo.description != null) {
      children.add(bookListText(
        text: volumeInfo.description!,
        style: const TextStyle(
          color: Colors.black45,
        ),
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  void _navigateToBookDetails(BuildContext context, VolumeInfo value) {

    context.push('/book_details', extra: value);
  }
}
