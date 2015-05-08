; ########################################
; ## PLUGINS
; ########################################

; Change the status bar.
/load -q activity_status.tf

; ESC+TAB for tab completion.
/load -q completion.tf

; Use keyboard stacks to push text into a stack for a temporary period.
; ESC-DOWN will store data in the stack. ESC-UP will recall it, and (if
; necessary) push the current line to the bottom of the stack.
/load -q ~/tflib/kbdoublestack.tf

; This will make ESC-W foreground the world with the most recent activity.
/load -q worldqueue.tf

; This will allow you to connect to IRC worlds.
/load -q irc.tf

; ########################################
; ## CONFIGURATION
; ########################################

; Set the size of the input window
/set isize=7

; Turn off the regexp message about curly braces.
/set warn_curly_re=off

; Turn off the indent on wrapped lines.
/set wrapspace=1

; Set the text to wrap at 100 characters.
/set wrapsize=100

; Set the history size to something really big.
/set histsize=99999

; Have TinyFugue pause when there is more activity than there is screen size.
/set more=on

; Turn off the annoying ===== message.
/set textdiv=off

; ########################################
; ## WORLDS
; ########################################

; If we haven't already loaded our .tfworlds file, load it now.
/if ( worldsLoaded !~ "loaded" ) \
    /require -q ~/tflib/worlds.tf%; \
    /set worldsLoaded=loaded%; \
/endif

; ########################################
; ## HOOKS
; ########################################

; Log automatically when a world is connected.
/def -p1 autolog = /log -w%1 OFF %;  /sys mkdir -p ~/log/%1 %; /log -w%1 ~/log/%1/$[ftime("%F", time()+3600)].log %; /at 23:59 /autolog %1
/def -p0 -hCONNECT log_all = /eval /autolog ${world_name}

; Resize automatically when the window is resized.
/def resize= \
    /let width=$[columns()]%; \
    /if ({width} > 100 ) /let width=100%; /endif%; \
    /wrap %{width}%;
/def -h"RESIZE" = /resize

; ########################################
; ## TRIGGERS
; ########################################

;/set regexp_whisper=^(\
;[-\w ]+ senses \"[-\w ]+ test\"|\
;[-\w ]+ whispers \".*\"|\
;You sense [-\w ]+ .*|\
;[-\w ]+ whispers something to [-\w ]+\.|\
;[-\w ]+ and [-\w ]+ sense \".*\"|\
;([-\w ]+, ){2,}and [-\w ]+ sense \".*\"|\
;([-\w ]+, )+[-\w ]+ sense \".*\"|\
;[-\w ]+ whispers \".*\")$


/load ~/tflib/hilights.tf

;/def whisper_hilite = /eval -s0 /def -p6 -F -PhCgreen -mregexp -t"%{regexp_whisper}" whisper_hilite
;/whisper_hilite


; ########################################
; ## MACROS
; ########################################

; CTRL-LEFT goes left one word
/def -b'^[[D'=/dokey WLEFT

; CTRL-RIGHT goes right one word
/def -b'^[[C'=/dokey WRIGHT

; /ls performs a /listsockets command
/def ls=/listsockets

; /. will collect the contents of an attribute and put it in the input buffer for
; editing.  Really, this is a replacement for /grab.
; USAGE: /. <object>/<attribute>
/def .=/set tester=$[rand()] %;/def -mregexp -n1 -ag -t"%{tester}>(.*)" autoedit=/input %%P1 %;/if ({#} < 1) /send @force me={@pemit[switch(version(),Rhost*,/noansi,Penn*,/silent,)] me=%{tester}>&%{attr} %{object}=%%[get(%{object}/%{attr})]} %; /elseif (regmatch('/',{*})) /set object=%PL %; /set attr=%PR %; /send @force me={@pemit[switch(version(),Rhost*,/noansi,Penn*,/silent,)] me=%{tester}>&%{attr} %{object}=%%[get(%*)]} %; /else /set attr=%* %; /send @force me={@pemit[switch(version(),Rhost*,/noansi,Penn*,/silent,)] me=%{tester}>&%{attr} %{object}=%%[get(%{object}/%{attr})] %; /endif

; /unidle sends a ping every 10 minutes to keep me alive.
; USAGE: /unidle <world>
/def unidle=/send THINK%; /repeat -w%1 -600 1 /unidle %1

; Gentoo keymaps are a little different from windows. Include
; the following for compatibility with ALT-LEFT, ALT-RIGHT,
; CTRL-LEFT, and CTRL-RIGHT.
/def -b'^[O3D' = /dokey SOCKETB
/def -b'^[O3C' = /dokey SOCKETF
/def -b'^[0c'  = /dokey WRIGHT
/def -b'^[O5C' = /dokey WRIGHT
/def -b'^[O5c' = /dokey WRIGHT
/def -b'^[0d'  = /dokey WLEFT
/def -b'^[O5D' = /dokey WLEFT
/def -b'^[O5d' = /dokey WLEFT

; ########################################
; ## GAGS
; ########################################
/def -p0 -ag -mglob -t'SAVE:*' 
/def -p0 -ag -mglob -t'GAME: *Database*' 
/def -p0 -ag -mglob -t'<DB>*' 
/def -p0 -ag -mglob -t'Database checkpoint*' 
/def -p0 -ag -mglob -t'<<Database saving.>>' 
/def -p0 -ag -mglob -t'<<Finished.>>' 
/def -p0 -ag -mglob -t'\[GAME\] Yarr! We be savin\' now!!' 
/def -p0 -ag -mglob -t'\[GAME\] The savin\' be complete! Back to yer pillagin\', me hearties!'

/def emit=/send @emit %{*}

