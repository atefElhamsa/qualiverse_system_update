[Setup]
AppId={{D1A39D4B-A6EE-4CE8-831C-2F72D85196A5}
AppName=QualiVerse System
AppVersion=1.0.0
AppPublisher=QualiVerse
DefaultDirName={localappdata}\QualiVerse_System
DefaultGroupName=QualiVerse System
DisableProgramGroupPage=yes
OutputBaseFilename=qualiverse_system_setup
PrivilegesRequired=lowest
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
SetupIconFile=resources\app_icon.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\QualiVerse System"; Filename: "{app}\qualiverse_system.exe"
Name: "{autodesktop}\QualiVerse System"; Filename: "{app}\qualiverse_system.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\qualiverse_system.exe"; Description: "{cm:LaunchProgram,QualiVerse System}"; Flags: nowait postinstall
