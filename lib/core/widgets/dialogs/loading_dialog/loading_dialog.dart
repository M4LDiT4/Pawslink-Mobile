import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

enum ProcessStatus{ loading, success, error }

class LoadingDialog extends StatefulWidget {
  final String loadingMessage;
  final String errorMessage;
  final String successMessage;
  final Future<void> Function()? asyncFunction;
  
  const LoadingDialog({
    super.key,
    this.loadingMessage = "Saving...",
    this.errorMessage = "Operation Encountered an Error",
    this.successMessage = "Operation Successful",
    this.asyncFunction,
  });

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> with TickerProviderStateMixin{
  late ProcessStatus status;
  late AnimationController _animationController;
  bool showActionButtons = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _executeAsyncFunction();
  }

  Future<void> _executeAsyncFunction() async{
    try{
      setState(() {
        status = ProcessStatus.loading; 
        _animationController.reset();
        showActionButtons = false;
      });
      await widget.asyncFunction?.call();
      setState(() {
        status = ProcessStatus.success;
      });
    }catch(e){
      setState(() {
        status = ProcessStatus.error;
      });
    }
  }

  Widget _renderLoadingContent(){
    return Lottie.asset(
      TLottie.loading,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
    );
  }

  void _popUntilHome(){
    TNavigationService.offAllNamed(TAppRoutes.home);
  }
  Widget _renderErrorContent(){
    return Lottie.asset(
      TLottie.failed,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
      controller: _animationController,
      onLoaded: (composition){
        _animationController
          ..duration = composition.duration
          ..forward().whenComplete((){
            setState(() {
              showActionButtons = true;
            });
          });
      }
    );
  }

  Widget _buildLoader(){
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _buildLoaderByStatus(),
    );
  }

  Widget _buildLoaderByStatus(){
    switch(status){
      case ProcessStatus.loading:
        return _renderLoadingContent();
      case ProcessStatus.success:
        return _renderSuccessContent();
      case ProcessStatus.error:
        return _renderErrorContent();
    }
  }

  Widget _renderSuccessContent(){
    return Column(
      children: [
        Lottie.asset(
          TLottie.success,
          width: TSizes.iconxxl,
          fit: BoxFit.fill,
          controller: _animationController,
          onLoaded: (composition){
            _animationController
              ..duration = composition.duration
              ..forward().whenComplete(
                _popUntilHome
              );
          }
        )
      ],
    );
  }

  Widget? _buildActionButtons(){
    if (status == ProcessStatus.error && showActionButtons){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: _popUntilHome, 
            child: const Text(TText.cancel),
          ),
          TextButton(
            onPressed: _executeAsyncFunction, 
            child: const Text("Retry")
          ),
        ],
      );
    } 
    return null;
  }

  Widget _buildInfoText(){
    String textContent;
    switch(status){
      case ProcessStatus.loading:
        textContent = widget.loadingMessage;
        break;
      case ProcessStatus.error:
        textContent = widget.errorMessage;
        break;
      
      default:
        textContent = widget.successMessage;
        break;
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Text(textContent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildInfoText(),
          const FixedSeparator(space: TSizes.spaceFromTitlelg),
          _buildLoader(),
          _buildActionButtons() ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}