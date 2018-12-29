﻿Add-Type -assembly "system.io.compression.filesystem"
$url = "https://github.com/glfw/glfw/releases/download/3.2.1/glfw-3.2.1.bin.WIN64.zip"
$output = "lib\glfw-3.2.1.bin.WIN64.zip"
$start_time = Get-Date
if ((Test-Path "lib") -eq $false)
{
   New-Item -ItemType Directory -Force -Path 'lib'
}

if ((Test-Path $output) -eq $false)
{ 
  Invoke-WebRequest -Uri $url -OutFile $output
}

if ((Test-Path "lib\glfw-3.2.1.bin.WIN64") -eq $false)
{
	[io.compression.zipfile]::ExtractToDirectory($output, "lib")
}

$url = "https://github.com/g-truc/glm/releases/download/0.9.8.5/glm-0.9.8.5.zip"
$output = "lib\glm-0.9.8.5.zip"
if ((Test-Path $output) -eq $false)
{ 
  Invoke-WebRequest -Uri $url -OutFile $output
}

if ((Test-Path "lib\glm") -eq $false)
{
	[io.compression.zipfile]::ExtractToDirectory($output, "lib")
}

Set-Location -Path "VulkanTest\shaders"
.\compile.bat

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
