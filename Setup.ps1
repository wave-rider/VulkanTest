$url = "https://github.com/glfw/glfw/releases/download/3.3.2/glfw-3.3.2.bin.WIN64.zip"
$output = "lib\glfw-3.3.2.bin.WIN64.zip"
$start_time = Get-Date
if ((Test-Path "lib") -eq $false)
{
   New-Item -ItemType Directory -Force -Path 'lib'
}

if ((Test-Path $output) -eq $false)
{ 
  Invoke-WebRequest -Uri $url -OutFile $output
}
else {
   Write-Host "glfw is installed"
}

if ((Test-Path "lib\glfw-3.3.2.bin.WIN64") -eq $false)
{
   Expand-Archive -LiteralPath $output -DestinationPath "lib"
}

$url = "https://github.com/g-truc/glm/releases/download/0.9.8.5/glm-0.9.8.5.zip"
$output = "lib\glm-0.9.8.5.zip"
if ((Test-Path $output) -eq $false)
{ 
  Invoke-WebRequest -Uri $url -OutFile $output
}
else {
   Write-Host "glm is installed"
}

if ((Test-Path "lib\glm") -eq $false)
{
   Expand-Archive -LiteralPath $output -DestinationPath "lib"
}

$vulkanPath = Get-ChildItem -Path "C:\VulkanSDK"  | sort LastWriteTime | select -last 1
if ($vulkanPath -And  (Test-Path $vulkanPath.FullName))
{
   $currentLocation = Get-Location
   $vcprojLocation = Join-Path -Path $currentLocation -ChildPath "VulkanTest\VulkanTest.vcxproj"
   Write-Host "Project is located at " $vcprojLocation
   Write-Host "SDK location "$vulkanPath.FullName
   ((Get-Content -path $vcprojLocation) -replace "C:\\VulkanSDK\\([\.0-9]{1,})", $vulkanPath.FullName) | Set-Content -Path $vcprojLocation
   Write-Host "Vulkan is installed into " $vulkanPath
   Set-Location -Path "VulkanTest\shaders"
   .\compile.bat
   
   
}
else {
   Write-Host "Install vulkan from https://vulkan.lunarg.com/sdk/home#windows"
}


Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"