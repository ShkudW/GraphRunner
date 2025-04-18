# GraphRunner-uptaded-version
Updated version of the Invoke-SearchSharePointAndOneDrive function



In the original script, when we executed the function 
"Invoke-SearchSharePointAndOneDrive" - along with the argument -PageResults, the script would search for the word endlessly across all pages - this would take hours.
I updated the script to limit the number of pages we wanted to search

Just use the new MaxPages argument instead.

```powershell.exe
Invoke-SearchSharePointAndOneDrive -Tokens $tokens -SearchTerm "credentials AND filetype:txt" -MaxPages 10
```

# Helper.ps1:

In addition, I added a small script - for help (works only with TXT file extraction)

The script searches the files downloaded to your computer for the word you searched for in SharePoint  and displays the word in the console along with the rest of the sentence to which it is associated.

It is important that all the TXT files you downloaded are in the same folder, as a separate folder!

```powershell.exe
.\Helper.ps1 -FolderPath .\Global\ -SearchTerm credentials
```
