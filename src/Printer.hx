import haxe.io.BytesInput;
import haxe.io.Bytes;

function print(bytes:Bytes) {
    Console.logPrefix = "";

    final output = new BytesInput(bytes);

    Console.log("<b>Offset    00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F  Decoded text</b>");
    while (output.position < output.length) {
        final line = new StringBuf();
        line.add(StringTools.lpad(StringTools.hex(output.position), "0", 8));
        line.add("  ");

        final decodedText = new StringBuf();
        for (_ in 0...16) {
            if (output.position < output.length) {
                final b = output.readByte();
                if (b >= 32 && b <= 126) { // Check if char is printable ASCII
                    decodedText.add(String.fromCharCode(b));
                } else {
                    decodedText.add(".");
                }
                line.add(StringTools.lpad(StringTools.hex(b), "0", 2));
                line.add(" ");
            } else {
                line.add("   ");
            }
        }
        line.add(" ");
        line.add(decodedText);
        Console.log(line.toString());
    }
}