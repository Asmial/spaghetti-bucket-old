$directory = [System.IO.Path]::Combine([Environment]::GetFolderPath('startmenu'), 'Programs', 'Scoop Apps')
if ($global) {
    $directory = [System.IO.Path]::Combine([Environment]::GetFolderPath('commonstartmenu'), 'Programs', 'Scoop Apps')
}
(scoop info whatsapp | Select-String Version: -NoEmphasis | Out-String) -match '([\d\.]+)' > $null
$version = $Matches.0
$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut("$directory\\Whatsapp.lnk")
$shortcut.TargetPath = $shortcut.TargetPath -replace '(.*)\\current\\whatsapp.exe', "`$1\$version\whatsapp.exe"
$shortcut.Save()

shim $shortcut.TargetPath $false whatsapp (substitute $arg @{ '$dir' = $dir; '$original_dir' = $original_dir; '$persist_dir' = $persist_dir})