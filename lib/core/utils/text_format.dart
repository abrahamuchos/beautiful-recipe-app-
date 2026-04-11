class TextFormat {

  /// Truncate text
  static String truncate(String text, int maxLen, {String symbol = '...'}) {
    if(text.length <= maxLen) return text;
    return text.substring(0, maxLen) + symbol;
  }

}
