
import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/icomoon_icons.dart';

IconData icon(String value) {
  switch (value) {
    case 'file_copy':
      return Icomoon.filled_copy;
    case 'download_for_offline':
      return Icomoon.download_down;
    case 'bulb':
      return Icomoon.bulb;
    case 'back_arrow':
      return Icomoon.back_arrow;
    case 'keyboard_content':
      return Icomoon.keyboard_content;
    case 'google_grey':
      return Icomoon.google_grey;
    default:
      return Icons.chevron_left;
  }
}