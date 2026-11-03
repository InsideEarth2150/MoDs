Add-Type -TypeDefinition '
using System;
using System.Diagnostics;
public class Runner {
    public static void Launch(string path) {
        Process.Start(path);
    }
}'
[Runner]::C:\temp\OPX\Beta II\opxbeta2ls.exe
pause