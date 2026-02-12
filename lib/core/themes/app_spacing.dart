class AppSpacing {
  final double screenWidth;
  final double screenHeight;
  const AppSpacing({required this.screenHeight, required this.screenWidth});

  double mdDivider() {
    return screenHeight * 0.029;
  }

  double lgDivider() {
    return screenHeight * 0.035;
  }

  double smDivider() {
    return screenHeight * 0.018;
  }

  double paddingInline() {
    return screenWidth * 0.07;
  }

  double centerSpacing() {
    return 35.0;
  }
}
