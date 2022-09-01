###ha nem müködne akkor elsõnek futtatni ::: Set-ExecutionPolicy RemoteSigned
### aktuális felhasználó esetében ::: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

#[Console]::OutputEncoding

$REPO          = 'https://github.com/dggmester/html_basic_template'
$REPO_git      = 'https://github.com/dggmester/html_basic_template.git'
$label         = 'GIT: DGG basic HTML template'
$name          = 'Nyilas János'
$mail          = 'janos.fejleszto@gmail.com'

###PROGRAMS
$GIT           = 'git'

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference                     = 'SilentlyContinue'
$wshell                                    = New-Object -ComObject Wscript.Shell
$Button                                    = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco                                  = [System.Windows.MessageBoxImage]::Error

$Form                                      = New-Object system.Windows.Forms.Form
$Form.ClientSize                           = New-Object System.Drawing.Point(350,200) #magasság,szélesség
$Form.text                                 = $label
$Form.StartPosition                        = "CenterScreen"
$Form.TopMost                              = $false
$Form.BackColor                            = [System.Drawing.ColorTranslator]::FromHtml("#e9e9e9")
$Form.AutoScaleDimensions                  = '192, 192'
$Form.AutoScaleMode                        = "Dpi"
$Form.AutoSize                             = $true
$Form.AutoScroll                           = $True
$Form.FormBorderStyle                      = 'FixedSingle'
$Form.Width                                = $objImage.Width
$Form.Height                               = $objImage.Height

#Panelek:::
$x_left                                    = 0
$y_top                                     = 0
$margin_left                               = 5
$margin_top                                = 5
$d_left                                    = 200
$d_top                                     = 15

#default panel
$Panel_default                             = New-Object system.Windows.Forms.Panel
$Panel_default.height                      = 450
$Panel_default.width                       = $d_left-$margin_left
$Panel_default.location                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))

###következõ panel elõtt:
#lefele::: $y_top          = $y_top + 200
#jobbra::: $x_left         = $x_left + $d_left
#fel   ::: $y_top          = 0
$Form.controls.AddRange(@($Panel_default)) ###vesszõvel választjuk el ha több panel van

#Panelek tartalma
$x_left                                    = 0
$y_top                                     = 0
$margin_left                               = 5
$margin_top                                = 5
$d_left                                    = 180
$d_top                                     = 50

###INIT:
$gitHub_init                                    = New-Object system.Windows.Forms.Button
$gitHub_init.text                               = "GITHUB ::: init"
$gitHub_init.width                              = $d_left-5
$gitHub_init.height                             = $d_top-5
$gitHub_init.location                           = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$gitHub_init.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Panel_default.Controls.Add($gitHub_init)
$gitHub_init.Add_Click({
	Write-Host "Start ::: gitHub_init!"
	& $GIT config --global user.name $name
	& $GIT config --global user.email $mail
	& $GIT init
	& $GIT remote add origin $REPO_git
	& $GIT add .
	& $GIT commit -m "0.0.0"
	& $GIT push -u origin master
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

$gitLAB_init                                    = New-Object system.Windows.Forms.Button
$gitLAB_init.text                               = "GITLAB ::: init"
$gitLAB_init.width                              = $d_left-5
$gitLAB_init.height                             = $d_top-5
$gitLAB_init.location                           = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$gitLAB_init.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Panel_default.Controls.Add($gitLAB_init)
$gitLAB_init.Add_Click({
	Write-Host "Start ::: gitLAB_init!"
	& $GIT config --global user.name $name
	& $GIT config --global user.email $mail
	& $GIT init
	& $GIT remote add origin $REPO_git
	& $GIT add .
	& $GIT commit -m "0.0.0"
	& $GIT push -u origin master
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

###CLONE:
$git_clone                                      = New-Object system.Windows.Forms.Button
$git_clone.text                                 = "GIT ::: clone"
$git_clone.width                                = $d_left-5
$git_clone.height                               = $d_top-5
$git_clone.location                             = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$git_clone.Font                                 = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Panel_default.Controls.Add($git_clone)
$git_clone.Add_Click({
	Write-Host "Start::: git_clone!"
	& $GIT -c http.sslVerify=false clone $REPO_git
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

###COMMIT
$GETcommit                                      = New-Object system.Windows.Forms.Button
$GETcommit.text                                 = "GET ::: last commit"
$GETcommit.width                                = $d_left-5
$GETcommit.height                               = $d_top-5
$GETcommit.location                             = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$GETcommit.Font                                 = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Panel_default.Controls.Add($GETcommit)
$GETcommit.Add_Click({
	Write-Host "Start::: GETcommit!"
	$outVar = (git log -1) | Out-String
	$outShell = New-Object -ComObject Wscript.Shell
	$outShell.Popup($outVar,0,"Last Commit")
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

$gitHub_commit                                  = New-Object system.Windows.Forms.Button
$gitHub_commit.text                             = "GITHUB ::: commit, push(main)"
$gitHub_commit.width                            = $d_left-5
$gitHub_commit.height                           = $d_top-5
$gitHub_commit.location                         = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$gitHub_commit.Font                             = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Panel_default.Controls.Add($gitHub_commit)
$gitHub_commit.Add_Click({
	Write-Host "Start::: gitHub_commit!"
	$outVar = (git log -1) | Out-String
	$outShell = New-Object -ComObject Wscript.Shell
	$outShell.Popup($outVar,0,"Last Commit")
	$commit = Read-Host -Prompt 'commit = '
	& $GIT add .
	& $GIT commit -m $commit
	& $GIT push -u origin main
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

$gitLAB_commit                                  = New-Object system.Windows.Forms.Button
$gitLAB_commit.text                             = "GITLAB ::: commit"
$gitLAB_commit.width                            = $d_left-5
$gitLAB_commit.height                           = $d_top-5
$gitLAB_commit.location                         = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$gitLAB_commit.Font                             = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Panel_default.Controls.Add($gitLAB_commit)
$gitLAB_commit.Add_Click({
	Write-Host "Start::: gitLAB_commit!"
	$outVar = (git log -1) | Out-String
	$outShell = New-Object -ComObject Wscript.Shell
	$outShell.Popup($outVar,0,"Last Commit")
	$commit = Read-Host -Prompt 'commit = '
	& $GIT add .
	& $GIT commit -m $commit
	& $GIT push -u origin master
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

###LASTVERSION
$git_LastVersion                                = New-Object system.Windows.Forms.Button
$git_LastVersion.text                           = "GIT ::: LastVersion"
$git_LastVersion.width                          = $d_left-5
$git_LastVersion.height                         = $d_top-5
$git_LastVersion.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$git_LastVersion.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$git_LastVersion.Enabled                        = $True
$Panel_default.Controls.Add($git_LastVersion)
$git_LastVersion.Add_Click({
	Write-Host "Start::: git_LastVersion!"
	& $GIT -c http.sslVerify=false fetch origin
	& $GIT reset --hard origin/master
	& $GIT clean -f -d
	Write-Host "KÉSZ!"
})
$y_top                                          = $y_top + $d_top

$git_HARD                                       = New-Object system.Windows.Forms.Button
$git_HARD.text                                  = "GIT ::: HARD"
$git_HARD.width                                 = $d_left-5
$git_HARD.height                                = $d_top-5
$git_HARD.location                              = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$git_HARD.Font                                  = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$git_HARD.Enabled                               = $False
$Panel_default.Controls.Add($git_HARD)
$y_top                                          = $y_top + $d_top

[void]$Form.ShowDialog()