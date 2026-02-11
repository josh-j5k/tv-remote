import 'dart:typed_data';

Uint8List encodeVarint(int value) {
  final bytes = <int>[];
  var v = value;
  do {
    var byte = v & 0x7F;
    v = v >>> 7;
    // If there are more bits left, set the Continuation Bit (MSB)
    if (v != 0) {
      byte |= 0x80;
    }

    bytes.add(byte);
  } while (v != 0);

  return Uint8List.fromList(bytes);
}
