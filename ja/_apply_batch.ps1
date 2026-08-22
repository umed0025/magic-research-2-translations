param(
  [Parameter(Mandatory=$true)][string]$MappingFile
)

function Convert-ToJsonString {
  param([string]$s)
  $escaped = $s | ConvertTo-Json -Compress
  # ConvertTo-Json wraps in quotes; strip outer quotes
  $escaped = $escaped.Substring(1, $escaped.Length - 2)
  # decode \uXXXX back to literal characters (keep JSON-required escapes like \" \\ \n intact)
  $decoded = [regex]::Replace($escaped, '\\u([0-9a-fA-F]{4})', {
    param($m)
    [char]([Convert]::ToInt32($m.Groups[1].Value, 16))
  })
  return $decoded
}

$path = "ja/translations.json"
$content = Get-Content -Raw $path -Encoding UTF8
$map = Get-Content -Raw $MappingFile -Encoding UTF8 | ConvertFrom-Json -AsHashtable

$notFound = @()
$applied = 0
foreach ($key in $map.Keys) {
  $keyEsc = Convert-ToJsonString $key
  $newValEsc = Convert-ToJsonString $map[$key]
  $old = "`"$keyEsc`": `"$keyEsc`","
  $new = "`"$keyEsc`": `"$newValEsc`","
  if ($content.Contains($old)) {
    $content = $content.Replace($old, $new)
    $applied++
  } else {
    $notFound += $key
  }
}

if ($notFound.Count -gt 0) {
  Write-Output "NOT FOUND ($($notFound.Count)):"
  foreach ($n in $notFound) { Write-Output "  $n" }
} else {
  Write-Output "ALL $applied ENTRIES APPLIED OK"
}

[System.IO.File]::WriteAllText((Resolve-Path $path), $content, (New-Object System.Text.UTF8Encoding $false))
