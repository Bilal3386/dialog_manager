import 'package:dialog_manager/datamodels/alert_request.dart';
import 'package:dialog_manager/datamodels/alert_response.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../locator.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({@required this.child});

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    _dialogService.registerDialogListener(_showDialog);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    Alert(
      context: context,
      title: request.title,
      desc: request.description,
      closeFunction: () => _dialogService.dialogComplete(AlertResponse(confirm: false)),
      buttons: [
        DialogButton(
          child: Text(request.buttonTitle),
          onPressed: () {
            _dialogService.dialogComplete(AlertResponse(confirm: true));
            Navigator.of(context).pop();
          },
        )
      ]
    ).show();
  }
}
