﻿$ErrorActionPreference = 'Stop'
$packageName    = 'wsl-debiangnulinux'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://aka.ms/wsl-debian-gnulinux'
$checksum       = '02CC1CE48E2FC21331B6FAA2AF44F22FBB9E9C219EAF74202970164BE6E3D3D8'
$unzipLocation  = "$toolsDir\unzipped"

New-Item $unzipLocation -type directory | out-null

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $unzipLocation
  fileType       = 'ZIP' 
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Set-Location -Path $unzipLocation
debian.exe install
wslconfig /list