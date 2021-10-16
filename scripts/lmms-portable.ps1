if (Test-Path "$env:USERPROFILE\.lmmsrc.xml") {
  $lmmsrc = Get-Content -Path "$env:USERPROFILE\.lmmsrc.xml" | Out-String
  $lmmsrc = $lmmsrc -replace "gigdir=`"[^`"]*`"", "gigdir=`"$dir\persist\workdir\samples\gig\`""
  $lmmsrc = $lmmsrc -replace "sf2dir=`"[^`"]*`"", "sf2dir=`"$dir\persist\workdir\samples\soundfonts\`""
  $lmmsrc = $lmmsrc -replace "vstdir=`"[^`"]*`"", "vstdir=`"$dir\persist\VstPlugins\`""
  $lmmsrc = $lmmsrc -replace "laddir=`"[^`"]*`"", "laddir=`"$dir\persist\workdir\plugins\ladspa\`"" 
  $lmmsrc = $lmmsrc -replace "workingdir=`"[^`"]*`"", "workingdir=`"$dir\persist\workdir\`""
  $lmmsrc > "$env:USERPROFILE\.lmmsrc.xml"
}
else {
  "<?xml version=`"1.0`"?>
<!DOCTYPE lmms-config-file>
<lmms version=`"$version`">
  <paths gigdir=`"$dir\persist\workdir\samples\gig\`" sf2dir=`"$dir\persist\workdir\samples\soundfonts\`" vstdir=`"$dir\persist\VstPlugins\`" laddir=`"$dir\persist\workdir\plugins\ladspa\`" workingdir=`"$dir\persist\workdir\`"/>
</lmms>" > "$env:USERPROFILE\.lmmsrc.xml"
}