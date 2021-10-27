import haxe.io.Bytes;

@:expose
class HexViewer {

    static function printBytes(bytes:Bytes) {
        Printer.print(bytes);
    }

    static function main() {
        #if sys
        final path = "test.bite";
        final bytes = sys.io.File.getBytes(path);
        printBytes(bytes);
        #end
    }
}
