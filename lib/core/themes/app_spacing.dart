class AppSpacing {
  final double screenWidth;
  final double screenHeight;
  const AppSpacing({required this.screenHeight, required this.screenWidth});

  double mdDivider() {
    return screenHeight * 0.03;
  }

  double lgDivider() {
    return screenHeight * 0.155;
  }

  double smDivider() {
    return screenHeight * 0.018;
  }

  double paddingInline() {
    return screenWidth * 0.07;
  }

  double centerSpacing() {
    return screenHeight * 0.035;
  }

  double paddingInlineMd() {
    return screenWidth * 0.03;
  }

  paddingInlineSm() {
    return screenWidth * 0.02;
  }

  double paddingInlineLg() {
    return screenWidth * 0.04;
  }

  double paddingInlineXl() {
    return screenWidth * 0.05;
  }

  double paddingInline2xl() {
    return screenWidth * 0.06;
  }

  double paddingBlockSm() {
    return screenHeight * 0.01;
  }

  double paddingBlockMd() {
    return screenHeight * 0.02;
  }

  double paddingBlockLg() {
    return screenHeight * 0.03;
  }

  double paddingBlockXl() {
    return screenHeight * 0.04;
  }

  double paddingBlock2Xl() {
    return screenHeight * 0.05;
  }
}
