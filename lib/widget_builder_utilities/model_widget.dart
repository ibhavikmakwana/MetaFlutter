import 'package:flutter/material.dart';

/// Denotes the type of widget
enum WidgetType { Text, Center, Column, Icon }

/// Denotes if the widget can have zero, one or multiple children
enum NodeType {
  SingleChild,
  MultipleChildren,
  End,
}

/// Model Widget class
abstract class ModelWidget {
  
  /// Type of widget ([Text], [Center], [Column], etc)
  WidgetType widgetType;
  
  /// Children of the widget
  Map<int, ModelWidget> children = {};
  
  /// How the widget fits into the tree
  /// [NodeType.End] is used for widgets that cannot have children
  /// [NodeType.SingleChild] and [NodeType.MultipleChildren] are self-explanatory
  NodeType nodeType;

  /// Stores the names of all parameters and input types
  Map paramNameAndTypes = {};
  
  /// The parameter values of the widget
  /// Key is the parameter name and value is the value
  Map params = {};
  
  /// Denotes if the widget has any properties
  bool hasProperties;
  
  /// Denotes if the widget has any children
  bool hasChildren;

  /// This method takes the parameters and returns the actual widget to display
  Widget toWidget();

  /// Add child if widget takes children and space is available and return true, else return false
  bool addChild(ModelWidget widget) {
    if (nodeType == NodeType.SingleChild) {
      children[0] = widget;
      return true;
    } else if (nodeType == NodeType.MultipleChildren) {
      children[children.length] = widget;
      return true;
    }

    return false;
  }

  /// Get current values of all parameters of the widget model
  Map getParamValuesMap();
}
