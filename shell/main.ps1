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




# configure charset encoding
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding




# prepare seal function
function Seal-OS {
        # get sysprep command
        $___program = Get-Command sysprep -ErrorAction SilentlyContinue
        if (-not ($___program)) {
                return 1
        }


        # execute
        $___process = Start-Process -Wait -FilePath $___program -NoNewWindow -PassThru
        if ($___process.ExitCode -ne 0) {
                return 1
        }


        # report status
        return 0
}




# prepare setup function
function Setup-OS {
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
        return 1
}}
