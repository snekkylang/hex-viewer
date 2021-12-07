import haxe.io.Bytes;

@:expose
class HexViewer {

    static function printBytes(bytes:Bytes) {
        Printer.print(bytes);
    }

    static function main() {
        #if sys
        #if eval
        final path = "test.bite";
        #else
        final args = Sys.args();

        if (args.length < 1) {
            Sys.println("Usage: hexviewer <file>");
            Sys.exit(1);
        }

        final path = args[0];
        #end

        final bytes = sys.io.File.getBytes(path);
        printBytes(bytes);
        #end
    }
}
