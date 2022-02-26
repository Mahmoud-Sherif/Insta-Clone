
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:flutter/material.dart';

showSnackBar(String message, {bool isError = false}) =>
    ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.white,
      ),
    );
