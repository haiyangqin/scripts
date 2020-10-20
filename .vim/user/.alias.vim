iab hym //modified by Hy <C-R>=strftime("%y/%m/%d %R")<cr>
iab hya //added by Hy <C-R>=strftime("%y/%m/%d %R")<cr>
iab al_ <ESC>:r ~/.vim/user/always.sv<cr>kddwww

"################### set file header ###################
autocmd BufNewFile *.v,*.sv,*.vh,*.h exec ":call Setfileheader()" 

func Setfileheader()

call append (0, '//////////////////////////////////////////////////////////')
call append (1, '// Coryright (C) 2018, xxxx Corp. Confidential Prorietary.')
call append (2, '// All Rights Reserved.                                   ')
call append (3, '//                                                        ')
call append (4, '// Filename    : ' .expand("%")                            )
call append (5, '// Author      : Hyqin                                    ')
call append (6, '// Mail        : qhy0413@163.com                          ')
call append (7, '// Revise      : ' .strftime("%Y/%m/%d %R")                )
call append (8, '// Revision    : 0.0.0                                    ') 
call append (9, '// -------------------------------------------------------') 
call append (10,'// Description :                                          ') 
call append (11,'//                                                        ') 
call append (12,'//                                                        ') 
call append (13,'// -------------------------------------------------------') 
call append (14,'//////////////////////////////////////////////////////////')

endfunc

nmap <a-a> :call Setfileheader()<CR>:10<CR>o
