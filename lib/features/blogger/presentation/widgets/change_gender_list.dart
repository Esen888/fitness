import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String title;
  final List<String> subMenuItems;

  const ListItem({super.key, required this.title, required this.subMenuItems});

  @override
  // ignore: library_private_types_in_public_api
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        if (_isExpanded)
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.subMenuItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.subMenuItems[index]),
              );
            },
          ),
      ],
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListItem(
          title: 'Item $index',
          subMenuItems: ['Sub Item 1', 'Sub Item 2'],
        );
      },
    );
  }
}
