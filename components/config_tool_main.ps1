# Imports
Add-Type -AssemblyName presentationcore,presentationframework
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

#region General
# Always apply these settings
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarAl -Value 0
Stop-Process -Name explorer -Force
Start-Process explorer.exe

#region Fenster
#region Form und Groups
$Gray = [System.Drawing.Color]::FromArgb(60,60,60)
$Blue = [System.Drawing.Color]::FromKnownColor("LightSkyBlue")
$DarkBlue = [System.Drawing.Color]::FromKnownColor("MidnightBlue")
$LightGray = [System.Drawing.Color]::FromKnownColor("LightGray")


$Window = [System.Windows.Forms.Form]::new()
$Window.Text = "Configure your PC"
$Window.Size = [System.Drawing.Size]::new(1000,800)
$Window.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Dpi
$window.AutoScaleDimensions = [System.Drawing.SizeF]::new(100,100)
$Window.StartPosition = "CenterScreen"
$Window.BackColor = [System.Drawing.Color]::FromKnownColor("DarkSlateGray")
$Window.Topmost = $true

$UserGroup = [System.Windows.Forms.GroupBox]::new()
$UserGroup.Size = [System.Drawing.Size]::new(400,175)
$UserGroup.BackColor = $Gray
$Window.Controls.Add($UserGroup)

$AdminGroup = [System.Windows.Forms.GroupBox]::new()
$AdminGroup.Size = [System.Drawing.Size]::new(400,285)
$AdminGroup.BackColor = $Gray
$Window.Controls.Add($AdminGroup)

$EnergyGroup = [System.Windows.Forms.GroupBox]::new()
$EnergyGroup.Size = [System.Drawing.Size]::new(400,200)
$EnergyGroup.Location = [System.Drawing.Point]::new(0,290)
$EnergyGroup.BackColor = $Gray
$Window.Controls.Add($EnergyGroup)

$DownloadsGroup = [System.Windows.Forms.GroupBox]::new()
$DownloadsGroup.Size = [System.Drawing.Size]::new(400,100)
$DownloadsGroup.Location = [System.Drawing.Point]::new(0,495)
$DownloadsGroup.BackColor = $Gray
$Window.Controls.Add($DownloadsGroup)

$NiniteGroup = [System.Windows.Forms.GroupBox]::new()
$NiniteGroup.Size = [System.Drawing.Size]::new(400,490)
$NiniteGroup.Location = [System.Drawing.Point]::new(450,0)
$NiniteGroup.BackColor = $Gray
$Window.Controls.Add($NiniteGroup)

$MSOfficeGroup = [System.Windows.Forms.GroupBox]::new()
$MSOfficeGroup.Size = [System.Drawing.Size]::new(400,200)
$MSOfficeGroup.Location = [System.Drawing.Point]::new(450,495)
$MSOfficeGroup.BackColor = $Gray
$Window.Controls.Add($MSOfficeGroup)

$OkButton = [System.Windows.Forms.Button]::new()
$OkButton.Location = [System.Drawing.Point]::new(850,720)
$OkButton.Size = [System.Drawing.Size]::new(125,30)
$OkButton.BackColor = $Gray
$OkButton.Text = "Continue"
$OkButton.ForeColor = $Blue
$OkButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Window.Controls.Add($OkButton)
#endregion Form und Groups

#region Lokaler Nutzer
$UserCheck1 = [System.Windows.Forms.CheckBox]::new()
$UserCheck1.Location = [System.Drawing.Point]::new(15,15)
$UserCheck1.Size = [System.Drawing.Size]::new(100,20)
$UserCheck1.AutoSize = $true
$UserCheck1.Text = "Add local user and set name"
$UserCheck1.ForeColor = $Blue

$UsernameTextbox = [System.Windows.Forms.TextBox]::new()
$UsernameTextbox.Location = [System.Drawing.Point]::new(15,45)
$UsernameTextbox.Size = [System.Drawing.Size]::new(270,50)
$UsernameTextbox.AutoSize = $true
$UsernameTextbox.ForeColor = $DarkBlue
$UsernameTextbox.BackColor = $Gray
$UsernameTextbox.Enabled = $false

