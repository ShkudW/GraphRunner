param(
    [Parameter(Mandatory = $true)]
    [string]$FolderPath,

    [Parameter(Mandatory = $true)]
    [string]$SearchTerm
)

if (!(Test-Path $FolderPath)) {
    Write-Error "Didn't finf the Folder: $FolderPath"
    exit
}


$Pattern = "\b$([regex]::Escape($SearchTerm))\b"


Get-ChildItem -Path $FolderPath -Filter *.txt | ForEach-Object {
    $FileName = $_.Name
    $FilePath = $_.FullName
    $Lines = Get-Content -Path $FilePath -ReadCount 0

    for ($i = 0; $i -lt $Lines.Length; $i++) {
        $Line = $Lines[$i]

        if ($Line -match $Pattern) {
            $Index = $Line.IndexOf($SearchTerm)

            if ($Index -ge 0) {
                $LengthToShow = [Math]::Min(50, $Line.Length - $Index)
                $Snippet = $Line.Substring($Index, $LengthToShow)

                
                Write-Host "[$FileName]" -ForegroundColor Cyan -NoNewline
                Write-Host " $Snippet"
            }
        }
    }
}
