::Changing anything will corrupt DYTD downloader lite tool
::Thank you for using this tool
cls
color 0F
MODE 70,20
cls
set ar=1
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a.%%b)
set hour=%time:~0,2%
if "%time:~0,1%"==" " set hour=0%time:~1,1%
set datestamp=%date:~10,4%-%date:~4,2%-%date:~7,2%_%hour%%time:~3,2%
call :cnet
attrib +s +h +r "*.exe"
echo %ProgramFiles(x86)% | find "x86" > NUL && set bit=64 &&set aria2c=aria2c.exe || set bit=32 &&set aria2c=aria2c\aria2c.exe
start "" %cb% %bg% 15 2
wmic os get caption | findstr Microsoft >os
set /p os=<os &del os
set url=
yt --version >version
certutil -hashfile "%~dp0..\%title_%" md5 | findstr /i 3e4a73a24897729be28c8e6d92b8bb49 >nul && call :09333740634 && goto main || echo Warning don't edit anything...this tool has been corrupted && timeout 5 >nul>nul && taskkill /f /im cmd.exe 
:main
cls
title DYTD downloader lite
MODE 70,20
color 0F
if exist %tl% del %tl%
for /f "tokens=1" %%a in (version) do set "version=%%a"
for /f "tokens=*" %%a in (remarks.txt) do set "remarks=%%a"
for /f "tokens=*" %%a in (status.txt) do set "status=%%a"
title DYTD-%version% ^| %dl% ^| quality: %qt%-%bt%                    
cls
%c_%  {0e} %remarks%{0f} &echo. 
%c_%  {fC} %os%- %bit%bit {0c} ^|{f0}%status%{0c}^| %version%{0f} &echo.
%c_%  {ce} %dl% {e0} ^| {df} Audio Quality:%qt%-{4f}[%bt%]{e0} ^| {2f}[0-9]{1f} best-worst{0f} &echo.
echo  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ***MAIN MENU***ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
%c_%    ----{e0}Just Copy link/URL and select Download Options{0f}---- &echo.           
echo   *************************************  °°°    °°°
echo      Enter [a] download audio     °°°°°°°  °°   °  °°°°°°°° °°°°°°° 
echo      Enter [v] download video      °°   °°  °° °      °°     °°   °°
echo      Enter [s] easy download       °°   °°   °°       °°     °°   °°
echo      Enter [t] batch download urls °°   °°   °°       °°     °°   °°
echo      Enter [d] batch download names°°   °°   °°       °°     °°   °°
echo      Enter [o] open folder         °°   °°   °°       °°     °°   °°
echo      Enter [x] extra menu          °°   °°   °°       °°     °°   °°
echo      Enter [u] check for update   °°°°°°°    °°       °°    °°°°°°°
echo      Enter [c] convert video to mp3          °°
echo  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
%c_%  {1f}[y] {df}Download All Playlist {1f}[n] {2f} Single Download {1f}[p] {e0}Selective Download {0f} &echo.
echo  --------------------------------------------------------------------
CHOICE /C 0123456789avoxuenypcstzd /N /M  "Enter here: "   
if %errorlevel%==1 set qt=0 &set bt=best &goto main
if %errorlevel%==2 set qt=1 &set bt=best &goto main
if %errorlevel%==3 set qt=2 &set bt=best &goto main
if %errorlevel%==4 set qt=3 &set bt=better &goto main
if %errorlevel%==5 set qt=4 &set bt=better &goto main
if %errorlevel%==6 set qt=5 &set bt=better &goto main
if %errorlevel%==7 set qt=6 &set bt=worst &goto main
if %errorlevel%==8 set qt=7 &set bt=worst &goto main
if %errorlevel%==9 set qt=8 &set bt=worst &goto main
if %errorlevel%==10 set qt=9 &set bt=worst &goto main
if %errorlevel%==11 set v=Audio && echo %pl% | findstr item && goto :playlist || goto audio
if %errorlevel%==12 set v=Video && echo %pl% | findstr item && goto :playlist || goto video
if %errorlevel%==13 goto openf
if %errorlevel%==14 goto extra  
if %errorlevel%==15 goto update
if %errorlevel%==16 goto exit
if %errorlevel%==17 set pl="--no-playlist" &set dl="Single Download" &goto main
if %errorlevel%==18 set pl="--yes-playlist" &set dl="Download All Playlist" &goto main
if %errorlevel%==19 set pl="--playlist-items" &set dl="Selective Download" &goto main
if %errorlevel%==20 goto convertv2mp3
if %errorlevel%==21 goto easydownload
if %errorlevel%==22 goto batchdownload
if %errorlevel%==23 goto clearcache
if %errorlevel%==24 goto dlbynames

:dlbynames
cls
title Download by [list of names inside txt file]
echo ----------------------------------------
echo Enter [a] for audio
echo Enter [v] for video
echo Enter [c] cancel
echo ----------------------------------------
CHOICE /C avc /N /M  "Enter here: "  
if %errorlevel%==1 set m=1 &goto listsongs
if %errorlevel%==2 set m=0 &goto listsongs  
if %errorlevel%==3 goto main
:listsongs
cls
echo Please wait for pop-up folder and browse 
echo your txt file with song list inside.
call :browse1
for /F "tokens=* delims=" %%a in ('type "%file1%"') do (
    set "name=%%a"
echo Please wait downloading...
	if %m%==1 yt -i -x -c -w --no-warnings --audio-format mp3 --geo-bypass --audio-quality %qt% "ytsearch1:!name! lyrics" -o "%ad%\%%(title)s.%%(ext)s" 
    if %m%==0 yt -f "best+best" --no-playlist --downloader aria2c.exe "ytsearch1:!name!" -o "%vd%\%%(title)s.%%(ext)s" 
   )