$UserCheck2 = [System.Windows.Forms.CheckBox]::new()
$UserCheck2.Location = [System.Drawing.Point]::new(45,75)
$UserCheck2.Size = [System.Drawing.Size]::new(100,20)
$UserCheck2.AutoSize = $true
$UserCheck2.Text = "Add new user to administrators"
$UserCheck2.ForeColor = $Blue
$UserCheck2.Enabled = $false

$UserCheck3 = [System.Windows.Forms.CheckBox]::new()
$UserCheck3.Location = [System.Drawing.Point]::new(45,105)
$UserCheck3.Size = [System.Drawing.Size]::new(100,20)
$UserCheck3.AutoSize = $true
$UserCheck3.Text = "Set new local user's password"
$UserCheck3.ForeColor = $Blue
$UserCheck3.Enabled = $false

$UserPwTextbox = [System.Windows.Forms.TextBox]::new()
$UserPwTextbox.Location = [System.Drawing.Point]::new(45,135)
$UserPwTextbox.Size = [System.Drawing.Size]::new(270,50)
$UserPwTextbox.AutoSize = $true
$UserPwTextbox.ForeColor = $DarkBlue
$UserPwTextbox.BackColor = $Gray
$UserPwTextbox.Enabled = $false

$UserPwLenghtMsg = [System.Windows.Forms.Label]::new()
$UserPwLenghtMsg.Location = [System.Drawing.Point]::new(45,155)
$UserPwLenghtMsg.Size = [System.Drawing.Size]::new(100,20)
$UserPwLenghtMsg.AutoSize = $true
$UserPwLenghtMsg.ForeColor = [System.Drawing.Color]::Red
$UserPwLenghtMsg.Text = "Password must be atleast 4 characters!"

$UserGroup.Controls.AddRange(@($UserCheck1, $UsernameTextbox, $UserCheck2, $UserCheck3, $UserPwTextbox))
#endregion Lokaler Nutzer

#region Lokaler Administrator
$AdminCheck1 = [System.Windows.Forms.CheckBox]::new()
$AdminCheck1.Location = [System.Drawing.Point]::new(15,185)
$AdminCheck1.Size = [System.Drawing.Size]::new(100,20)
$AdminCheck1.AutoSize = $true
$AdminCheck1.Text = "Set local administrator as active"
$AdminCheck1.ForeColor = $Blue

$AdminCheck2 = [System.Windows.Forms.CheckBox]::new()
$AdminCheck2.Location = [System.Drawing.Point]::new(45,215)
$AdminCheck2.Size = [System.Drawing.Size]::new(100,20)
$AdminCheck2.AutoSize = $true
$AdminCheck2.Text = "Set local administrator's password"
$AdminCheck2.ForeColor = $Blue
$AdminCheck2.Enabled = $false

$AdminPwTextbox = [System.Windows.Forms.TextBox]::new()
$AdminPwTextbox.Location = [System.Drawing.Point]::new(45,245)
$AdminPwTextbox.Size = [System.Drawing.Size]::new(270,50)
$AdminPwTextbox.AutoSize = $true
$AdminPwTextbox.BackColor = $Gray
$AdminPwTextbox.ForeColor = $DarkBlue
$AdminPwTextbox.Enabled = $false

$AdminPwLenghtMsg = [System.Windows.Forms.Label]::new()
$AdminPwLenghtMsg.Location = [System.Drawing.Point]::new(45,265)
$AdminPwLenghtMsg.Size = [System.Drawing.Size]::new(100,20)
$AdminPwLenghtMsg.AutoSize = $true
$AdminPwLenghtMsg.ForeColor = [System.Drawing.Color]::Red
$AdminPwLenghtMsg.Text = "Password must be atleast 5 characters!"

