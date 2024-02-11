param($network, $server)

$baseIP = $network -replace '/24$', ''
$ipRange = 1..254

foreach ($i in $ipRange) {
    $ip = "$baseIP.$i"
    Resolve-DnsName -Name $ip -Server $server -ErrorAction Ignore | 
    ForEach-Object {
        "$ip - $($_.NameHost)"
    }
}