echo Finished
echo  
echo Finished
timeout 5 >nul>nul
goto main

:convertv2mp3
cls
echo Please wait for pop up folder and browse your folder with videos
call :bfolder
if not exist %md%\Converted_Files mkdir %md%\Converted_Files 
for %%a in ("%folder%\*.mp4" "%folder%\*.mkv" "%folder%\*.avi" "%folder%\*.mov" "%folder%\*.wav" "%folder%\*.webm" "%folder%\*.flv" "%folder%\*.ogg" "%folder%\*.wmv") do (
%_f% -i "%%a" -vn -acodec libmp3lame -ab 320k -ar 44100 -ac 2 "%md%\Converted_Files\%%~na.mp3"
)
echo  
echo Finished
timeout 5 >nul>nul
goto main

:easydownload
cls 
mode 100,30
if %ar%==0 title Easy Downloader via Search aria2c=off
if %ar%==1 title Easy Downloader via Search aria2c=on
echo.             ---Options---
echo ---------------------------------------
%c_% {02}
echo  Enter [a] for audio
echo  Enter [v] for video
echo  Enter [c] Go back to Main Menu
echo  Enter [h] Help
%c_% {0f}
echo ---------------------------------------
CHOICE /C avc10h /N /M  "Enter here: "   
if %errorlevel%==1 goto ea
if %errorlevel%==2 goto ev  
if %errorlevel%==3 goto main
if %errorlevel%==4 set ar=1 &goto easydownload
if %errorlevel%==5 set ar=0 &goto easydownload
if %errorlevel%==6 goto easy_help
:easy_help
cls
echo Enter [1] to enable download video using aria2c recommended
echo Enter [0] to turn off downloading video using aria2c 
pause >NUL
goto easydownload
:ea
cls
title easy download audio
echo.
set search=
set /P search="Search for: "
if not defined search echo No Entry & timeout 3 >nul & goto :easydownload
set /p num="Enter maximum number to be download: "
if not defined num set num=1
yt -i -x -c -w --no-warnings --audio-format mp3 --geo-bypass --audio-quality %qt% "ytsearch%num%:%search% lyrics" --max-download %num% -o %ad%\%%(title)s.%%(ext)s 
echo  
echo Finished
timeout 5 >nul>nul
goto main
:ev
cls
if %ar%==0 title easy download video [aria2c=off]
if %ar%==1 title easy download video [aria2c=on]
echo.
set search=
set /P search="Search for: "
if not defined search echo No Entry & timeout 3 >nul & goto :easydownload
set /p num="Enter maximum number to be download: "
if not defined num set num=1
if %ar%==0 yt -i -c -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" --yes-playlist "ytsearch%num%:%search%" -o %vd%\%%(title)s.%%(ext)s --max-download %num%
if %ar%==1 yt -f "best+best" %pl% --yes-playlist --downloader aria2c.exe "ytsearch%num%:%search%" -o %vd%\%%(title)s.%%(ext)s "%url%" --max-download %num%
echo  
echo Finished
timeout 5 >nul>nul
goto main

:batchdownload
title Download all URL inside txt file
cls
if %pl%=="--playlist-items" echo Selective Playlist is not supported in this option  &echo only "y"[Yes Playlist] and "n"[Single download]. &timeout 5 >nul>nul &goto main
title Download all URL inside txt file
echo.      ---Options---
echo -------------------------------
echo Enter [a] for audio
echo Enter [v] for video
echo Enter [c] Go back to Main Menu
echo --------------------------------
CHOICE /C avc /N /M  "Enter here: "   
if %errorlevel%==1 goto ba
if %errorlevel%==2 goto bv  
if %errorlevel%==3 goto main
:ba
title Download All url inside txt [mp3 format] %pl%
cls
set txt=
set /p txt="Drag your txt file with url here: "
if not defined txt echo Error: No file &timeout 5 <nul &goto batchdownload
yt -a -i -x -w --no-warnings --audio-format mp3 --geo-bypass %pl% --audio-quality %qt% -o %ad%\%%(title)s.%%(ext)s --batch-file %txt%
echo  
echo Finished
timeout 5 >nul>nul
goto main
:bv
title Download All url inside txt [video format] %pl%
cls
set txt=
set /p txt="Drag your txt file with url here: "
if not defined txt echo Error: No file &timeout 5 <nul &goto batchdownload
echo Downloading Video please wait...
yt -i -a -c -w --no-warnings -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" %pl% -o %vd%\%%(title)s.%%(ext)s --batch-file %txt%
if %errorlevel% NEQ 0 cls &%c_% {0c} Error downloading trying method 2 {0f} &echo. &yt -i -a -c -w --no-warnings %pl% -o %vd%\%%(title)s.%%(ext)s --batch-file %txt%
if %errorlevel% NEQ 0 cls &%c_% {0c}Error downloading try Manual Download Option{0f} &timeout 5 >nul>nul
echo  
echo finished!
timeout 5 >nul
goto :main

