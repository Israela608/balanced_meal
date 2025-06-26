import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingStack extends StatelessWidget {
  const LoadingStack({
    super.key,
    required this.loadingProvider,
    required this.child,
    this.color,
    this.progressIndicator = const Center(
      child: CustomLoader(
        color: AppColor.primary,
        size: 40,
      ),
    ),
    this.opacity = 0.5,
  });

  final ProviderListenable<bool> loadingProvider;
  final Color? color;
  final Widget progressIndicator;
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Consumer(
            builder: (context, ref, child) {
              return Visibility(
                visible: ref.watch(loadingProvider),
                child: Container(
                  decoration: BoxDecoration(
                    color: (color ?? AppColor.ash).withValues(alpha: opacity),
                  ),
                  child: progressIndicator,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      duration: const Duration(milliseconds: 700),
      color: color ?? AppColor.white,
      size: size?.h ?? 50.h,
    );
  }
}
