import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

enum _LoadingStatus {
  loading,
  success,
  error,
  idle,
}

class SaveQRButton extends StatefulWidget {
  final Future<String?> Function() asyncFunction;
  const SaveQRButton({
    super.key,
    required this.asyncFunction,
  });

  @override
  State<SaveQRButton> createState() => __SaveQRButtonState();
}
class __SaveQRButtonState extends State<SaveQRButton> {
  late _LoadingStatus _status;

  Future<void>_executeFunction() async{
    try{
      setState(() {
        _status = _LoadingStatus.loading;

      });
      final response = await widget.asyncFunction.call();
      if(response == null){
        throw TAppException("Failed to save the QR Code");
      }
      setState(() {
        _status = _LoadingStatus.success;
      });      
      TUIHelpers.showSnackBar("QR Code saved at $response");
    }catch(e, stack){
      setState(() {
        _status = _LoadingStatus.error;
        TLogger.error('error: ${e.toString()}');
        TLogger.debug('stack : ${stack.toString()}');
      });
      TUIHelpers.showSnackBar("Failed to save QR Code: ${e.toString()}");
    }
  }

  void _handleOnPress() async{
    if(_status != _LoadingStatus.loading){
      await _executeFunction();
    }
  }

  @override
  void initState(){
    _status = _LoadingStatus.idle;
    super.initState();
  }

  

  Widget _buildChild(){
    if(_status == _LoadingStatus.loading){
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return const Text("Download QR Code");
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleOnPress, 
      child: _buildChild());
  }
}