:extra
cls
mode 100,30
title Extra Menu
echo.
echo                                         ***EXTRA MENU***
echo. 
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ  
echo  Enter [1] Increase Volume                         Enter [i] Add watermark for video
echo  Enter [2] Denoise                                 Enter [j] Get direct link
echo  Enter [3] Desktop Screen Recorder                 Enter [k] Manual Video Downloader
echo  Enter [4] Speedup Video                           Enter [l] Freebies
echo  Enter [5] Video Converter                         Enter [m] Add Poster Image [mp3 to mp4 format]  
echo  Enter [6] Merge subtitle with mp4                 Enter [n] Get subtitle inside video 
echo  Enter [7] Merge Video with Audio                  Enter [o] Download subtitle via URL
echo  Enter [8] Convert video format to mp3             Enter [p] Create Artificial Voice Text to Audio
echo  Enter [9] Play Video                              Enter [q] Download via External Downloader
echo  Enter [0] MP3 Volume Normalization                Enter [r] Compress Audio Files 
echo  Enter [a] Split Video                             Enter [s] Mute audio in a Video
echo  Enter [b] Info hash to magnet                     Enter [t] Convert Videos for DVD/VCD format
echo  Enter [c] Magnet to Torrent                       Enter [u] Merge all Videos inside Folder
echo  Enter [d] Seed torrent                            Enter [v] Best Video-Audio Format downloader
echo  Enter [e] Download via info hash                  Enter [w] Convert Audio/Video to Karaoke
echo  Enter [f] Download via torrent file               Enter [y] Change Video Scale
echo  Enter [g] Cmd plugin                              Enter [z] Next [More Extra]
echo  Enter [h] Reduce Video/Audio size                 Enter [x] Main Menu
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo.
CHOICE /C 1234567890abcdefghijklmnopqrstuvwyzx /N /M  "Enter here: " 
if %errorlevel%==1 goto 1
if %errorlevel%==2 goto 2
if %errorlevel%==3 goto 3
if %errorlevel%==4 goto 4
if %errorlevel%==5 goto 5
if %errorlevel%==6 goto 6
if %errorlevel%==7 goto 7
if %errorlevel%==8 goto 8
if %errorlevel%==9 goto  9
if %errorlevel%==10 goto 0
if %errorlevel%==11 goto split
if %errorlevel%==12 start "" "%in%" &goto main
if %errorlevel%==13 start "" "%mg%" &goto main
if %errorlevel%==14 start "" "%sd%" &goto main
if %errorlevel%==15 goto e
if %errorlevel%==16 goto f
if %errorlevel%==17 goto g
if %errorlevel%==18 goto h
if %errorlevel%==19 goto i
if %errorlevel%==20 goto j
if %errorlevel%==21 goto k
if %errorlevel%==22 goto l
if %errorlevel%==23 goto m
if %errorlevel%==24 goto n
if %errorlevel%==25 goto o
if %errorlevel%==26 goto p
if %errorlevel%==27 goto q
if %errorlevel%==28 goto comp_a
if %errorlevel%==29 goto mute
if %errorlevel%==30 goto pdvd
if %errorlevel%==31 goto mergeallvid
if %errorlevel%==32 goto best
if %errorlevel%==33 goto mp3tokaraoke
if %errorlevel%==34 goto scale_opt
if %errorlevel%==35 goto extra1
if %errorlevel%==36 goto main

:extra1
cls
echo This Funtion is Reserve for Next update
timeout 5 >nul>NUL
goto extra

:scale_opt
cls
title Video Scale Changer
echo ------Video Scale Changer-------
echo --------------------------------
echo Enter [1] Reduce Video scale to 1/2 
echo Enter [2] Reduce Video scale to 1/3
echo Enter [3] Reduce Video scale to 1/4
echo Enter [4] Reduce Video scale to 1/8
echo Enter [5] Manual Input (input number 2-9)
echo Enter [6] Cancel
echo --------------------------------
CHOICE /C 123456 /N /M  "Enter here: " 
if %errorlevel%==1 set ns=2 &goto Scale
if %errorlevel%==2 set ns=3 &goto Scale
if %errorlevel%==3 set ns=4 &goto Scale
if %errorlevel%==4 set ns=8 &goto Scale
if %errorlevel%==5 set /p ns=Enter Number 2-9 here: &goto Scale
if %errorlevel%==6 goto Extra
:Scale
cls
title Video Scale Changer ^| Ctrl^+c to cancel
if not exist "%md%\Scaled_Video" mkdir "%md%\Scaled_Video" 
echo Please wait for pop up folder and browse your video
call :browse1
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_f% -i "%file1%" -vf "scale=iw/%ns%:ih/%ns%" "%md%\Scaled_Video\%name%"
echo  
echo Finished
timeout 5 >nul
goto main

:best
cls 
title Best Video-audio Downloader
call :wc
echo Downloading Best Video with best Audio please wait...
yt -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %pl% -o %vd%\%%(title)s.%%(ext)s "%url%"
echo  
echo Finished!
timeout 5 <nul
goto main

:mp3tokaraoke
cls
echo Browse your mp3 file to convert to Karaoke
call :browse1
echo Please wait converting mp3 to karaoke...
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_f% -i "%file1%" -af pan="stereo|c0=c0|c1=-1*c1" -ac 1 "%md%\karaoke_%name%"
echo  
echo Finished!
echo Saved in "%md%\karaoke_%name%"
timeout 5 >nul<nul
goto main

