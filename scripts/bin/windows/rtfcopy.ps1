Add-Type -AssemblyName System.Windows.Forms;

$text = $input -join '`r`n';

$data = New-Object System.Windows.Forms.DataObject;
$data.SetData([System.Windows.Forms.DataFormats]::Text, $text);
$data.SetData([System.Windows.Forms.DataFormats]::Rtf, $text);
[System.Windows.Forms.Clipboard]::SetDataObject($data);

Write-Host "Copied!" -ForegroundColor Green;
