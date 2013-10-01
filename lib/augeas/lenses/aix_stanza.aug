
module AIX_stanza =

let comment = Util.comment_generic /[ \t]*\*[ \t]*/ "* "

let empty = Util.empty_generic /[ \t]*\*?[ \t]*/
let indent = del Rx.opt_space "        "

let record =
     let section = label "section" . store /[^:=*\r\n]+/ . Sep.colon . Util.eol
   in let entry = indent . Build.key_value_line Rx.word Sep.space_equal (store Rx.space_in?)
  in [ section . (entry|comment|empty)* ]

let lns = (comment|empty)* . record*