:pdvd
title Convert Video for DVD or VCD Compatibility 
cls
MODE 70,18
if not exist %md%\dvd mkdir %md%\dvd
if not exist %md%\vcd mkdir %md%\vcd
cls
echo      ---Select Option---
echo --------------------------------
echo Enter [d] Convert Video to DVD Format
echo Enter [v] Convert Video to VCD Format
echo Enter [c] Cancel
echo --------------------------------
CHOICE /C dvc /N /M  "Enter here: " 
if %errorlevel%==1 set tar=ntsc-dvd &title Convert Video for DVD &goto dvd_vcd
if %errorlevel%==2 set tar=pal-vcd &title Convert Video for VCD &goto dvd_vcd
if %errorlevel%==3 goto extra
:dvd_vcd
cls
if %tar%==ntsc-dvd set dv=dvd
if %tar%==pal-vcd set dv=vcd
echo Please wait for pop up folder and browse your folder with videos
call :bfolder
cls
echo Please wait Converting Video to %d% format...
for %%a in ("%folder%\*.mp4" "%folder%\*.mkv" "%folder%\*.avi" "%folder%\*.mov" "%folder%\*.wav" "%folder%\*.webm" "%folder%\*.flv" "%folder%\*.ogg" "%folder%\*.wmv") do (
%_f% -i "%%a" -target %tar% "%md%\%dv%\%%~na.mpg"
)
echo  
echo Finished
timeout 5 >nul>nul
goto main

:mergeallvid
cls 
title Merge Videos
if not exist %md%\merge_video mkdir %md%\merge_video
echo Please wait for pop-up folder and browse your folder with video inside...
echo Note: Rename and remove special character to avoid error.
call :bfolder
for %%a in ("%folder%\*.mp4" "%folder%\*.mkv" "%folder%\*.avi" "%folder%\*.mov" "%folder%\*.wav" "%folder%\*.webm" "%folder%\*.flv" "%folder%\*.ogg" "%folder%\*.wmv") do (echo file '%%a' >> videolist.txt
echo y | %_f% -f concat -safe 0 -i videolist.txt -c copy "%md%\merge_video\%datestamp%_Merge_Videos.mp4"
)
echo 
echo Finished! 
echo -------------------------------
echo Saved in "%md%\%datestamp%_Merge_Videos.mp4" &del videolist.txt
timeout 5 >nul>nul
goto main

:mute
cls
title Mute Audio in Video 
if not exist %md%\muted_video mkdir %md%\muted_video
echo Please wait for pop-up folder and browse your file with videos...
call :bfolder
cls
echo Please wait muting video...
for %%a in ("%folder%\*.mp4" "%folder%\*.mkv" "%folder%\*.avi" "%folder%\*.mov" "%folder%\*.wav" "%folder%\*.webm" "%folder%\*.flv" "%folder%\*.ogg" "%folder%\*.wmv") do (
%_f% -i "%%a" -an "%md%\muted_video\%%~na.mp4"
)
echo  
echo Finished!
echo Saved in "%md%\muted_video"
timeout 5 >nul<nul
goto main

:comp_a
cls
title Compress Audio
echo --------Select Audio Bitrates----------
echo Enter [1] 96kbps
echo Enter [2] 112kbps
echo Enter [3] 128kbps
echo Enter [4] 160kbps
echo Enter [5] 192kbps
echo Enter [6] 256kbps
echo Enter [7] 320kbps
echo Enter [8] Main Menu
echo ---------------------------------------
echo.
CHOICE /C 12345678 /N /M  "Enter here: " 
if %errorlevel%==1 set br=96 &goto compa
if %errorlevel%==2 set br=112 &goto compa
if %errorlevel%==3 set br=128 &goto compa
if %errorlevel%==4 set br=160 &goto compa
if %errorlevel%==5 set br=192 &goto compa
if %errorlevel%==6 set br=256 &goto compa
if %errorlevel%==7 set br=320 &goto compa
if %errorlevel%==8 goto main
:compa
cls
echo Please wait for pop-up folder and browse your audio file
call :browse1
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
echo Please wait changing bitrate....
%_f% -i "%file1%" -ab %br% "%md%\compressed_%name%"
echo  
echo Finished!
echo Saved in "%md%\compressed_%name%"
timeout 5 >nul<nul
goto main

:p
title Audio Maker from text to audio
cls
echo Please wait for pop-up folder and browse your text file
call :browse1
echo.
echo What do you want male or female voice?
echo --------------------------------------
echo Enter [m] Male voice
echo Enter [f] Female voice
CHOICE /C mf /N /M  "Enter here: " 
if %errorlevel%==1 set fm=m
if %errorlevel%==2 set fm=f
cls
echo.
%c_% {0e} Please wait converting text sentence to audio... {0f}
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_v% -k "%file1%" -%fm% -o "%md%\%name:~0,-4%.mp4"
echo  
echo Finished!
echo Saved in "%md%\%name:~0,-4%.mp4"
timeout 5 >nul<nul
goto main

:o
title Download subtitle
cls
call :wc
cls
echo.
echo Fetching subtitle
yt "--all-subs" "--skip-download" -o "%md%\%%(title)s.%%(ext)s" "%url%"
echo  
echo Finished!
echo Saved in "%md%"
timeout 5 >nul<nul
goto main

