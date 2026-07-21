[PSCustomObject]@{
    HostName = $env:COMPUTERNAME
    Serial   = (Get-CimInstance Win32_BIOS).SerialNumber
    Model    = (Get-CimInstance Win32_ComputerSystem).Model
    CPU      = (Get-CimInstance Win32_Processor).Name.Trim()
    GPU      = ((Get-CimInstance Win32_VideoController).Name) -join ', '
    RAM      = "$([math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)) GB"
    Storage  = "$([math]::Round((Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'").Size / 1GB)) GB"
    OS       = (Get-CimInstance Win32_OperatingSystem).Caption
} | Format-List