$AdminGroup.Controls.AddRange(@($AdminCheck1, $AdminCheck2, $AdminPwTextbox))
#endregion Lokaler Administrator

#region User/Admin - Dynamic Form Updates
# Testing Funktionen für Check/Text-boxen
function Test-Userbuttons {
    #If-Statements für UsernameTextBox
    if ($UserCheck1.Checked) {
        $UsernameTextbox.Enabled = $true;
        $UsernameTextbox.BackColor = $LightGray;
    }
    else {
        $UsernameTextbox.Enabled = $false;
        $UsernameTextbox.BackColor = $Gray;
        $UsernameTextbox.Text = ""
    }

    #If-Statements für UserCheckBoxes
    if ($UserCheck1.Checked) {$UserCheck2.Enabled = $true}
    else {$UserCheck2.Enabled = $false; $UserCheck2.Checked = $false}

    if ($UserCheck1.Checked) {$UserCheck3.Enabled = $true}
    else {$UserCheck3.Enabled = $false;  $UserCheck3.Checked = $false}

    #If-Statements für UserPasswordTextBox
    if ($UserCheck3.Checked) {
        $UserPwTextbox.Enabled = $true;
        $UserPwTextbox.BackColor = $LightGray;
        $OkButton.Enabled = $false;
        Test-PasswordLengthUser
    }
    else {
        $UserPwTextbox.Enabled = $false;
        $UserPwTextbox.BackColor = $Gray;
        $UserPwTextbox.Text = "";
        $OkButton.Enabled = $true;
        $UserGroup.Controls.Remove($UserPwLenghtMsg)
    }
}

function Test-Adminbuttons {
    #If-Statements für AdminCheckboxen
    if ($AdminCheck1.Checked) {$AdminCheck2.Enabled = $true}
    else {$AdminCheck2.Enabled = $false; $AdminCheck2.Checked = $false}

    #If-Statements für AdminPasswordTextboxes
    if ($AdminCheck2.Checked) {
        $AdminPwTextbox.Enabled = $true;
        $AdminPwTextbox.BackColor = $LightGray;
        $OkButton.Enabled = $false;
        Test-PasswordLengthAdmin;
    }
    else {
        $AdminPwTextbox.Enabled = $false;
        $AdminPwTextbox.BackColor = $Gray;
        $AdminPwTextbox.Text = "";
        $OkButton.Enabled = $true;
        $AdminGroup.Controls.Remove($AdminPwLenghtMsg);
    }
}

# Testing Funktionen für Passwortlänge
function Test-PasswordLengthUser {
    if ($UserPwTextbox.Text.Length -lt 4) {$UserGroup.Controls.Add($UserPwLenghtMsg); $OkButton.Enabled = $false}
    else {$UserGroup.Controls.Remove($UserPwLenghtMsg); $OkButton.Enabled = $true}
}

function Test-PasswordLengthAdmin {
    if ($AdminPwTextbox.Text.Length -lt 5) {$AdminGroup.Controls.Add($AdminPwLenghtMsg); $OkButton.Enabled = $false}
    else {$AdminGroup.Controls.Remove($AdminPwLenghtMsg); $OkButton.Enabled = $true}
}

# Eventhandler für Checkboxen
$UserCheck1.add_CheckedChanged({
    if ($AdminCheck2.Checked) {
        Test-Userbuttons
        Test-PasswordLengthAdmin
        if ($AdminPwTextbox.Text.Length -lt 5) {$OkButton.Enabled = $false}
        else {Test-Userbuttons}
    }
    else {Test-Userbuttons}
})

$UserCheck3.add_CheckedChanged({
    if ($AdminCheck2.Checked) {
        Test-Userbuttons
        Test-PasswordLengthAdmin
        if ($AdminPwTextbox.Text.Length -lt 5) {$OkButton.Enabled = $false}
        else {Test-Userbuttons}
    }
    else {Test-Userbuttons}
})

