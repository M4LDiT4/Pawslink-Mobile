import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exeption.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

enum ProcessStatus { loading, success, error }

class LoadingDialog extends StatefulWidget {
  final String loadingMessage;
  final String errorMessage;
  final String successMessage;
  final Future<TResponse> Function()? asyncFunction;

  const LoadingDialog({
    super.key,
    this.loadingMessage = "Processing...",
    this.errorMessage = "Operation Failed.",
    this.successMessage = "Operation Successful",
    this.asyncFunction,
  });

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> with TickerProviderStateMixin {
  late ProcessStatus _status;
  late AnimationController _animationController;
  late String _errMessage;
  bool _showActionButtons = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _executeAsyncFunction();
    _errMessage = ""; // empty string by default
  }

  Future<void> _executeAsyncFunction() async {
    try {
      setState(() {
        _status = ProcessStatus.loading;
        _animationController.reset();
        _showActionButtons = false;
      });
      final response = await widget.asyncFunction?.call();
      if (response == null) {
        throw TAppException("Response is null");
      }
      if (!response.success) {
        throw TAppException(response.message ?? "Unknown error occurred");
      }
      setState(() {
        _status = ProcessStatus.success;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
      });
      TLogger.error("Error in LoadingDialog: $e"); // remove in production
      setState(() {
        _status = ProcessStatus.error;
      });
    }
  }

  Widget _renderLoadingContent() {
    return Lottie.asset(
      TLottie.loading,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
    );
  }

  Widget _renderErrorContent() {
    return Lottie.asset(
      TLottie.failed,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
      controller: _animationController,
      onLoaded: (composition) {
        _animationController
          ..duration = composition.duration
          ..forward().whenComplete(() {
            setState(() {
              _showActionButtons = true;
            });
          });
      },
    );
  }

  Widget _renderSuccessContent() {
    return Column(
      children: [
        Lottie.asset(
          TLottie.success,
          width: TSizes.iconxxl,
          fit: BoxFit.fill,
          controller: _animationController,
          onLoaded: (composition) {
            _animationController
              ..duration = composition.duration
              ..forward().whenComplete(_popUntilHome);
          },
        ),
      ],
    );
  }

  Widget _buildLoader() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _buildLoaderByStatus(),
    );
  }

  void _popUntilHome() {
    TNavigationService.offAllNamed(TAppRoutes.home);
  }

  Widget _buildLoaderByStatus() {
    switch (_status) {
      case ProcessStatus.loading:
        return _renderLoadingContent();
      case ProcessStatus.success:
        return _renderSuccessContent();
      case ProcessStatus.error:
        return _renderErrorContent();
    }
  }

  Widget? _buildActionButtons() {
    if (_status == ProcessStatus.error && _showActionButtons) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: _popUntilHome,
            child: const Text(TText.cancel),
          ),
          TextButton(
            onPressed: _executeAsyncFunction,
            child: const Text("Retry"),
          ),
        ],
      );
    }
    return null;
  }

  Widget _buildTitleText() {
    String title;
    switch (_status) {
      case ProcessStatus.loading:
        title = widget.loadingMessage;
        break;
      case ProcessStatus.error:
        title = widget.errorMessage;
        break;
      default:
        title = widget.successMessage;
        break;
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Row(
        key: ValueKey("title-$title"), // 👈 Important for animation
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            key: ValueKey(title), // 👈 Add key to trigger animation
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText() {
    String textContent;
    switch (_status) {
      case ProcessStatus.loading:
        textContent = widget.loadingMessage;
        break;
      case ProcessStatus.error:
        textContent = _errMessage;
        break;
      default:
        textContent = widget.successMessage;
        break;
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Row(
        key: ValueKey("info-$textContent"), // 👈 Important for animation
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "- $textContent",
            key: ValueKey(textContent), // 👈 Add key to trigger animation
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleText(),
          const FixedSeparator(space: TSizes.spaceFromTitlesm),
          _buildInfoText(),
          const FixedSeparator(space: TSizes.spaceFromTitlemid),
          _buildLoader(),
          _buildActionButtons() ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
