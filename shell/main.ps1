# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at:
#                 http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.




# configure charset encoding - DO NOT EDIT!
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding




# START EDITING AFTER THIS LINE
function Setup-Org-Settings {
        # NOTICE: customize your organizational custom functions here upon first
        #         boot after flashing the image. The only requirement and
        #         condition is to keep all your execution quiet ($null = ...)
        #         and only return '0' for successful or '1' (non-zero) for
        #         error.


        # report status
        return 0
}
# STOP EDITING BEYOND THIS LINE




function Setup-OS {
        # TODO: added Windows 10/11 bloatware disabling executions here
        #       referencing https://github.com/Raphire/Win11Debloat

        # execute organizational settings
        try {
                $___ret = Setup-Org-Settings
                if ($___ret -ne 0) {
                        return 1
                }
        } catch {
                return 1
        }

        # report status
        return 0
}




function Seal-OS {
        # get sysprep command
        $___program = Get-Command sysprep -ErrorAction SilentlyContinue
        if (-not ($___program)) {
                return 1
        }


        # execute
        $___process = Start-Process -Wait `
                        -FilePath $___program `
                        -NoNewWindow `
                        -PassThru `
                        -ArgumentsList "/generalize /oobe /shutdown /resetlimit"
        if ($___process.ExitCode -ne 0) {
                return 1
        }


        # report status
        return 0
}




# execute command
switch ($args[0]) {
{ $_ -in 'seal', 'Seal', 'SEAL' } {
        return Seal-OS
} { $_ -in 'setup', 'Setup', 'SETUP' } {
        return Setup-OS
} default {
        Write-Host "$ Powershell.exe -NoProfile -executionpolicy bypass -Command `"& './winsteward.ps1`""
        return 1
}}
