# To use the scanner module, import-module scanner.ps1
# That can be used on its own:
# Test-Port hb1.digi.ninja 443 1000
# Check hb1.digi.ninja port 443 and with a 1000ms (1second) timeout

function Test-Port
{
    Param([string]$ComputerName,$port = 5985,$timeout = 1000)
 
    try
    {
        $tcpclient = New-Object -TypeName system.Net.Sockets.TcpClient
        $iar = $tcpclient.BeginConnect($ComputerName,$port,$null,$null)
        $wait = $iar.AsyncWaitHandle.WaitOne($timeout,$false)
        if(!$wait)
        {
            $tcpclient.Close()
            return $false
        }
        else
        {
            # Close the connection and report the error if there is one
            
            $null = $tcpclient.EndConnect($iar)
            $tcpclient.Close()
            return $true
        }
    }
    catch 
    {
        $false 
    }
}