$AdminCheck1.add_CheckedChanged({
    if ($UserCheck3.Checked) {
        Test-Adminbuttons
        Test-PasswordLengthUser
        if ($UserPwTextbox.Text.Length -lt 4) {$OkButton.Enabled = $false}
        else {Test-Adminbuttons}
    }
    else {Test-Adminbuttons}
})

$AdminCheck2.add_CheckedChanged({
    if ($UserCheck3.Checked) {
        Test-Adminbuttons
        Test-PasswordLengthUser
        if ($UserPwTextbox.Text.Length -lt 4) {$OkButton.Enabled = $false}
        else {Test-Adminbuttons}
    }
    else {Test-Adminbuttons}
})

# Eventhandler für Textboxen
$UserPwTextbox.add_TextChanged({
    if ($AdminCheck2.Checked) {
        Test-PasswordLengthUser
        Test-PasswordLengthAdmin
        if ($AdminPwTextbox.Text.Length -lt 5) {$OkButton.Enabled = $false}
        else {Test-PasswordLengthUser}
    }
    else {Test-PasswordLengthUser}
})

$AdminPwTextbox.add_TextChanged({
    if ($UserCheck3.Checked) {
        Test-PasswordLengthAdmin
        Test-PasswordLengthUser
        if ($UserPwTextbox.Text.Length -lt 4) {$OkButton.Enabled = $false}
        else {Test-PasswordLengthAdmin}
    }
    else {Test-PasswordLengthAdmin}
})
#endregion User/Admin - Dynamic Form Updates

#region Energiesettings
#region 2. Groupboxen festlegen
    # Gruppe 1
    $ModiGroup = [System.Windows.Forms.GroupBox]::new()
    $ModiGroup.Size = [System.Drawing.Size]::new(400,100)
    $EnergyGroup.Controls.Add($ModiGroup)
    # Gruppe 2
    $DeviceGroup = [System.Windows.Forms.GroupBox]::new()
    $DeviceGroup.Size = [System.Drawing.Size]::new(400,200)
    $EnergyGroup.Controls.Add($DeviceGroup)
#endregion

#region 3. Textboxen hinzufuegen(label)
    # Label 1
    $ModiLabel = [System.Windows.Forms.Label]::new()
    $ModiLabel.Location = [System.Drawing.Point]::new(10,20)
    $ModiLabel.Size = [System.Drawing.Size]::new(280,20)
    $ModiLabel.Text = "Set energyoption"
    $ModiLabel.Font = [System.Drawing.Font]::new("Arial", 10)
    $ModiLabel.ForeColor = $Blue
    $ModiGroup.Controls.Add($ModiLabel)
    # Label 2
    $DeviceLabel = [System.Windows.Forms.Label]::new()
    $DeviceLabel.Location = [System.Drawing.Point]::new(10,115)
    $DeviceLabel.Size = [System.Drawing.Size]::new(250,20)
    $DeviceLabel.Text = "Choose device"
    $DeviceLabel.Font = [System.Drawing.Font]::new("Arial", 10)
    $DeviceLabel.ForeColor = $Blue
    $DeviceGroup.Controls.Add($DeviceLabel)
#endregion