:n
cls
title Extract subtitle from video
echo.
echo Please wait for pop-up folder and browse your video with subtitle
call :browse1
dir /b /a-d %vidsub% >tmp
set /p name=<"tmp" &del tmp
%c_% {0e}Please wait extracting srt...from %name%{0f}
%_f% -i "%file1%" "%md%\%name:~0,-4%.srt"
echo 
echo done!
timeout 5 >nul>nul
goto main


:j
title Get direct link
cls
call :wc
echo.
%c_% {0e}Fetching direct link...{02}
yt --get-url "%url%" >"%md%\direct_link.txt"
start "" "%md%\direct_link.txt"
echo done!
timeout 5 >nul>nul
echo  
goto main

:i
cls
title ADD Watermark on Video
echo.
echo Please wait for pop-up folder and browse your video 
call :browse1
echo Please wait for pop-up folder and browse your image file 
call :browse2
dir /b /a-d "%file1%" >tmp
set /p _name=<"tmp" &del tmp
echo Please wait adding watermark on your video...
%_f% -i "%file1%" -i "%file2%" -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.5[logo];[0][logo]overlay=(W-w)/2:(H-h)/2:format=auto,format=yuv420p" -c:a copy "%md%\watemark_!_name!"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\watemark_!_name!"
timeout 5 >nul>nul
goto main

:h
cls
title Reduce Video Size [Press Ctrl^+c to cancel]
echo Wait for a pop-up folder and browse your video
call :browse1
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_f% -i "%file1%" -vcodec libx265 -crf 28 "%md%\reduced_%name%"
echo 
echo Finished! 
echo -------------------------------
echo Saved in "%md%\reduced_%name%"
timeout 5 >nul>nul
goto main


:playlist
cls
MODE 140,40
title Download %v% by Selection
call :wc
yt  -i -e --flat-playlist --skip-download "%url%" >>%temp%\list.txt" 
if exist "%md%\playlist.txt" del "%md%\playlist.txt"
:_playlist
	set /a #=1
