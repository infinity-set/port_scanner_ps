# Function to display open ports
function Show-OpenPorts {
    param (
        [array]$open_ports
    )

    Write-Host "Open Ports:"
    if ($open_ports.Count -eq 0) {
        Write-Host "None"
    } else {
        foreach ($port in $open_ports) {
            Write-Host $port
        }
    }
}

# Define a function to create a scan report file.
function Create-ScanReport {
    param (
        [string]$target,
        [int]$startingPort,
        [int]$endingPort
    )

    # Get the current date and time
    $current_date = Get-Date 

    # Define the filename based on the target
    $filename = "portscan_${target}.txt"

    # Get the current directory
    $current_directory = Get-Location

    # Combine the current directory and filename to create the file path
    $FilePath = Join-Path -Path $current_directory -ChildPath $filename

    # Create an empty file at the specified path
    Out-File $FilePath

    # Check if the file was successfully created
    if (Test-Path -Path $FilePath -PathType Leaf) {
        # Display information about the report file
        Write-Host ""
        Write-Host "Report file path:"
        $content = @"
Date/Time: $current_date
Scanned Port(s): $startingPort - $endingPort
Hostname/IP: $target

Open Ports:
"@
        Add-Content -Path $FilePath -Value $content
        return $FilePath
    } else {
        Write-Host "The file '$FilePath' does not exist."
    }
}

# Function to test a range of ports on a target
function Test-PortRange {
    param (
        [string]$target,
        [int]$startingPort,
        [int]$endingPort
    )

    # Initialize an array to store open ports
    $open_ports = @()

    # Call the Create-ScanReport function and capture the result (file path) in a variable.
    Create-ScanReport -target $target -startingPort $startingPort -endingPort $endingPort

    # Display a message to indicate that the port scan is in progress.
    Write-Host ""  
    Write-Host "Port Scan in progress for '$target', please wait..."
    Write-Host ""  
    
    # Check if the target can be reached before conducting the port scan.
    if (Test-Connection -ComputerName $target -Count 1 -Quiet) {
        for ($port = $startingPort; $port -le $endingPort; $port++) {
            $tcpClient = New-Object System.Net.Sockets.TcpClient
            Write-Host "Attempting port $port..."  # Display the port being checked.

            # Define FilePath here
            $filename = "portscan_${target}.txt"
            $current_directory = Get-Location
            $FilePath = Join-Path -Path $current_directory -ChildPath $filename

            # Try to establish a connection to the target IP and port.
            try {
                $tcpClient.Connect($target, $port)
            
                # If a connection is established (port is open), close the connection and display a message.
                if ($tcpClient.Connected) {
                    $tcpClient.Close()

                    Write-Host "***********"
                    Write-Host "Port: $port - Open" -BackgroundColor Black -ForegroundColor Green  # Indicate that the port is open.
                    Write-Host "***********"
                    $filename = "portscan_${target}.txt"
                    $current_directory = Get-Location
                    $FilePath = Join-Path -Path $current_directory -ChildPath $filename
                    $open_ports += $port

                    if ($FilePath) {
                        Add-Content -Path $FilePath -Value "$port" 
                    } 
                }       
            } catch {
                # Ignore any connection errors.
            }
        }
    
        Write-Host ""
        Write-Host "Port scan complete!"  # Indicate that the port scan is finished.
        Write-Host "" 
        Show-OpenPorts -open_ports $open_ports

    } else {
        Write-Host "The address '$target' is invalid or unreachable."
        Write-Host "Exiting..."
        exit
    }  
    if ($FilePath) {
        Write-Host ""
        Write-Host "View saved report file at: '$FilePath"
        Write-Host ""
    }
}

# Define the target IP address.
Write-Host "" 
$target = Read-Host "Enter a website or IP Address of the target"

# Prompt the user to enter a positive starting port number.
$startingPort = -1  # Initialize with an invalid value.
while ($startingPort -lt 0) {
    Write-Host "" 
    $startingPort = Read-Host "Enter a positive starting port number"

    # Check if the input is not empty and consists of digits only.
    if (-not [string]::IsNullOrEmpty($startingPort) -and $startingPort -match '^\d+$') {
        $startingPort = [int]$startingPort  # Convert the input to an integer.
    } else {
        Write-Host "" 
        Write-Host "Invalid input. Please enter a positive integer."
        $startingPort = -1  # Set to an invalid value to continue the loop.
    }
}

# Prompt the user to enter a positive ending port number greater than the starting port.
$endingPort = -1  # Initialize with an invalid value.
while ($endingPort -lt $startingPort) {
    Write-Host "" 
    $endingPort = Read-Host "Enter a positive ending port number and greater than or equal to port $startingPort"

    # Check if the input is not empty and consists of digits only.
    if (-not [string]::IsNullOrEmpty($endingPort) -and $endingPort -match '^\d+$') {
        $endingPort = [int]$endingPort  # Convert the input to an integer.
    } else {
        Write-Host "" 
        Write-Host "Invalid input. Please enter a positive integer."
        $endingPort = -1  # Set to an invalid value to continue the loop.
    }
}

while ($true) {
    Write-Host ""
    Write-Host "Conduct port scan on '$target', port(s) $startingPort - $endingPort"
    $input = Read-Host "Confirm: (Y) Yes or (N) No"
    switch ($input){
        "Y" {
        Test-PortRange -target $target -startingPort $startingPort -endingPort $endingPort
        exit
        } 
        "N" {
        exit
        }
        default {
        Write-Host ""
        Write-Host "Please type 'Y' for YES or 'N' for NO"
        } 
    }
}
