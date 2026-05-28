; Inno Setup script for Solution Test App (per-user install, no admin required)
#define MyAppName "Solution Test App"
#ifndef MyAppVersion
  #define MyAppVersion "1.0"
#endif
#define MyAppPublisher "Goodwill"
#define MyAppExeName "SolutionTestApp.exe"
; MySourceDir is normally passed by build-release.ps1 via /DMySourceDir=...
#ifndef MySourceDir
  #define MySourceDir "C:\Users\zhang\Projects\Goodwill\dist\GoodwillAgentBundle\SolutionTestApp"
#endif

[Setup]
AppId={{C7D2E840-3F19-4B6C-8A53-9D8E7F6A5B4C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\SolutionTestApp
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=output
OutputBaseFilename=SolutionTestAppSetup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\{#MyAppExeName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#MySourceDir}\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
