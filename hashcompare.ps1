# James P. Sheridan
# http://sheridan-tech.com
# Hash Compare

# Prompt user for hash algorithm
$algo = Read-Host -Prompt "[1] SHA1`n[2] SHA256`n[3] SHA384`n[4] SHA512`n[5] MD5`n"
switch ($algo)
{
    1 {$algorithm = "SHA1"}
    2 {$algorithm = "SHA256"}
    3 {$algorithm = "SHA384"}
    4 {$algorithm = "SHA512"}
    5 {$algorithm = "MD5"}
}

$file = Read-Host -Prompt "`nInput your file path" 
$hash = Read-Host -Prompt 'Input your hash'
$hash = $hash.ToUpper()

$fileHash = Get-FileHash -Path $file -Algorithm $algorithm
# Print the Calculated hash
Write-Output "`n"$fileHash.Hash

# Compare the hashes and print the results
if ($fileHash.Hash -eq $hash) {
	Write-Host $hash"`nHash Comparison results: TRUE`n" -ForegroundColor Green
} 
else {
	Write-Host $hash"`nHash Comparison results: FALSE`n" -ForegroundColor Red
}