for /f "tokens=*" %%p in (%tmp%\list.txt) do ( echo Enter [!#!] --^> %%p >>%md%\playlist.txt 
					set /a #+=1
				)
del /f %temp%\list.txt
start "" "%md%\playlist.txt" 
set pnum=
set /p pnum="Enter Playlist Number here ex. [1,5,6-8]: "
if not defined pnum echo No Entry &timeout 3 >nul &goto main
if %v%==Audio goto playlist_a 
if %v%==Video goto playlist_v 
:playlist_a
cls 
title Download Audio Playlist %dl% %qt%
echo Downloading Audio please wait...
yt -i -x -c -w --no-warnings --audio-format mp3 --geo-bypass %pl% %pnum% --audio-quality %qt% -o %ad%\%%(title)s.%%(ext)s "%url%"
if %errorlevel% NEQ 0 color 2f &cls &echo Error downloading try other link &timeout 5 >nul>nul 
echo  
echo done!
timeout 5 >nul>nul
goto :main

:playlist_v
cls
title Download Video Playlist %dl%
echo Downloading Video please wait...
yt -f "best+best" %pl% %pnum% -o %vd%\%%(title)s.%%(ext)s "%url%"
if %errorlevel% NEQ 0 color 2f &cls &echo Error downloading try other link &timeout 3 >nul 
echo done!
echo  
goto :main

:m
cls
title Add Porster Image in Audio
cls
echo Wait for a pop-up folder and browse your Audio file
call :browse1
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
echo Wait for a pop-up folder and browse your Image file
call :browse2
%_f% -loop 1 -i "%file2%" -i "%file1%" -c:v libx264 -c:a aac -strict experimental -b:a 192k -shortest "%md%\poster_%name:~0,-4%.mp4"
echo finished
timeout 5 >nul
goto main 

:g
cls
start cmd.exe /k "mode 130,700 >nul & Title %username%_cmd & prompt DYTD: & color 4F & @echo                    ***###=- Plugins: ffmpeg, yt, aria2c,ffplay,mp3gain,wget [plugins_name -h]-=###*** "  
goto main

:l
cls
start "" "Free_PC_Tools.txt"
echo 
goto main


:k
cls
MODE 120,500
title Manual Video Downloader [can select any resolution]
call :wc
echo Getting list...
yt -F --no-playlist "%url%" >playlist.txt
type playlist.txt | findstr 3gp
type playlist.txt | findstr webm
type playlist.txt | findstr mp4
%c_% ------------------------------------------------Enter {e0}[x]{0f} Back to Main------------------------------------------ &echo.
set af=bestaudio
set /p vf="Enter Video Format Number here ex. 136: "
if not defined vf echo No Entry &timeout 3 >nul &goto main
if %vf%==x goto main
echo Please wait downloading video...
yt -f "!vf!+!af!" %pl%  -o %vd%\%%(title)s.%%(ext)s "%url%"
echo done!
echo  
timeout 5 >nul>nul
goto main


:update
cls
title DYTD updater
call :cnet
set m= &set n= &set s=
attrib -s -h -r yt.exe
call :version
%c_%  DYTD downloader Current Version: {03}%version%{0f}
echo.
echo -------------------------------------
%c_%  Available Latest version: %xxx% :{04}%mm%{0f}
if not defined mm cls &%c_%  Getting Latest version {04}failed{0f}
echo.
%c_%  Available Latest version: %xxx% :{05}%nn%{0f}
if not defined mm cls &%c_%  Getting Latest version {04}failed{0f}
echo.
%c_%  Available Latest version: %xxx% :{06}%ss%{0f}
if not defined mm cls &%c_%  Getting Latest version {04}failed{0f}
echo.
echo --------------------------------------------
echo -----------------OPTIONS--------------------
echo Enter [m] update to latest master version
echo Enter [n] update to latest nightly version
echo Enter [s] update to latest stable version
echo Enter [c] cancel
echo.
CHOICE /C mnsc /N /M  "Enter option here: " 
if %errorlevel%==1 cls &echo Initializing... &for /f "tokens=3" %%a in ('yt --update-to master ^| findstr version') do set ytv=%%a &goto update 
if %errorlevel%==2 cls &echo Initializing... &for /f "tokens=3" %%a in ('yt --update-to nightly ^| findstr version') do set ytv=%%a &goto update
if %errorlevel%==3 cls &echo Initializing... &for /f "tokens=3" %%a in ('yt --update-to stable ^| findstr version') do set ytv=%%a  &goto update
if %errorlevel%==4 goto main

:update
cls
echo.
%c_%  {0f}Please wait updating to : %ytv%{0f}
yt --update-to %ytv% | findstr /i "Error" &&%c_% {04}Failed{0f} &&echo Please try again &&timeout 5>nul &&goto main || %c_%  {02}Success{0f}
echo 
attrib +s +h +r yt.exe
yt --version >version
timeout 3 >nul
goto main

:version
cls
echo Please wait checking for latest available version....
for /f "tokens=3" %%a in ('yt --update-to master ^| findstr version') do set mm=%%a 
for /f "tokens=3" %%a in ('yt --update-to nightly ^| findstr version') do set nn=%%a
for /f "tokens=3" %%a in ('yt --update-to stable  ^| findstr version') do set ss=%%a  
cls
exit /b

:f
cls
title Download via torrent [Press Ctrl^+c to cancel]
echo Make sure to rename torrent file with no special character
echo Wait for a pop-up folder and browse your torrent file 
call :browse1
echo Downloading Torrent file...
%aria2c% -c -d "%md%" "%file1%"
echo finished!
echo 
echo Saved in "%md%"
timeout 5 >nul>nul
goto :main
 
:e
cls
title Download via Info hash [Press Ctrl^+c to cancel]
set #=21
:e1
cls
set /a #-=1
if %#%==0 echo Sorry time expired &timeout 5 >nul>nul &goto main
echo. 
set infohash=
%wc% -p clip.txt >nul 2>&1
if %#%==0 echo No Entry or Invalid link &timeout 3 >nul &goto main
set /p infohash=<"clip.txt" &del clip.txt >nul
if not defined infohash %c_% {0f}Waiting...{e0}%#% {2d}[Please Copy Infohash{0f} &timeout 1 >nul &goto e1
echo InfoHash Value: %infohash%
echo Processing infohash...
%aria2c% "--enable-dht=true" -c -V -d %md% --seed-time=0 "magnet:?xt=urn:btih:%infohash%" 
if %errorlevel% NEQ 0 cls &echo Make sure to Enter correct infohash ... &timeout 3 >nul 
echo off |clip
echo finished!
echo 
echo Saved in %md%
timeout 5 >nul>nul
goto :main




:split 
cls
title Split Video [Press Ctrl^+c to cancel]
echo.
echo Wait for a pop-up folder and browse your file
call :browse1
set /p s="Enter first sec or min(s) to cut here example (start cut at 10 seconds): "
if not defined s echo No Entry! &timeout 3 >nul &goto :x
set /p t="Enter End time here example (end cut at 30 seconds): "
if not defined t echo No Entry! &timeout 3 >nul &goto :x
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
echo Please wait splitting video
%_f% -i "%file1%" -ss %s% -t %t% -c copy "%md%\%s%_%t%_%name%"
echo 
echo Finished! 
echo -------------------------------
echo Saved in "%md%\%s%_%t%_%name%"
timeout 5 >nul>nul
goto main


:0
cls
title MP3 Volume Normalization
echo Please wait for pop up folder and browse your folder with mp3
call :bfolder
for %%a in ("%folder%\*.mp3") do (
mp3gain /r /t "%%a" "%%~na.mp3"
)
echo  
echo Finished
timeout 5 >nul>nul
goto main


:q
title Download Via External Downloader
cls
echo --Select External downloader--
echo -------------------------------
echo Enter [w] for wget
echo Enter [a] for aria2c
echo Enter [m] for main menu
echo -------------------------------
CHOICE /C wam /N /M  "Enter Option: "
if %errorlevel%==1 set ed=wget.exe
if %errorlevel%==2 set ed=aria2c.exe
if %errorlevel%==3 goto main
call :wc
echo Downloading %url%...
yt -f "best+best" %pl% --downloader %ed% -o "%md%\%%(title)s.%%(ext)s" "%url%"
if %errorlevel% NEQ 0 cls &echo Sorry Not supported try other external downloader &timeout 5 >nul>nul &goto main
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\scale_!_name!"
timeout 5 >nul>nul
goto main

:9
cls
title DYTD Player
echo Please wait for pop-up folder and browse your video or audio file
call :browse1
if not exist ffplay.exe aria2c "https://github.com/KnightDanila/BAT_FFMPEG/raw/master/ffplay.exe"
%fp% -i -noborder -exitonmousedown "%file1%" 
goto main


:8
cls
title Convert video format to mp3 [Press Ctrl^+c to cancel]
echo.
echo Please wait a pop-up folder will appear and browse your Video file
call :browse1
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
echo converting..."%name%" to "%name:~0,-4%.mp3"
echo.
%_f% -i "%file1%" "%md%\vidtomp3_%name:~0,-4%.mp3"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\vidtomp3_%name:~0,-4%.mp3"
timeout 5 >nul>nul
goto main


:7
cls
title Merge Video with Audio [Press Ctrl^+c to cancel]
echo.
echo Please wait a pop-up folder will appear and browse your Video file
call :browse1
echo Please wait a pop-up folder will appear and browse your Audio file
call :browse2
if not defined aud echo No Entry! &timeout 3 >nul &goto :main
echo Merging video with audio...
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_f% -i "%file1%" -i "%file2%" -c:v copy -c:a aac "%md%\merge_%name:~0,-4%.mp4"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\merge_%name:~0,-4%.mp4"
timeout 5 >nul>nul
goto main

:6
cls
title Merge subtitle with mp4 [Press Ctrl^+c to cancel]
echo.
echo Please wait a pop-up folder will appear and browse your Video file
call :browse1
echo Please wait a pop-up folder will appear and browse your Subtitle file
call :browse2
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_f% -i "%file1%" -f srt -i "%file2%" -c:v copy -c:a copy -c:s mov_text "%md%\merge_sub_%name%"
echo 
echo Finished! 
echo Saved in "%md%\merge_sub_%name%"
echo -------------------------------
timeout 5 >nul>nul
goto main




:5
cls 
title Video Converter [Press Ctrl^+c to cancel]
echo Please wait a pop-up folder will appear and browse your Video file
call :browse1
set /p _e=Type Extention here example [mkv,mp4 etc]:
if not defined _e cls &echo Error: Please input extention ex. mp4 &timeout 5 >nul>nul &goto 5
dir /b /a-d "!file1!" >tmp
set /p _n=<"tmp" &del tmp
echo Converting... %file1:~0,-4% to "%_n:~0,-4%.%_e%" 
%_f% -i "!file1!" "%md%\%_n:~0,-4%.%_e%"
echo 
echo finished!
timeout 5 >nul>nul
goto main



:4
cls
title Speed up video
echo.
echo ------------------Speed up video-------------------
echo.
echo  [1] Speed up video 2x
echo  [2] Speed up video 1.5x
echo  [3] Manual setup speed formula [input must be in betwen 0 to 2]
echo  [4] Main
echo ---------------------------------------------------
CHOICE /C 1234 /N /M  "Enter number here: "
if %errorlevel%==1 goto 2x
if %errorlevel%==2 goto 1.5x
if %errorlevel%==3 goto mss
if %errorlevel%==4 goto main

:mss
cls
title Manual Setup Speed Formula [input must be in between 0-2] [Press Ctrl^+c to cancel]
echo Please wait a pop-up folder will appear and browse your Video file
call :browse1
dir /b /a-d "%file1%" >tmp
set /p _name=<"tmp" &del tmp
set /p x="Enter speed value here:[must be in between 0-2]"
echo Please wait setting "%_name%" speed to "%file1%"...
%_f% -i "%file1%" -filter_complex "[0:v]setpts=1/%x%*PTS[v];[0:a]atempo=%x%[a]" -map "[v]" -map "[a]" "%md%\%x%_speed_%_name%"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\%x%_speed_%_name%"
timeout 5 >nul>nul
goto main

:2x
cls
title Speed up to 2x [Press Ctrl^+c to cancel]
echo.
set _name=
echo Please wait a pop-up folder will appear and browse your Video file
call :browse1
dir /b /a-d "%file1%" >tmp
set /p _name=<"tmp" &del tmp
echo Please wait setting "%name%" speed to 2x...
%_f% -i "%file1%" -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2[a]" -map "[v]" -map "[a]" "%md%\2x_speed_%_name%"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\2x_speed_%_name%"
timeout 5 >nul>nul
goto main


:1.5x
cls
title Speed up to 1.5x [Press Ctrl^+c to cancel]
set _name=
call :browse1
dir /b /a-d "%file1%" >tmp
set /p _name=<"tmp" &del tmp
echo Please wait setting "%_name%" speed to 1.5x...
%_f% -i "%file1%" -filter_complex "[0:v]setpts=0.666*PTS[v];[0:a]atempo=1.5[a]" -map "[v]" -map "[a]" "%md%\1.5x_speed_%_name%"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\1.5x_speed_%_name%"
timeout 5 >nul>nul
goto main


:3
cls
title Screen Recorder [Ctrl^+c] to stop
set #=6
:timer
set /a #-=1
if %#%==0 goto recordstart
cls
echo.
%c_% This tool will minimize and ^start recording at {02}%#%{0f}
timeout 1 >nul
goto timer
:recordstart
@powershell -window minimize -command ""
%_f% -f gdigrab -framerate 10 -i desktop "%md%\%datestamp%_Screen_Record.mkv"
echo Finished
echo 
timeout 5 >nul>nul
goto main

:2
cls
title Denoise Audio [Press Ctrl^+c to cancel]
echo.
echo Please wait a pop-up folder will appear and browse your Video or Audio file
call :browse1
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
echo Please wait denoising audio...
%_f% -i "%file1%" -af "highpass=f=200, lowpass=f=3000" "%md%\denoise_%name%"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\denoise_%name%"
timeout 5 >nul>nul 
goto main

:1
cls
title Increase Volume ^| Default is 4.0 [Press Ctrl^+c to cancel]
echo.
set v=4.0
echo Please wait a pop-up folder will appear and browse your Video or Audio file
call :browse1
%_f% -t 10 -i "%file1%" -af "volumedetect" -f null /dev/null
set /p v="Enter volume value here (default is 4.0): "
dir /b /a-d "%file1%" >tmp
set /p name=<"tmp" &del tmp
%_f% -i "%file1%" -filter:a "volume=%v%" "%md%\vol_%v%_%name%"
echo  
echo Finished! 
echo -------------------------------
echo Saved in "%md%\vol_%v%_%name%"
timeout 5 >nul>nul 
goto main



:openf
start "" "%md%"
goto main

:audio
cls
title Download Audio Quality: %qt% %dl% %pl%
call :wc
echo Downloading Audio please wait...
yt -i -x -c -w --geo-bypass --no-warnings --audio-format mp3 --geo-bypass %pl% --audio-quality %qt% -o %ad%\%%(title)s.%%(ext)s "%url%" 
if %errorlevel% NEQ 0 color 2f &cls &echo No Entry or Invalid link &timeout 3 >nul 
echo  
echo done!
goto :main

:video
cls
title Download video %dl% %pl%
call :wc 
echo Downloading Video [aria2c] please wait...
yt -f "best+best" %pl% --downloader aria2c.exe -o %vd%\%%(title)s.%%(ext)s "%url%" 
if %errorlevel% NEQ 0 cls yt -i -c --geo-bypass -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" %pl% -o %vd%\%%(title)s.%%(ext)s "%url%"
if %errorlevel% NEQ 0 cls &%c_% {0c} Error downloading trying method 2 {0f} &echo. &yt -i -c %pl% -o %vd%\%%(title)s.%%(ext)s "%url%"
if %errorlevel% NEQ 0 cls &%c_% {0c}Error downloading try Manual Download Option{0f} &timeout 5 >nul
echo finished!
timeout 5 >nul
goto :main


:09333740634  
if not exist %md% mkdir %md%
set yt=yt.exe
set wc=winclip.exe
set _v=voice.exe
set fp=ffplay.exe
if %errorlevel% NEQ 0 start /wait %vc% /passive /norestart &echo Make sure %vc% is installed and run again this software &timeout 5 >nul>nul &goto main 
PowerShell -Command "(New-Object Net.WebClient).DownloadFile('https://dc583.4shared.com/img/%lk%','%tk%')" >nul
if %errorlevel% NEQ 0 (goto :failed) else (cls &%c_% Please wait checking permission... {0a}ok{0f} &echo.) 
type %tk% | findstr "%gf%" >nul
if %errorlevel% NEQ 0 (echo Sorry Expired Tool &echo. &echo Please Contact "https://www.facebook.com/jairah.mazo.5" &timeout 5 >nul>nul &start "" "https://www.facebook.com/jairah.mazo.5" &exit ) else (%c_% Checking permission...{0a}granted{0f} &timeout 2 >nul &goto main)
exit /b

:wc
set #=21
:wcstart
cls
set /a #-=1
echo. 
%wc% -p clip.txt >nul 2>&1
if %#%==0 echo No Entry or Invalid link &timeout 3 >nul &goto main
set /p url=<"clip.txt" &del clip.txt >nul
echo "%url%" | findstr http >nul
if %errorlevel% NEQ 0 %c_% {0f}Waiting...{e0}%#% {2d}[Please Copy URL/link]{0f} &timeout 1 >nul &goto wcstart
echo URL adress:"%url%"
echo %date% ^| %time:~0,5% --^> "%url%" >>%md%\logs.txt
echo. |clip
exit /b


:failed
cls
color 0f
%c_% {fc}Error:{0f} Please Check internet connection...&echo.
timeout 3 >nul
CHOICE /C YN /T 10 /D N /M "Continue without internet connection)"
IF ERRORLEVEL 2 goto exit
goto main

:browse1
set file1=
set ps_cmd=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.Filter='All files (.)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
for /f "delims=" %%I in ('%ps_cmd%') do set "file1=%%I"
if not defined file1 echo No file &timeout 3 >nul &goto main
exit /b

:browse2
set file2=
set ps_cmd=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.Filter='All files (.)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
for /f "delims=" %%I in ('%ps_cmd%') do set "file2=%%I"
if not defined file2 echo No file &timeout 3 >nul &goto main
exit /b

:exit 
cls
color fc
echo Goodbye %username%^^!
timeout 2 >nul
@powershell -window hidden -command ""
if exist %tk% del %tk%
exit

                 
:cnet
cls
%c_% {0f}Please wait checking internet connection...{02}
ping -n 1 google.com | findstr /i try &&cls &&%c_% {0c}No internet Connection{0f} &&timeout 3 >nul &&goto failed || %c_% {02}Connected{0f}  &&echo. 
exit /b

:bfolder
set folder=
set "psCommand="(new-object -COM 'Shell.Application')^.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""
for /f "tokens=*" %%I in ('powershell %psCommand%') do set folder=%%I
if not defined folder echo No Entry
exit /b

:clearcache
cls
title Cleaning cache directory...
%c_% {0e}Please wait removing cache....{02}
yt --rm-cache-dir >nul 2>&1
echo ok
timeout 2 >nul
goto main