#region 4. Checkboxen(radiobutton) fuer die Energieoptionen
    #region Gruppe 1 Buttons
    $EnrgyCheckbox1_1 = [System.Windows.Forms.RadioButton]::new()
    $EnrgyCheckbox1_1.Location = [System.Drawing.Point]::new(15,50)
    $EnrgyCheckbox1_1.Size = [System.Drawing.Size]::new(100,20)
    $EnrgyCheckbox1_1.Text = "Highest"
    $EnrgyCheckbox1_1.ForeColor = $Blue
    $ModiGroup.Controls.Add($EnrgyCheckbox1_1)

    $EnrgyCheckbox1_2 = [System.Windows.Forms.RadioButton]::new()
    $EnrgyCheckbox1_2.Location = [System.Drawing.Point]::new(135,50)
    $EnrgyCheckbox1_2.Size = [System.Drawing.Size]::new(100,20)
    $EnrgyCheckbox1_2.Text = "Balanced"
    $EnrgyCheckbox1_2.ForeColor = $Blue
    $ModiGroup.Controls.Add($EnrgyCheckbox1_2)

    $EnrgyCheckbox1_3 = [System.Windows.Forms.RadioButton]::new()
    $EnrgyCheckbox1_3.Location = [System.Drawing.Point]::new(250,50)
    $EnrgyCheckbox1_3.Size = [System.Drawing.Size]::new(120,20)
    $EnrgyCheckbox1_3.Text = "Energysaving"
    $EnrgyCheckbox1_3.ForeColor = $Blue
    $ModiGroup.Controls.Add($EnrgyCheckbox1_3)
    #endregion
    #region Gruppe 2 Buttons
    $EnrgyCheckbox2_1 = [System.Windows.Forms.RadioButton]::new()
    $EnrgyCheckbox2_1.Location = [System.Drawing.Point]::new(15,145)
    $EnrgyCheckbox2_1.Size = [System.Drawing.Size]::new(100,20)
    $EnrgyCheckbox2_1.Text = "Desktop-PC"
    $EnrgyCheckbox2_1.ForeColor = $Blue
    $DeviceGroup.Controls.Add($EnrgyCheckbox2_1)

    $EnrgyCheckbox2_2 = [System.Windows.Forms.RadioButton]::new()
    $EnrgyCheckbox2_2.Location = [System.Drawing.Point]::new(135,145)
    $EnrgyCheckbox2_2.Size = [System.Drawing.Size]::new(125,20)
    $EnrgyCheckbox2_2.Text = "Laptop/Notebook"
    $EnrgyCheckbox2_2.ForeColor = $Blue
    $DeviceGroup.Controls.Add($EnrgyCheckbox2_2)
    #endregion
#endregion
#endregion Energiesettings

#region Downloads
$DownloadsLabel = [System.Windows.Forms.Label]::new()
$DownloadsLabel.Location = [System.Drawing.Point]::new(10,20)
$DownloadsLabel.AutoSize = $true
$DownloadsLabel.Text = "Choose your Downloads"
$DownloadsLabel.Font = [System.Drawing.Font]::new("Arial", 10)
$DownloadsLabel.ForeColor = $Blue

$DownloadCheckbox1 = [System.Windows.Forms.CheckBox]::new()
$DownloadCheckbox1.Location = [System.Drawing.Point]::new(10,45)
$DownloadCheckbox1.Size = [System.Drawing.Size]::new(140,25)
$DownloadCheckbox1.AutoSize = $true
$DownloadCheckbox1.Text = "Teamviewer Full-Client"
$DownloadCheckbox1.ForeColor = $Blue

$DownloadCheckbox2 = [System.Windows.Forms.CheckBox]::new()
$DownloadCheckbox2.Location = [System.Drawing.Point]::new(10,75)
$DownloadCheckbox2.Size = [System.Drawing.Size]::new(150,25)
$DownloadCheckbox2.AutoSize = $true
$DownloadCheckbox2.Text = "Teamviewer Host-Client"
$DownloadCheckbox2.ForeColor = $Blue

$DownloadsGroup.Controls.AddRange(@($DownloadsLabel, $DownloadCheckbox1, $DownloadCheckbox2))
#endregion Downloads

#region Ninite
$NiniteLabel = [System.Windows.Forms.Label]::new()
$NiniteLabel.Location = [System.Drawing.Point]::new(20,20)
$NiniteLabel.AutoSize = $true
$NiniteLabel.Text = "Choose Ninite Downloads for combined Installer"
$NiniteLabel.Font = [System.Drawing.Font]::new("Arial", 10)
$NiniteLabel.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteLabel)

$NiniteCheckbox1 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox1.Location = [System.Drawing.Point]::new(20,50)
$NiniteCheckbox1.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox1.AutoSize = $true
$NiniteCheckbox1.Text = "Chrome"
$NiniteCheckbox1.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox1)

