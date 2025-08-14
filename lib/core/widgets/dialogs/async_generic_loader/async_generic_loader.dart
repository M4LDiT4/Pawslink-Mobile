import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class AsyncGenericLoader<T> extends StatefulWidget {
  final Future<OperationResponse<T>> Function() asyncFunction;

  const AsyncGenericLoader({
    super.key,
    required this.asyncFunction,
  });

  @override
  State<AsyncGenericLoader<T>> createState() => _AsyncGenericLoaderState<T>();
}

class _AsyncGenericLoaderState<T> extends State<AsyncGenericLoader<T>>
    with SingleTickerProviderStateMixin {
  late Future<OperationResponse<T>> _dataLoader;
  late AnimationController _successController;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<OperationResponse<T>>(
          future: _dataLoader,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              _updateStatusSafely(WidgetStatus.loading);
              return Lottie.asset(TLottie.walkingDog);
            } else if (snapshot.hasError) {
              _updateStatusSafely(WidgetStatus.error);
              return Center(
                child: Lottie.asset(TLottie.errorCat),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
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
        ),
        if (_status != WidgetStatus.loading) _buildActionButtons(),
      ],
    );
  }

  Widget _buildActionButtons() {
    if (_status == WidgetStatus.error) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Retry"),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text("Summary"),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Home"),
        ),
      ],
    );
  }
}
