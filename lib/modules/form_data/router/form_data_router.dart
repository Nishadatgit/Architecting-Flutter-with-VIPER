import 'package:flutter/material.dart';

abstract class FormDataRouter {}

class FormDataRouterImpl implements FormDataRouter {
  final BuildContext context;

  FormDataRouterImpl(this.context);
}