$NiniteCheckbox2 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox2.Location = [System.Drawing.Point]::new(150,50)
$NiniteCheckbox2.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox2.AutoSize = $true
$NiniteCheckbox2.Text = "Firefox"
$NiniteCheckbox2.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox2)

$NiniteCheckbox3 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox3.Location = [System.Drawing.Point]::new(20,110)
$NiniteCheckbox3.Size = [System.Drawing.Size]::new(80,25)
$NiniteCheckbox3.AutoSize = $true
$NiniteCheckbox3.Text = "Notepad++"
$NiniteCheckbox3.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox3)

$NiniteCheckbox4 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox4.Location = [System.Drawing.Point]::new(150,110)
$NiniteCheckbox4.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox4.AutoSize = $true
$NiniteCheckbox4.Text = "7Zip"
$NiniteCheckbox4.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox4)

$NiniteCheckbox5 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox5.Location = [System.Drawing.Point]::new(20,170)
$NiniteCheckbox5.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox5.AutoSize = $true
$NiniteCheckbox5.Text = "Thunderbird"
$NiniteCheckbox5.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox5)

$NiniteCheckbox6 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox6.Location = [System.Drawing.Point]::new(150,170)
$NiniteCheckbox6.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox6.AutoSize = $true
$NiniteCheckbox6.Text = "LibreOffice"
$NiniteCheckbox6.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox6)

$NiniteCheckbox7 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox7.Location = [System.Drawing.Point]::new(20,230)
$NiniteCheckbox7.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox7.AutoSize = $true
$NiniteCheckbox7.Text = "OpenOffice"
$NiniteCheckbox7.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox7)

$NiniteCheckbox8 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox8.Location = [System.Drawing.Point]::new(150,230)
$NiniteCheckbox8.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox8.AutoSize = $true
$NiniteCheckbox8.Text = "Revo Uninstaller"
$NiniteCheckbox8.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox8)

$NiniteCheckbox9 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox9.Location = [System.Drawing.Point]::new(20,290)
$NiniteCheckbox9.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox9.AutoSize = $true
$NiniteCheckbox9.Text = "Gimp"
$NiniteCheckbox9.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox9)

$NiniteCheckbox10 = [System.Windows.Forms.CheckBox]::new()
$NiniteCheckbox10.Location = [System.Drawing.Point]::new(150,290)
$NiniteCheckbox10.Size = [System.Drawing.Size]::new(70,25)
$NiniteCheckbox10.AutoSize = $true
$NiniteCheckbox10.Text = "WinDirStat"
$NiniteCheckbox10.ForeColor = $Blue
$NiniteGroup.Controls.Add($NiniteCheckbox10)
#endregion Ninite

#region MSOffice etc.
$RmvOfficeLabel = [System.Windows.Forms.Label]::new()
$RmvOfficeLabel.Location = [System.Drawing.Point]::new(15,15)
$RmvOfficeLabel.AutoSize = $true
$RmvOfficeLabel.Text = "Microsoft related Settings"
$RmvOfficeLabel.Font = [System.Drawing.Font]::new("Arial", 10)
$RmvOfficeLabel.ForeColor = $Blue
$MSOfficeGroup.Controls.Add($RmvOfficeLabel)

$RmvOfficeCheckbox = [System.Windows.Forms.CheckBox]::new()
$RmvOfficeCheckbox.Location = [System.Drawing.Point]::new(15,45)
$RmvOfficeCheckbox.AutoSize = $true
$RmvOfficeCheckbox.Text = "Remove preinstalled Microsoft Office"
$RmvOfficeCheckbox.ForeColor = $Blue
$MSOfficeGroup.Controls.Add($RmvOfficeCheckbox)

$DebloatCheckbox = [System.Windows.Forms.CheckBox]::new()
$DebloatCheckbox.Location = [System.Drawing.Point]::new(15,75)
$DebloatCheckbox.AutoSize = $true
$DebloatCheckbox.Text = "Run Windows-Debloat"
$DebloatCheckbox.ForeColor = $Blue
$MSOfficeGroup.Controls.Add($DebloatCheckbox)

