$json = get-content c:\temp\mfit_report.json

$array = $json | ConvertFrom-Json

$arraydetails = $array.vms.vmdetails

$data = @()

$a = 1
$b = $arraydetails.count

foreach ($item in $arraydetails){
    write-host "working on $a of $b" -ForegroundColor yellow
    
    $vmname = @()
    $OperatingSystem = @()
    $RecommendedJourney = @()
    $appContainerizationPrivatePreviewOffering = @()
    $workloads = @()

    $vmname = $item.name
    $OperatingSystem = $item.os
    $RecommendedJourney = $item.recommendedJourney
    $appContainerizationPrivatePreviewOffering = $item.appContainerizationPrivatePreviewOffering

    $workloads = $item.Workloads
    foreach ($workload in $workloads){
        $workloadname = @()
        $WorkloadRunning = @()
        $installPath = @()

        $workloadname = $workload.name
        $WorkloadRunning = $workload.isrunning
        $installPath = $workload.installPath

        #Build Export Report
        $row = New-Object PSObject
        $row | Add-Member -MemberType NoteProperty -Name "Workload" -Value $workloadname
        $row | Add-Member -MemberType NoteProperty -Name "WorkloadRunning" -Value $WorkloadRunning
        $row | Add-Member -MemberType NoteProperty -Name "installPath" -Value $installPath
        $row | Add-Member -MemberType NoteProperty -Name "VMName" -Value $VMName
        $row | Add-Member -MemberType NoteProperty -Name "OperatingSystem" -Value $OperatingSystem
        $row | Add-Member -MemberType NoteProperty -Name "RecommendedJourney" -Value $RecommendedJourney
        $row | Add-Member -MemberType NoteProperty -Name "appContainerizationPrivatePreviewOffering" -Value $appContainerizationPrivatePreviewOffering
        $data += $row

    }
    $a++

}

$data | export-csv -NoTypeInformation c:\temp\mfit_workloads.csv
