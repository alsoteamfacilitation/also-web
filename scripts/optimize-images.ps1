$ErrorActionPreference = 'Stop'

$root = 'c:\Users\c.baldassarre\Accenture\Happy ) Agile-Agile Lab - ALSO - ALSO - Chi siamo'
$targets = @(
    (Join-Path $root 'facilitatori-foto'),
    (Join-Path $root 'images\Allianz'),
    (Join-Path $root 'images\Poste'),
    (Join-Path $root 'images\Alumni'),
    (Join-Path $root 'images\S&C Automotive')
)

$files = foreach ($d in $targets) {
    Get-ChildItem -LiteralPath $d -File -Include *.jpg,*.jpeg,*.png
}
$before = [math]::Round((($files | Measure-Object Length -Sum).Sum / 1MB), 2)

$backupRoot = Join-Path $root ("backup-images-" + (Get-Date -Format 'yyyyMMdd-HHmmss'))
New-Item -ItemType Directory -Path $backupRoot | Out-Null

foreach ($d in $targets) {
    $rel = $d.Substring($root.Length).TrimStart('\\')
    $dest = Join-Path $backupRoot $rel
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    Get-ChildItem -LiteralPath $d -File | Copy-Item -Destination $dest -Force
}

Add-Type -AssemblyName System.Drawing
$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$qualityEncoder = [System.Drawing.Imaging.Encoder]::Quality

function Get-ResizedDimensions {
    param(
        [int]$Width,
        [int]$Height,
        [int]$MaxWidth,
        [int]$MaxHeight
    )

    $ratio = [Math]::Min($MaxWidth / $Width, $MaxHeight / $Height)
    if ($ratio -ge 1) {
        return @($Width, $Height)
    }

    return @(
        [int][Math]::Round($Width * $ratio),
        [int][Math]::Round($Height * $ratio)
    )
}

foreach ($f in $files) {
    $img = $null
    $bmp = $null
    $gfx = $null
    $encParams = $null
    try {
        $img = [System.Drawing.Image]::FromFile($f.FullName)

        # Applica orientamento EXIF (tag 0x0112) prima del resize,
        # così le foto portrait non vengono salvate ruotate di 90°.
        $orientationPropertyId = 0x0112
        if ($img.PropertyIdList -contains $orientationPropertyId) {
            $orientationValue = $img.GetPropertyItem($orientationPropertyId).Value[0]
            switch ($orientationValue) {
                3 { $img.RotateFlip([System.Drawing.RotateFlipType]::Rotate180FlipNone) }
                6 { $img.RotateFlip([System.Drawing.RotateFlipType]::Rotate90FlipNone) }
                8 { $img.RotateFlip([System.Drawing.RotateFlipType]::Rotate270FlipNone) }
            }
            $img.RemovePropertyItem($orientationPropertyId)
        }

        $isFacilitator = $f.FullName -like '*facilitatori-foto*'

        if ($isFacilitator) {
            $maxW = 720
            $maxH = 900
            $quality = 75
        } else {
            $maxW = 1600
            $maxH = 1600
            $quality = 70
        }

        $dims = Get-ResizedDimensions -Width $img.Width -Height $img.Height -MaxWidth $maxW -MaxHeight $maxH
        $newW = $dims[0]
        $newH = $dims[1]
        $tempFile = [System.IO.Path]::Combine($f.DirectoryName, ([System.IO.Path]::GetRandomFileName() + '.tmp'))

        $bmp = New-Object System.Drawing.Bitmap($newW, $newH)
        $gfx = [System.Drawing.Graphics]::FromImage($bmp)
        $gfx.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $gfx.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $gfx.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $gfx.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
        $gfx.DrawImage($img, 0, 0, $newW, $newH)

        if ($f.Extension.ToLowerInvariant() -eq '.png') {
            $bmp.Save($tempFile, [System.Drawing.Imaging.ImageFormat]::Png)
        } else {
            $encParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
            $encParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter($qualityEncoder, [long]$quality)
            $bmp.Save($tempFile, $jpegCodec, $encParams)
        }

        if ($gfx) { $gfx.Dispose() }
        if ($bmp) { $bmp.Dispose() }
        if ($img) { $img.Dispose() }

        Move-Item -LiteralPath $tempFile -Destination $f.FullName -Force
    }
    catch {
        Write-Host "Errore su $($f.FullName): $($_.Exception.Message)"
    }
    finally {
        if ($gfx) { $gfx.Dispose() }
        if ($bmp) { $bmp.Dispose() }
        if ($img) { $img.Dispose() }
    }
}

$afterFiles = foreach ($d in $targets) {
    Get-ChildItem -LiteralPath $d -File -Include *.jpg,*.jpeg,*.png
}
$after = [math]::Round((($afterFiles | Measure-Object Length -Sum).Sum / 1MB), 2)
$delta = [math]::Round($before - $after, 2)

Write-Host "Backup: $backupRoot"
Write-Host "Prima: $before MB"
Write-Host "Dopo:  $after MB"
Write-Host "Riduzione: $delta MB"
