/set regexp_name=\b(Kevin|Loki|Ciara|Minori|Mi|Min|Minnow|Jericho|Jerk)\b
/def name_hilite = /eval -s0 /def -F -p1 -P0u -mregexp -t"%{regexp_name}" name_hilite
/name_hilite

/set regexp_page=(?:\
Long distance to .+?:.+|\
(?:\(.+?\) )?From afar.*?,.+|\
You paged .+|\
(?:To )?(?:\(.+\),? )?\w+ pages.*?:.+\
)
/def page_hilite = /eval -s0 /def -F -p5 -ahCcyan -mregexp -t"%{regexp_page}" page_hilite
/page_hilite

/set regexp_chat=(\
\[[-\w ]{1,24}\] .*|\
\<[-\w ]{1,24}\> .*|\
Faction: \[[-\w ]{1,24}\] .*)

/set regexp_nopagechat=(?:\
(?:\
Long distance to .+?:.+|\
(?:\(.+?\) )?From afar.*?,.+|\
You paged .+|\
(?:To )?(?:\(.+\),? )?\w+ pages.*?:.+\
)|\
(\
\[[-\w ]{1,24}\] .*|\
\<[-\w ]{1,24}\> .*|\
Faction: \[[-\w ]{1,24}\] .*))

; CTRL-X-P will limit my input to only pages
/def -b'^x^p'=/limit -mregexp %{regexp_page}

; CTRL-X-T limits my input to only channel chatter
/def -b'^x^t'=/limit -mregexp %{regexp_chat}

; CTRL-X-R limits my input to non-page non-channel content.
/def -b'^x^r'=/limit -v -mregexp %{regexp_nopagechat}

; CTRL-X-N limits my input to only output with my names.
/def -b'^x^n'=/limit -mregexp %{regexp_name}

; CTRL-X-X unlimits everything
/def -b'^x^x'=/unlimit

