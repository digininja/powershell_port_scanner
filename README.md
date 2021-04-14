# PowerShell Scanner

A port scanner written in PowerShell

Looping is based on SANS script

<https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/>

The scanner is based on these:

<https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/testing-a-network-port>

<https://copdips.com/2019/09/fast-tcp-port-check-in-powershell.html>

## Usage

To use the scanner module:

```ps
Import-Module scanner.ps1
```

That can be used on its own:

```ps
Test-Port digi.ninja 443 1000
```

Check digi.ninja port 443 and with a 1000ms (1second) timeout. The timeout parameter is optional.

## Pull Requests and Improvements

I'm not a PowerShell user so there could probably be a lot of improvements to all of this. The scan.ps1 script is deliberately verbose so that it is easy to tweek for different environments. If you want to submit any changes, keep this in mind. I've seen quite a few one-liners, especially in the SANS blog post. They are good, but look a lot like Perl to me, easy to understand if you know the language, not that easy if you don't.
