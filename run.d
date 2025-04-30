import std.stdio;
import std.file;
import std.algorithm;
import std.random;
import std.process;
import std.path;
import core.sys.windows.windows;
extern (Windows)
int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    return run(); // или вызови свою функцию
}
int run() {
    string[] mp4Files;

    foreach (entry; dirEntries(".", SpanMode.shallow)) {
        if (entry.isFile && entry.name.extension == ".mp4") {
            mp4Files ~= entry.name;
        }
    }

    if (mp4Files.length == 0) {
        writeln("No MP4 files found.");
        return 1;
    }

    auto rnd = Random(unpredictableSeed);
    string randomFile = mp4Files.choice(rnd);


    executeShell(`start "" "` ~ randomFile ~ `"`);
    return 0;
}
