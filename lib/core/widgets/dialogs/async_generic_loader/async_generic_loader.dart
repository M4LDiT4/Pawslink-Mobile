import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AsyncGenericLoader<T> extends StatefulWidget {
  final Future<OperationResponse<T>> Function() asyncFunction;
  final String _errorMessage;
  final String _successMessage;
  final String _loadingMessage;

  const AsyncGenericLoader({
    super.key,
    required this.asyncFunction,
    String? errorMessage,
    String? successMessage,
    String? loadingMessage 
  }): _errorMessage = errorMessage ?? "Something went wrong",
      _successMessage = successMessage ?? "Operation Successful!",
      _loadingMessage = loadingMessage ?? "Please wait...";

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
    TNavigationService.back(result: _response);
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
        milliseconds: 300
      ),
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
            width: 160,
            TLottie.walkingDog);
        } else if (snapshot.hasError) {
          _updateStatusSafely(WidgetStatus.error);
          return Center(
            child: Lottie.asset(
              width: 160,
              TLottie.errorCat
            ),
          );
        } else if (snapshot.hasData) {
          // async function has data
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
            );
          } else {
            _updateStatusSafely(WidgetStatus.error);
            return Center(child: Text('Failed: ${data.message}'));
          }
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }

  Widget _buildActionButtons() {
    final bool isError = _status == WidgetStatus.error;
    final Color color = isError ? TColors.error : TColors.success;
    final String label = isError ? "Retry" : "Okay";

    return AnimatedSize(
      duration: const Duration(
        milliseconds: 300,
      ),
      curve:  Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: _status != WidgetStatus.loading ? Padding(
      padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: color, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _exitDialog,
                child: Text(label),
              ),
            ),
          ],
        ),
      )
      : const SizedBox.shrink(),
    );
  }


  Widget _buildTextContent(){
    String content = "Sucess!";
    if(_status == WidgetStatus.loading){
      content = "Processing...";
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
