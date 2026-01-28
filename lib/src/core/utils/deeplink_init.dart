class ApplinkInit {
  static String init(String url) {
    String baseUrl = 'https://qr.sandyq.kz/';

    if (url.startsWith(baseUrl)) {
      int insertIndex = baseUrl.length;
      if (!url[insertIndex].contains('?')) {
        url = '${url.substring(0, insertIndex)}?${url.substring(insertIndex)}';
      }
      int firstQuestionMarkIndex = url.indexOf('?');
      String beforeFirstQuestionMark =
          url.substring(0, firstQuestionMarkIndex + 1);
      String afterFirstQuestionMark = url.substring(firstQuestionMarkIndex + 1);

      String updatedAfterFirst = afterFirstQuestionMark.replaceAll('?', '&');

      String updatedUrl = beforeFirstQuestionMark + updatedAfterFirst;
      return updatedUrl;
    } else {
      return "Invalid deeplink URL";
    }
  }
}
