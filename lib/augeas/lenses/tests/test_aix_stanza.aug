module Test_aix_stanza =

    let conf = "* comment
* another comment
*

section_title:
  key = value
  otherkey = other_value

  foo = bar with space
 * in comment

empty_section:

/path/to/some/fi le:
"

    test AIX_stanza.lns get conf =
        { "#comment" = "comment" }
        { "#comment" = "another comment" }
        { }
        { }
        { "section" = "section_title"
          { "key" = "value" }
          { "otherkey" = "other_value" }
          { }
          { "foo" = "bar with space" }
          { "#comment" = "in comment" }
          { } }
        { "section" = "empty_section"
          { } }
        { "section" = "/path/to/some/fi le" }

