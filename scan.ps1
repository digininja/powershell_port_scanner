# To use the scanner module, import-module scanner.ps1
# That can be used on its own:
# Test-Port digi.ninja 443 1000
# Check digi.ninja port 443 and with a 1000ms (1second) timeout

# To capture the output, can use Tee-Object
# .\scan.ps1 | Tee-Object grabbed

$ports=(21,22,23,80,443,445,3389)

1..254 | % {
    $ip = "192.168.0.$_"
    
    echo "------";
    echo "$ip";
    foreach ($port in $ports) {
        # This uses the built in stuff
        # echo ((new-object Net.Sockets.TcpClient).Connect($ip,$port)) "Port $port is open!"

        # This uses the scanner module
        $check = Test-Port $ip $port
        if ($check -eq "True") {"Port $port is open!"}
    } 2>$null
}
