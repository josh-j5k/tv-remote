import 'package:android_tv_remote/core/services/models/discovered_tv_list.dart';
import 'package:flutter/material.dart';

ValueNotifier<DiscoveredTvList> appDataNotifier = ValueNotifier(
  DiscoveredTvList(
    friendlyName: null,
    host: null,
    isConnected: false,
    scheme: null,
    port: null,
  ),
);
