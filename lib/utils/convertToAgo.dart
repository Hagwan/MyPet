// ignore_for_file: file_names

import 'package:timeago/timeago.dart' as timeago;

convertTimeToAgo(dateV) {
  timeago.setLocaleMessages('en_short', timeago.EnShortMessages());

  return timeago.format(DateTime.parse(dateV.toString()), locale: 'en_short');
}
