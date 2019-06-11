$names = Get-content "C:\local\names_in.txt"
Out-File -filepath C:\local\up.txt
Out-File -filepath C:\local\down.txt
$Total=0
$up=0
$down=0

foreach ($name in $names){
  Write-Host "Total = $Total      up = $up      down = $down" -ForegroundColor white
  "Total = $Total      up = $up      down = $down" | Out-File -filepath C:\local\total.txt
 $Total=$Total+1

  if (Test-Connection -ComputerName $name -Count 1 -ErrorAction SilentlyContinue){
    Write-Host "$name is up" -ForegroundColor Green
    "$name" | Out-File -filepath C:\local\up.txt -Append
    $up=$up+1
      }
  else{
    Write-Host "$name is down" -ForegroundColor Red
    "$name" | Out-File -filepath C:\local\down.txt -Append
    $down=$down+1
  }
 }
 Write-Host "Final Total = $Total      up = $up      down = $down" -ForegroundColor white
 " Final Total = $Total `r`n Up          = $up `r`n Down        = $down" | Out-File -filepath C:\local\total.txt
    "done" | Out-File -filepath C:\local\total.txt -Append