$RemoveOutlookNew = [System.Windows.Forms.CheckBox]::new()
$RemoveOutlookNew.Location = [System.Drawing.Point]::new(15,105)
$RemoveOutlookNew.AutoSize = $true
$RemoveOutlookNew.Text = "Remove Outlook New"
$RemoveOutlookNew.ForeColor = $Blue
$MSOfficeGroup.Controls.Add($RemoveOutlookNew)

$BlockOutlookNewSwitch = [System.Windows.Forms.CheckBox]::new()
$BlockOutlookNewSwitch.Location = [System.Drawing.Point]::new(15,135)
$BlockOutlookNewSwitch.AutoSize = $true
$BlockOutlookNewSwitch.Text = "Block OutlookNew auto switch(Only MS 365 Business Apps)"
$BlockOutlookNewSwitch.ForeColor = $Blue
$MSOfficeGroup.Controls.Add($BlockOutlookNewSwitch)
#endregion MSOffice etc.

[void]$Window.ShowDialog()

#region Einstellungen von oben werden angewandt
if ($Window.DialogResult -eq "OK") {}
else {exit}
#region Lokaler Nutzer
if ($UserCheck1.Checked) {
    if ($UserCheck3.Checked) {net user $UsernameTextbox.Text $UserPwTextbox.Text /add}
    else {net user $UsernameTextbox.Text /add}

    Set-LocalUser -Name $UsernameTextbox.Text -PasswordNeverExpires $true
}

if ($UserCheck2.Checked) {net localgroup Administratoren $UsernameTextbox.Text /add}   
#endregion Lokaler Nutzer
#region Admin
if ($AdminCheck1.Checked) {net user Administrator /active:yes}
if ($AdminCheck2.Checked) {net user Administrator $AdminPwTextbox.Text}
#endregion Admin
#region Energieoptionen
#If-Statements fuer die checkedboxes
#Gruppe 1
if ($EnrgyCheckbox1_1.Checked) {powercfg -setactive scheme_min}
elseif ($EnrgyCheckbox1_2.Checked) {powercfg -setactive scheme_balanced}
elseif ($EnrgyCheckbox1_3.Checked) {powercfg -setactive scheme_max}

#Gruppe 2
if ($EnrgyCheckbox2_1.Checked) {
        powercfg -change monitor-timeout-ac 0;
        powercfg -change standby-timeout-ac 0
}
elseif ($EnrgyCheckbox2_2.Checked) {
        powercfg -change monitor-timeout-ac 0;
        powercfg -change monitor-timeout-dc 15;
        powercfg -change standby-timeout-ac 0;
        powercfg -change standby-timeout-dc 15;
}
#endregion Energieoptionen
#region Downloads
$toolpath = "$env:HOMEDRIVE\Tools"
New-Item -ItemType Directory -Name Tools -Path "$env:HOMEDRIVE\"

if ($DownloadCheckbox1.Checked) {Invoke-WebRequest https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe -o "$toolpath\TeamViewer_Full.exe"}

