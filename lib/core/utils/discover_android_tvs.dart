import 'dart:async';

import 'package:multicast_dns/multicast_dns.dart';

import '../services/models/discovered_tv_list.dart';

Future<List<DiscoveredTvList>> discoverAndroidTVs(
    ) async {
  final client = MDnsClient();
  await client.start();
  List<DiscoveredTvList> data = [];

  try {
    await for (final PtrResourceRecord ptr
    in client
        .lookup<PtrResourceRecord>(
      ResourceRecordQuery.serverPointer('_androidtvremote2._tcp.local'),
    )
        .timeout(Duration(seconds: 10))) {
      // print('📺 Found PTR: ${ptr.domainName}');
      // print('🌐 Target: ${ptr.domainName.split(".").first}');
      final String friendlyName = ptr.domainName.split(".").first;


      // Resolve SRV
      await for (final SrvResourceRecord srv
      in client
          .lookup<SrvResourceRecord>(
        ResourceRecordQuery.service(ptr.domainName),
      )
          .timeout(Duration(seconds: 5))) {
        // Get TXT records (might contain important info)
        await for (TxtResourceRecord txt
        in client
            .lookup<TxtResourceRecord>(
          ResourceRecordQuery.text(ptr.domainName),
        )
            .timeout(Duration(seconds: 5))) {
          print('📝 TXT Records: ${txt.text}');
        }

        // Get IPv4
        await for (final IPAddressResourceRecord ip
        in client
            .lookup<IPAddressResourceRecord>(
          ResourceRecordQuery.addressIPv4(srv.target),
        )
            .timeout(Duration(seconds: 5))) {
          // await testPortConnection(ip.address.address, srv.port);
          // await connectViaTCP(ip.address.address, srv.port);

          data.add(
            DiscoveredTvList(
              friendlyName: friendlyName,
              host: ip.address.address,
              port: srv.port,
              scheme: "http",
              isConnected: false,
            ));

        }

        // // Try IPv6 too
        // try {
        //   await for (final IPAddressResourceRecord ip
        //   in client
        //       .lookup<IPAddressResourceRecord>(
        //     ResourceRecordQuery.addressIPv6(srv.target),
        //   )
        //       .timeout(Duration(seconds: 2))) {
        //     print('🌐 IPv6: ${ip.address.address}');
        //   }
        // } catch (e) {
        //   print('⚠️  No IPv6');
        // }
      }
    }

  } catch (e) {
    print('❌ Error: $e');
  } finally {

    client.stop();
  }
  return data;
}