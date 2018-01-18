# PortableApps.comInstaller_Download-MOD

The original PortableApps.comInstaller has a DownloadUrl cap of 2, meaning you can only download 2 files with DownloadUrl and Download2Url. This mod increases this cap to 10.

How to do this mod on a future release:
Open in Notepad++ the file "PortableApps.comInstaller\App\installer\PortableApps.comInstaller.nsi" search for every instance of "Download2". It is almost always in a If else codeblock. Copy this block into a new notepad++ and replace every instance of Download2 with Download##. Do the same for Downloaded2, Downloaded-2, and Downloaded-22, keeping the part before the number. So Downloaded2 becomes Downloaded##, Downloaded-2 becomes Downloaded-22, and Downloaded-22 becomes Downloaded-####. The idea for ## is every instance of 2 becomes ## so when we do the replace command, it will replace ## with a different number.

Now paste your modified codeblock back underneath the original codeblock, then replace ## with the next number. If you paste under Download2 then you will replace with 3.   If you paste under Download3 then you will replace with 4 and so on and so forth. Make sure you don't mess up the syntax of the code. Do this for as many downloads as you need. There are several sections that need this, so it would be time consuming to document each change. If you want to see the changes, you can copy paste the contents of the original file and the modified file into a website like https://text-compare.com/. There you can see where I made my changes and you can figure it out from there.

There is another file you need to change as well, and it is found at "PortableApps.comInstaller\Other\Source\InstallerWizard.nsi". This file is much easier to mod as there is less to change. Just do the same as above and you will be fine.

To verify you got every entry, find every instance of "Download2" and "Download3" by clicking the count button and make sure the number is the same on both files. If the numbers are the same, but your mod didn't work, its because you messed up the syntax.  If the numbers are different, you missed a section.

Once you have modded both files, you will need to open a command prompt with the following command:
```
cd /d P:\PortableApps\PortableApps.comInstaller\App\nsis\
makensis.exe "C:\Users\BetaL\Desktop\PortableApps.comInstaller\Other\Source\InstallerWizard.nsi"
```
Now, if you did everything correctly, then you just bumped up the number of downloads. 
