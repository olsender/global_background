" Plugin changes the background globally.
" Introduces two commands: Dark and Light.
" After changing the background with those commands all new vim instances will
" open with the same background.

fu! SetViminfo()
    " add '!' to viminfo if it lacks
    let info = split(&viminfo, ',')
    let ok=0
    for v in info
        if v == '!'
            let ok = 1
        endif
    endfor
    if ok == 0
        let sinfo = join(info+['!'], ',')
        execute "set viminfo=".sinfo
    endif 
endfu

fu! SetBackground(light)
    let g:BACKGROUND=a:light 
    execute "set background=".g:BACKGROUND
    wviminfo
endfu

command! Light :call SetBackground('light')
command! Dark :call SetBackground('dark')

call SetViminfo()

if !exists("g:BACKGROUND")
    let g:BACKGROUND = &background
endif
autocmd VimEnter * call SetBackground(g:BACKGROUND)

