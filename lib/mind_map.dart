library mind_map;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A Calculator.
class MindMap extends MultiChildRenderObjectWidget {
  const MindMap({
    Key? key,
    required List<Widget> children,
    this.dotColor = Colors.purple,
    this.lineColor = Colors.black,
    this.padding = const EdgeInsets.only(left: 50, right: 10),
    this.dotRadius = 8,
    this.componentWith = 50,
  }) : super(key: key, children: children);

  final Color dotColor;

  final Color lineColor;

  final EdgeInsets padding;

  final double dotRadius;

  final double componentWith;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderBranchComponent(dotColor, lineColor, padding, dotRadius, componentWith);

  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {
    (renderObject as RenderBranchComponent).dotColor = dotColor;
    renderObject.lineColor = lineColor;
    renderObject.padding = padding;
    renderObject.dotRadius = dotRadius;
  }
}

class BranchComponentParentData extends ContainerBoxParentData<RenderBox> {}

// const double childPadding = 50;
// const double dotRadius = 6;
const double graphPadding = 10;
const double graphRadius = 8;

class RenderBranchComponent extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, BranchComponentParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, BranchComponentParentData> {
  RenderBranchComponent(
    this.dotColor,
    this.lineColor,
    this.padding,
    this.dotRadius,
    this.componentWith,
  );

  late Color dotColor;

  late Color lineColor;

  late EdgeInsets padding;

  late double dotRadius;

  late double componentWith;

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! BranchComponentParentData) {
      child.parentData = BranchComponentParentData();
    }
  }

  double calculatorMaxWidth = 0;



  @override
  void performLayout() {
    double height = 0;
    final deflatedConstraints = constraints.deflate(EdgeInsets.only(left: padding.left));

    for (var child = firstChild; child != null; child = childAfter(child)) {
      // var childContrainsts = deflatedConstraints.copyWith(
      //   maxWidth: child.size.width
      // );
      child.layout(deflatedConstraints, parentUsesSize: true);
      (child.parentData as BoxParentData).offset = Offset(componentWith + padding.right, height);
      height += child.size.height;
      var widthChildItem =  child.size.width;
      // estimateWidth
      if(widthChildItem> calculatorMaxWidth){
        calculatorMaxWidth  = widthChildItem;
      }
    }

    size = Size(calculatorMaxWidth, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    /// init line ;
    final Paint linesPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final Paint dotsPaint = Paint()..color = dotColor;

    /// start
    if (childCount == 0) {
      return;
    }

    int childNumber = 0;

    double y = offset.dy;

    Offset? start, end;

    late Rect rect1, rect2;

    Path lines = Path();

    Path dots = Path();

    double maxHeight = 0;

    for (var child = firstChild; child != null; child = childAfter(child)) {
      final BranchComponentParentData childParentData = child.parentData! as BranchComponentParentData;
      var offset0 = Offset(childParentData.offset.dx + offset.dx, childParentData.offset.dy+offset.dy);
      context.paintChild(child, offset0);

      final centerY = y + child.size.height / 2;
      final dotCenter = Offset(componentWith + offset.dx, centerY);

      maxHeight = y + child.size.height;

      /// old is grapRadius
      var side = graphRadius * 2;

      if (childNumber == 0) {
        // first child
        start = dotCenter;
        rect1 = Rect.fromLTWH(graphPadding + offset.dx, centerY, side, side);
      } else if (childNumber == childCount - 1) {
        // last child
        end = dotCenter;
        rect2 = Rect.fromLTWH(graphPadding + offset.dx, centerY - side, side, side);
      } else {
        // middle child
        lines
          ..moveTo(graphPadding + offset.dx, centerY)
          ..lineTo(dotCenter.dx, dotCenter.dy);
      }

      dots.addOval(Rect.fromCircle(center: dotCenter, radius: dotRadius));

      y += child.size.height;
      childNumber++;
    }

    Path centerLine = Path();
    centerLine
      ..moveTo(offset.dx, (offset.dy + maxHeight) / 2)
      ..lineTo(offset.dx + 10, (offset.dy + maxHeight) / 2);
    context.canvas.drawPath(centerLine, linesPaint);

    if (start != null && end != null) {
      lines
        ..moveTo(start.dx, start.dy)
        ..arcTo(rect1, -pi / 2, -pi / 2, false)
        ..arcTo(rect2, -pi, -pi / 2, false)
        ..lineTo(end.dx, end.dy);
    } else if (start != null){
      lines
        ..moveTo(offset.dx + 10, (offset.dy + maxHeight) / 2)
        ..lineTo(start!.dx, start!.dy);
    }
    context.canvas
      ..drawPath(lines, linesPaint)
      ..drawPath(dots, dotsPaint);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}
