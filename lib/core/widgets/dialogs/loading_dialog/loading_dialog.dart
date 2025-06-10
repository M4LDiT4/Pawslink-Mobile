import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

enum ProcessStatus { loading, success, error }

class LoadingDialog extends StatefulWidget {
  final String loadingMessage; //custom loading message
  final String errorMessage; //custom error message
  final String successMessage; //custom success message
  final Future<TResponse> Function()? asyncFunction; //async function to execute

  //provide default values for the loadingMesage, errorMessage and successMessage on the constructor
  const LoadingDialog({
    super.key,
    this.loadingMessage = TText.processing,
    this.errorMessage =  TText.operationFailed,
    this.successMessage =  TText.operationSuccess,
    this.asyncFunction,
  });

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> with TickerProviderStateMixin {
  late ProcessStatus _status; //status of the execution of the async function
  //animation controller for the lottie error and success gif
  //necessary for stopping the animation and resetting of animation
  late AnimationController _animationController; 
  //error message that will be displayed as the error info
  //populated per error
  late String _errMessage; 
  //determines if the action button for the dialog will be shown
  //for now, the error dialog has the action buttons
  bool _showActionButtons = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _executeAsyncFunction();
    _errMessage = ""; // empty string by default
  }

  //executes the passed async function 
  //sets state, initial of loading and will change to success or failed depending on the result of the async function
  Future<void> _executeAsyncFunction() async {
    try {
      setState(() {
        _status = ProcessStatus.loading;
        _animationController.reset(); //resets the animation of the success or error message to make them reusable (e.g will replay from start even after it has already played)
        _showActionButtons = false; //remove the action buttons from view if it is alread showing otherwise does nothing
      });
      final response = await widget.asyncFunction?.call();
      //if response is null or if response is not successful, throw an exception
      //simple way of handling erratic requests and responses
      if (response == null) {
        throw TAppException(TText.nullResponse);
      }
      if (!response.success) {
        throw TAppException(response.message ?? TText.unknownError);
      }
      //if request is successful with valid response, set thes state to successful
      setState(() {
        _status = ProcessStatus.success;
      });
    //will set the state of the dialog to error
    //catches all errors and modfiies the _errMessage based on the cause of the error encountered
    } catch (e) {
      setState(() {
        //update the _errMessage based on the response
        _errMessage = e.toString();
      });
      TLogger.error("Error in LoadingDialog: $e"); // remove in production
      setState(() {
        _status = ProcessStatus.error; //set the status to error
      });
    }
  }

  //renders the loading lottie gif
  //repeats the gif
  Widget _renderLoadingContent() {
    return Lottie.asset(
      TLottie.loading,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
    );
  }
  //renders the error lottie gif
  //only animates once
  //needs the _animationController
  Widget _renderErrorContent() {
    return Lottie.asset(
      TLottie.failed,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
      controller: _animationController, //animation controller
      onLoaded: (composition) {
        _animationController
          ..duration = composition.duration
          ..forward().whenComplete(() { //executes a function when animation completes
            setState(() {
              _showActionButtons = true; //show the action buttons when the animation completes
            });
          });
      },
    );
  }
  //renders the success lottie gif
  //only animates onces
  //needs the _animalController
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
              ..forward().whenComplete(_popUntilHome); //executes the _popUntilHome function when the animation completes
          },
        ),
      ],
    );
  }

  //makes the transition between the loadin, error and success lottie gifs to have a transition
  Widget _buildLoader() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _buildLoaderByStatus(),
    );
  }
  //pops the getx navigation stack until the name route home is found
  void _popUntilHome() {
    TNavigationService.offAllNamed(TAppRoutes.home);
  }

  //returns the correct lottie gif based on the current status
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

  //builds the action button
  //only return a widget instead of null when the status is error
  Widget _buildActionButtons() {
    final showButtons = _status == ProcessStatus.error && _showActionButtons;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: showButtons
          ? Row(
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
            )
          : const SizedBox.shrink(), // animates to height 0
    );
  }


  //builds the title of the dialog based on the current status
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

  //builds the info text of the current status of the dialog box with transition between states
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
