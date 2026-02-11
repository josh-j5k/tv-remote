import 'package:multicast_dns/multicast_dns.dart';

Future<void> discoverAndroidTVs() async {
  final client = MDnsClient();
  await client.start();

  try {
    await for (final PtrResourceRecord ptr
        in client
            .lookup<PtrResourceRecord>(
              ResourceRecordQuery.serverPointer('_androidtvremote2._tcp.local'),
            )
            .timeout(Duration(seconds: 10))) {
      print('📺 Found PTR: ${ptr.domainName}');

      // Resolve SRV
      await for (final SrvResourceRecord srv
          in client
              .lookup<SrvResourceRecord>(
                ResourceRecordQuery.service(ptr.domainName),
              )
              .timeout(Duration(seconds: 5))) {
        // Get TXT records (might contain important info)
        await for (final TxtResourceRecord txt
            in client
                .lookup<TxtResourceRecord>(
                  ResourceRecordQuery.text(ptr.domainName),
                )
                .timeout(Duration(seconds: 5))) {
          print('📝 TXT Records:');
          // for (var entry in txt.texts) {
          //   print('   $entry');
          // }
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

          print('🌐 IPv4: ${ip.address.address}');
        }

        // Try IPv6 too
        try {
          await for (final IPAddressResourceRecord ip
              in client
                  .lookup<IPAddressResourceRecord>(
                    ResourceRecordQuery.addressIPv6(srv.target),
                  )
                  .timeout(Duration(seconds: 2))) {
            print('🌐 IPv6: ${ip.address.address}');
          }
        } catch (e) {
          print('⚠️  No IPv6');
        }
      }
    }
  } catch (e) {
    print('❌ Error: $e');
  } finally {
    client.stop();
  }
}
