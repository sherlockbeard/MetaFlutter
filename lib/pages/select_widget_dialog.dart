import 'package:flutter/material.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class SelectWidgetDialog extends StatefulWidget {
  @override
  _SelectWidgetDialogState createState() => _SelectWidgetDialogState();
}

class _SelectWidgetDialogState extends State<SelectWidgetDialog> {
  var colorCombinations = [
    ColorPair(Colors.blue, Colors.blue[50]),
    ColorPair(Colors.pink, Colors.pink[50]),
    ColorPair(Colors.deepPurple, Colors.deepPurple[50]),
    ColorPair(Colors.orange, Colors.orange[50]),
    ColorPair(Colors.green, Colors.green[50]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Widget"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.0),
        itemBuilder: (context, position) {
          ColorPair pair = _getColorPair(getNewModelFromType(WidgetType.values[position]));

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: pair.backgroundColor,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context,
                      getNewModelFromType(WidgetType.values[position]));
                },
                child: Center(
                  child: Text(
                    WidgetType.values[position].toString().split(".")[1],
                    style: TextStyle(
                        color: pair.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: WidgetType.values.length,
      ),
    );
  }

  ColorPair _getColorPair(ModelWidget widget) {
    switch(widget.nodeType) {

      case NodeType.SingleChild:
        return colorCombinations[4];
        break;
      case NodeType.MultipleChildren:
        return colorCombinations[1];
        break;
      case NodeType.End:
        return colorCombinations[0];
        break;
    }
  }
}

class ColorPair {
  Color textColor;
  Color backgroundColor;

  ColorPair(this.textColor, this.backgroundColor);
}