if ($DownloadCheckbox2.Checked) {Invoke-WebRequest https://dl.teamviewer.com/download/TeamViewer_Host_Setup_x64.exe -o "$toolpath\TeamViewer_Host.exe"}

#endregion Downloads
#region Ninite
$NiniteLink = "https://ninite.com/"
#Je nach gecheckter Checkbox wird der zuvor definierte Link um die Strings erweitert
if ($NiniteCheckbox1.Checked) {$NiniteLink = $NiniteLink + "-chrome"}
if ($NiniteCheckbox2.Checked) {$NiniteLink = $NiniteLink + "-firefox"}
if ($NiniteCheckbox3.Checked) {$NiniteLink = $NiniteLink + "-notepadplusplus"}
if ($NiniteCheckbox4.Checked) {$NiniteLink = $NiniteLink + "-7zip"}
if ($NiniteCheckbox5.Checked) {$NiniteLink = $NiniteLink + "-thunderbirdesr128"}
if ($NiniteCheckbox6.Checked) {$NiniteLink = $NiniteLink + "-libreoffice"}
if ($NiniteCheckbox7.Checked) {$NiniteLink = $NiniteLink + "-openoffice"}
if ($NiniteCheckbox8.Checked) {$NiniteLink = $NiniteLink + "-revo"}
if ($NiniteCheckbox9.Checked) {$NiniteLink = $NiniteLink + "-gimp"}
if ($NiniteCheckbox10.Checked) {$NiniteLink = $NiniteLink + "-windirstat"}
#Zum Schluss wird der Link um "/ninite.exe" erweitert und verweißt so direkt auf die Installer-.exe-Datei
$NiniteLink = $NiniteLink + "/ninite.exe"
if (
    $NiniteCheckbox1.Checked -or
    $NiniteCheckbox2.Checked -or
    $NiniteCheckbox3.Checked -or
    $NiniteCheckbox4.Checked -or
    $NiniteCheckbox5.Checked -or
    $NiniteCheckbox6.Checked -or
    $NiniteCheckbox7.Checked -or
    $NiniteCheckbox8.Checked -or
    $NiniteCheckbox9.Checked -or
    $NiniteCheckbox10.Checked
) {
    Invoke-WebRequest "$NiniteLink" -OutFile "$toolpath\NiniteInstaller.exe"
}
#endregion Ninite
#region MS/Office etc.(sollte immer die letzte Position sein)
# Windows-Debloat ausführen
if ($DebloatCheckbox.Checked) {
    & ([scriptblock]::Create((Invoke-RestMethod "https://win11debloat.raphi.re/"))) -RunDefaults -Silent
}
# Outlook New entfernen
if ($RemoveOutlookNew.Checked) {
    & ([scriptblock]::Create((Invoke-RestMethod "https://win11debloat.raphi.re/"))) -RemoveW11Outlook -Silent
}
# Block automaticly switching to OutlookNew
# Registered as a background job (trigger on logon)
if ($BlockOutlookNewSwitch.Checked) {
    # Neuer Skripte-Ordner unter C: wird angelegt(sofern notwendig)
    New-Item -ItemType Directory -Path "$env:HOMEDRIVE\Skripte"

    Copy-Item "$env:HOMEDRIVE\Temp\block_outlooknew_switch.ps1" "$env:HOMERIVE\Skripte\block_outlooknew_switch.ps1"

    # Definiere den Pfad des zu ausführenden Skripts
    $BlockOutlookNewSkriptPath = "C:\Skripte\block_outlooknew_switch.ps1"

    # Erstelle die Aufgabe in der Aufgabenplanung
    $TaskAction = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "-ExecutionPolicy Bypass -File $BlockOutlookNewSkriptPath"
    $TaskTrigger = New-ScheduledTaskTrigger -AtLogOn
    $TaskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries

    # Erstellt die Aufgabe mit dem Namen "BlockOutlookNewSwitch"
    Register-ScheduledTask -Action $TaskAction -Trigger $TaskTrigger -Settings $TaskSettings -TaskName "BlockOutlookNewSwitch" -Description "Blockiert die Umstellung auf OutlookNew" -User "NT AUTHORITY\SYSTEM" -RunLevel Highest -AsJob
}
# Vorinstalliertes Office entfernen (startet nach dem automatischen reboot)
if ($RmvOfficeCheckbox.Checked) {
    Start-Process -Verb RunAs powershell.exe "-ExecutionPolicy Bypass -File ""$env:HOMEDRIVE\Temp\office_uninstall.ps1"""
}
else {
    Start-Process -Verb RunAs "$env:HOMEDRIVE\Temp\autostarter.cmd"
}
#endregion MS/Office etc.
#endregion Einstellungen
#endregion Fenster
exit