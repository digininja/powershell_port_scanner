# To use:
# Import-Module scanner.ps1

# Usage:
# Test-Port digi.ninja 443 1000
# 
# Checks digi.ninja port 443 and with a 1000ms (1 second) timeout.
# Port is optional, defaults to 80.
# Timeout is optional, defaults to 1 second.

function Test-Port
{
    Param([string]$ComputerName,$port = 80,$timeout = 1000)
 
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
