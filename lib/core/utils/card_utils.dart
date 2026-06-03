class CardUtils {
  static String detectBrand(String number) {
    if (number.startsWith('4')) {
      return 'Visa';
    }

    if (number.startsWith('5')) {
      return 'Mastercard';
    }

    return 'Card';
  }

  static String last4(String number) {
    return number.substring(number.length - 4);
  }
}
