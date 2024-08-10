#let note(identifier, content) = {
  text[
    #figure[
      #grid(columns: (20pt, auto),
        align(left, text(style:"italic", [#eval("@"+identifier, mode: "markup")])),
        align(left, text(style:"italic", size: 9.5pt, content))
      )] #label(identifier)
  ]
}
