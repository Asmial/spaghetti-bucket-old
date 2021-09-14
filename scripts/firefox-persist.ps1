New-Item -Path "$env:APPDATA\Mozilla" -ItemType Directory -ErrorAction Ignore 
New-Item -Path "$env:APPDATA\Mozilla\Firefox" -ItemType Directory -ErrorAction Ignore
if(!(Test-Path "$persist_dir\Mozilla\Firefox")){
    Move-Item -Path "$env:APPDATA\Mozilla\Firefox" -Destination "$persist_dir\Mozilla"  -Force  | out-null
}
& "$env:COMSPEC" /c mklink /j "$env:APPDATA\Mozilla\Firefox" "$persist_dir\Mozilla\Firefox" | out-null