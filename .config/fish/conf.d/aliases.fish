function setclip -d "Copy to Clipboard"
    xclip -selection c $argv
end 

function getclip -d "Paste from Clipboard"
    xclip -selection c -o $argv
end 
