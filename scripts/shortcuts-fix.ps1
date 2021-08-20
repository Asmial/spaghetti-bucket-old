@(arch_specific 'shortcuts' $manifest $arch) | Where-Object { $_ -ne $null } | ForEach-Object {
    $directory = shortcut_folder $global
    $target = (scoop prefix $app | Get-Item).Target
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut("$directory\\$($_.item(1)).lnk")
    $shortcut.TargetPath = "$target\$($_.item(0))"
    $shortcut.Save()
    shim $shortcut.TargetPath $false $name (substitute $arg @{ '$dir' = $dir; '$original_dir' = $original_dir; '$persist_dir' = $persist_dir })
}