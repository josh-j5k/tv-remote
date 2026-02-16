class AppTextStyles {
  final double screenWidth;
  final double screenHeight;
  const AppTextStyles({required this.screenHeight, required this.screenWidth});
  double title() {
    return screenWidth * 0.035;
  }

  double fontSizeMd() {
    return screenWidth * 0.03;
  }

  double fontSizeSm() {
    return screenWidth * 0.025;
  }

  double fontSizeXs() {
    return screenWidth * 0.02;
  }

  double fontSizeLg() {
    if (screenWidth <= 370) {
      return screenWidth * 0.04;
    }
    return screenWidth * 0.045;
  }

  double fontSizeXl() {
    if (screenWidth <= 370) {
      return screenWidth * 0.05;
    }
    return screenWidth * 0.055;
  }

  double fontSize2xl() {
    if (screenWidth <= 370) {
      return screenWidth * 0.06;
    }
    return screenWidth * 0.065;
  }
}
