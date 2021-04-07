# PowerShell Scanner

A port scanner written in PowerShell

Looping is based on SANS script

<https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/>

Scanner is based on these:

<https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/testing-a-network-port>

<https://copdips.com/2019/09/fast-tcp-port-check-in-powershell.html>

## Usage

To use the scanner module:

```ps
Import-Module scanner.ps1
```

That can be used on its own:

```ps
Test-Port hb1.digi.ninja 443 1000
```

Check hb1.digi.ninja port 443 and with a 1000ms (1second) timeout. The timeout parameter is optional.
