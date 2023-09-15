# PowerShell Port Scanner

## Overview

Welcome to the PowerShell Port Scanner. This PowerShell script is designed to scan a range of ports on a target IP address or hostname and report which ports are open. It creates a scan report file with details of the scan and the open ports found.

## Table of Contents

- [Why Use This Script](#why-use-this-script)
- [Languages and Utilities Used](#languages-and-utilities-used)
- [Environments Used](#environments-used)
- [Functions](#functions)
- [Dependencies and Permissions](#dependencies-and-permissions)
- [Ethical Considerations](#ethical-considerations)
- [Disclaimer](#disclaimer)
- [How to Run](#how-to-run)
- [Example Usage](#example-usage)

## Why Use This Script

Port scanning is a fundamental aspect of network and system administration, providing essential insights into the security and accessibility of networked devices. There are several reasons why you might find this script useful:

- **Security Assessment:** Use this script to assess the security posture of your own network or systems. Identifying open ports can help you determine potential vulnerabilities and take proactive security measures.

- **Network Troubleshooting:** When diagnosing network issues, knowing which ports are open or closed on a specific device can be invaluable. This script simplifies the process of checking port status.

- **Inventory Management:** As part of inventory management, you can use this script to verify which services are running on your networked devices, aiding in resource allocation and maintenance.

- **Educational Purposes:** If you're learning about network security or port scanning techniques, this script can serve as an educational tool to understand how port scanning works.

- **Customization:** You can customize this script to suit your specific needs. Modify it to scan specific port ranges, automate routine port scans, or integrate it into your network monitoring tools.

By using this script responsibly and ethically, you can enhance your network management and security practices while gaining valuable insights into your network's configuration and potential vulnerabilities.

## Languages and Utilities Used

- **PowerShell**

[<img alt="PowerShell Icon" width="50px" src="https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true" />][powershell]

[powershell]: https://learn.microsoft.com/en-us/powershell/

## Environments Used

- **Windows**

[<img align="left" alt="Microsoft Icon" width="35px" src="https://upload.wikimedia.org/wikipedia/commons/3/34/Windows_logo_-_2012_derivative.svg" />][windows]

[windows]: https://www.microsoft.com/
<br /><br />

## Functions

This script consists of three main functions:

**Show-OpenPorts:** Displays the open ports on the target. If there are no open ports, it prints "None."

**Create-ScanReport:** Creates a scan report file with date/time, scan details, and open ports (if any).

**Test-PortRange:** Scans a range of ports on the target and logs the open ports. It utilizes the Create-ScanReport function for reporting.

## Dependencies and Permissions

This script relies on the following dependencies:

- **PowerShell:** Ensure that you have PowerShell installed on your system. The script is designed to run in a PowerShell environment.

**Permissions:** This script may require administrative privileges to run successfully, as it involves network communication and port scanning. Depending on your system's security settings, you might need to run PowerShell as an administrator and adjust the execution policy to allow script execution.

## Ethical Considerations

Port scanning can be subject to legal and ethical considerations. It's essential to use this script responsibly and ethically:

- **Permission:** Ensure that you have proper authorization and permission to scan the target IP or hostname. Unauthorized scanning of systems or networks can be illegal and unethical.

- **Ownership:** Respect the ownership of the scanned systems. Avoid scanning systems that you do not own or have explicit permission to scan.

- **Privacy:** Be mindful of privacy concerns. Do not scan systems that may contain sensitive or private information without proper consent.

- **Legal Compliance:** Comply with all applicable laws and regulations related to network scanning and cybersecurity. Laws governing port scanning may vary by jurisdiction.

## Disclaimer

This script is provided for educational and informational purposes only. The author and contributors of this script are not responsible for any unauthorized or unethical use of this tool. Users are solely responsible for ensuring they have the necessary permissions and compliance with all applicable laws when using this script.

## How to Run

1. **Download the Script:** Download the **_'port_scanner.ps1'_** script to your local machine.

2. **Open PowerShell:** Open a PowerShell terminal.

3. **Navigate to the Script Directory:** Use the **_'cd'_** command to navigate to the directory where port_scanner.ps1 is located.
   
4. **PowerShell Execution Policy** Ensure that PowerShell execution policy allows script execution. You may need to run **_'Set-ExecutionPolicy RemoteSigned'_** to enable script execution.

5. **Execute the Script:** Run the script by typing **_'.\port_scanner.ps1'_** and pressing Enter.

6. **Follow the Prompts:** The script will prompt you to enter the target IP address or hostname and specify the port range for scanning. Follow the on-screen instructions.

<div align="center"> 
<img align="center" src="https://github.com/infinity-set/port_scanner_ps/assets/142350896/4b0fa5f1-12c8-413b-acf9-41f7a6bc5a42" height="60%" width="60%" alt="Run Script Example"/>
</div> 

7. **View the Results:** After the scan is complete, the script will display open ports, save a report to a file, and provide the file path for viewing.

<div align="center"> 
<img align="center" src="https://github.com/infinity-set/port_scanner_ps/assets/142350896/369c9524-b6b7-4789-b61c-b897a10705eb" height="60%" width="60%" alt="Run Script Example"/>
</div> 

## Example Usage

Here's an example of how to use the script:

1. Execute the script as described in the "How to Run" section.

2. Enter the target IP address or hostname.

3. Enter the starting and ending port numbers for the scan range.

4. Confirm the scan.

The script will perform the port scan, display open ports (if any), and generate a scan report.

You can view the scan report in the specified file path.

#
<br>

⬅️ **[Home](https://github.com/infinity-set)**
