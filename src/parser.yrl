Terminals equals open close slash string identifier. 
Nonterminals tree tag tags orphan_tag paired_tag attributes attribute opening_tag closing_tag.
Rootsymbol tree.

tree ->
    tag : '$1'.

tags ->
    tag : '$1'.
tags ->
    tags tag : ['$1' | '$2'].

tag ->
    orphan_tag : '$1'.
tag ->
    paired_tag : '$1'.

orphan_tag ->
    open identifier slash close : {v('$2'), #{}, []}.
orphan_tag ->
    open identifier attributes slash close : {v('$2'), '$3', []}.

paired_tag ->
    opening_tag closing_tag : paired_tag('$1', [], '$2').
paired_tag ->
    opening_tag tags closing_tag : paired_tag('$1', '$2', '$3').

opening_tag ->
    open identifier close : {v('$2'), #{}}.
opening_tag ->
    open identifier attributes close : {v('$2'), '$3'}.

closing_tag ->
    open slash identifier close : {'$2'}.

attributes ->
    attribute : '$1'.
attributes ->
    attributes attribute : maps:merge('$1', '$2').

attribute ->
    identifier : #{v('$1') => nil}.
attribute ->
    identifier equals string : #{v('$1') => v('$3')}.


Erlang code.

v({_, _, Value}) -> Value.

paired_tag({OpeningName, Attributes}, Children, ClosingName) ->
    {OpeningName, Attributes, Children}.
