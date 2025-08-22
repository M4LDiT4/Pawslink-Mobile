import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class AsyncGenericLoader<T> extends StatefulWidget {
  final Future<OperationResponse<T>> Function() asyncFunction;
  final String _errorMessage;
  final String _successMessage;
  final String _loadingMessage;
  final String _title;

  const AsyncGenericLoader({
    super.key,
    required this.asyncFunction,
    String? errorMessage,
    String? successMessage,
    String? loadingMessage,
    String? title
  }): _errorMessage = errorMessage ?? "Something went wrong",
      _successMessage = successMessage ?? "Operation Successful!",
      _loadingMessage = loadingMessage ?? "Please wait...",
      _title = title?? 'Processing';

  @override
  State<AsyncGenericLoader<T>> createState() => _AsyncGenericLoaderState<T>();
}

class _AsyncGenericLoaderState<T> extends State<AsyncGenericLoader<T>> with SingleTickerProviderStateMixin {
  late Future<OperationResponse<T>> _dataLoader;
  late AnimationController _successController;
  OperationResponse<T>? _response;
  WidgetStatus _status = WidgetStatus.idle;

  @override
  void initState() {
    super.initState();
    _dataLoader = widget.asyncFunction();
    _successController = AnimationController(vsync: this);
    _status = WidgetStatus.loading; // No need to call setState in initState
  }

  @override
  void dispose() {
    _successController.dispose();
    super.dispose();
  }

  void _updateStatusSafely(WidgetStatus status) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _status = status;
        });
      }
    });
  }

  void _updateResponseSafely(OperationResponse<T> response){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
        setState(() => _response = response);
      }
    });
  }

  void _exitDialog(){
    TNavigationService.back(result: _response ?? OperationResponse<T>.successfulResponse());
  }

  void _retryRequest(){
    if(_status == WidgetStatus.error){
      _dataLoader = widget.asyncFunction();
    }
  }

  void _handleButtonPress(){
    if(_status == WidgetStatus.error){
      _retryRequest();
    }else if(_status == WidgetStatus.idle){
      _exitDialog();
    }else{
      throw Exception("Status is not 'error' or 'success' but you pressed a button");
    }
  }

  void _handleCancel(){
    TNavigationService.back(result: OperationResponse<T>.failedResponse());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLoader(),
        _buildTextContent(),
        _buildSubtitle(),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildLoader(){
    return AnimatedSwitcher(
      duration:const Duration(
        milliseconds: 500
      ),
      transitionBuilder: (Widget child, Animation<double> animation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
      child: _buildLoaderByStatus(),
    );
  }

  Widget _buildLoaderByStatus() {
    return FutureBuilder<OperationResponse<T>>(
      future: _dataLoader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          _updateStatusSafely(WidgetStatus.loading);
          return Lottie.asset(
            TLottie.walkingDog,
            width: 160,
            key: const ValueKey("loading"),
          );
        }

        if (snapshot.hasError) {
          _updateStatusSafely(WidgetStatus.error);
          return Lottie.asset(
            TLottie.errorCat,
            width: 160,
            key: const ValueKey("error"),
          );
        }

        if (snapshot.hasData) {
          final data = snapshot.data!;
          _updateResponseSafely(data);

          if (data.isSuccessful) {
            _updateStatusSafely(WidgetStatus.idle);
            return Lottie.asset(
              TLottie.success,
              width: 80,
              controller: _successController,
              onLoaded: (composition) {
                _successController
                  ..duration = composition.duration
                  ..forward();
              },
              key: const ValueKey("success"),
            );
          } else {
            _updateStatusSafely(WidgetStatus.error);
            return Lottie.asset(
              TLottie.errorCat,
              width: 160,
              key: const ValueKey("failed"),
            );
          }
        }

        // No data fallback
        return Lottie.asset(
          TLottie.errorCat,
          width: 160,
          key: const ValueKey("no-data"),
        );
      },
    );
  }


  Widget _buildActionButtons() {
    final bool isError = _status == WidgetStatus.error;
    final Color color = isError ? TColors.error : TColors.success;
    final String label = isError ? "Retry" : "Okay";

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: _status != WidgetStatus.loading
        ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                // Main action button
                _buildButton(
                  label: label,
                  color: color,
                  textColor: Colors.white,
                  onPressed: _handleButtonPress,
                  filled: true,
                ),

                // Extra "Cancel" button if error
                if (isError)
                  _buildButton(
                    label: "Cancel",
                    color: color,
                    textColor: color,
                    onPressed: _handleCancel,
                    filled: false,
                  ),
              ],
            ),
          )
        : const SizedBox.shrink(),
    );
  }

  /// Helper for creating buttons with consistent style
  Widget _buildButton({
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
    bool filled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8), // spacing between buttons
      child: SizedBox(
        width: double.infinity, // full width inside dialog
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: filled ? color : Colors.transparent,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
            side: BorderSide(color: color, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }


  Widget _buildTextContent(){
    String content = "Sucess!";
    if(_status == WidgetStatus.loading){
      content = widget._title;
    }
    else if(_status == WidgetStatus.error){
      content = "Oopss..";
    }

    return  Text(
      style: const TextStyle(
        fontSize:24,
        fontWeight: FontWeight.bold
      ),
      content
    );
  }

  Widget _buildSubtitle(){
    String contentString = widget._loadingMessage;

    if(_status != WidgetStatus.loading){
      if(_response?.message != null){
        contentString = _response!.message!;
      }else if(_status == WidgetStatus.error){
        contentString = widget._errorMessage;
      }else{
        contentString = widget._successMessage;
      }
    }
    return Text(
      style:const TextStyle(
        fontSize: 12
      ),
      contentString
    );
  }
}
