import "package:flutter/material.dart";
import "package:flutter/services.dart";

class MaterialTheme {
  final TextTheme textTheme = TextTheme();

  MaterialTheme();

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff46c6ae), // Color(0xfffcfcfc), //Color(0xffaac7ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff0a305f),
      primaryContainer: Color(0xff284777),
      onPrimaryContainer: Color(0xffd6e3ff),
      secondary: Color(0xffbec6dc),
      onSecondary: Color(0xff283141),
      secondaryContainer: Color(0xff3e4759),
      onSecondaryContainer: Color(0xffdae2f9),
      tertiary: Color(0xffddbce0),
      onTertiary: Color(0xff3f2844),
      tertiaryContainer: Color(0xff573e5c),
      onTertiaryContainer: Color(0xfffad8fd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff22202b), // Color(0xff808080),
      onSurface: Color(0xffe2e2e9),
      onSurfaceVariant: Color(0xffc4c6d0),
      outline: Color(0xff8e9099),
      outlineVariant: Color(0xff44474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff415f91),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff284777),
      secondaryFixed: Color(0xffdae2f9),
      onSecondaryFixed: Color(0xff131c2b),
      secondaryFixedDim: Color(0xffbec6dc),
      onSecondaryFixedVariant: Color(0xff3e4759),
      tertiaryFixed: Color(0xfffad8fd),
      onTertiaryFixed: Color(0xff28132e),
      tertiaryFixedDim: Color(0xffddbce0),
      onTertiaryFixedVariant: Color(0xff573e5c),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33353a),
    );
  }

  static AppBarTheme darkAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: colorScheme.primaryContainer,
        systemNavigationBarColor: Colors.black,
      ),
    );
  }

  ThemeData dark() {
    final colorScheme = darkScheme();
    final appBarTheme = darkAppBarTheme(colorScheme);
    return theme(colorScheme, appBarTheme);
  }

  ThemeData theme(ColorScheme colorScheme, AppBarTheme appBarTheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      appBarTheme: appBarTheme,
    );
  }
}