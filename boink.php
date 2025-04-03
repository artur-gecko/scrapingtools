$URLs = 'http://www.sitetocheck.com','http://www.othersitetocheck.com','http://somethingelse.com'

$HEADERS = @{ 'Content-Type' = "application/json" }
$GOOGLE_API_KEY='[API Key]'
$Uri = 'https://safebrowsing.googleapis.com/v4/threatMatches:find?key='+ $GOOGLE_API_KEY

foreach($URL in $URLs) {
    $BODY = @([pscustomobject]@{"client" = @{"clientId" = "company"; "clientVersion" = "1.0"}; "threatInfo" = @{"threatTypes" = "MALWARE","SOCIAL_ENGINEERING","THREAT_TYPE_UNSPECIFIED","UNWANTED_SOFTWARE","POTENTIALLY_HARMFUL_APPLICATION"; "platformTypes" = "ANY_PLATFORM"; "threatEntryTypes" = "URL"; "threatEntries" = @{"url" = $URL}}})
    $JSONBODY = $BODY | ConvertTo-Json
    Invoke-RestMethod -Method 'POST' -Uri $Uri -Body $JSONBODY -Headers $HEADERS
}
