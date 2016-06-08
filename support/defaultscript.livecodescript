script "community.livecode.pgmcclernan.tennotchknob.__DefaultScript"

local tNotchPos

on mouseDown
   put the mouseLoc into theStartLoc
   put 30 into moveTolerance
   repeat until the mouse is "up"
      get the mouseLoc
      -- put it
      if item 1 of it > ((item 1 of theStartLoc)+moveTolerance) or item 2 of it < ((item 2 of theStartLoc)-moveTolerance) then 
         put it into theStartLoc
         add 1 to tNotchPos
         if tNotchPos > 10 then 
            put 10 into tNotchPos
         end if
      set the notchNum of me to tNotchPos
      end if
      if item 1 of it < ((item 1 of theStartLoc)-moveTolerance) or  item 2 of it > ((item 2 of theStartLoc)+moveTolerance) then
         put it into theStartLoc
         subtract 1 from tNotchPos
         if tNotchPos < 0 then 
            put 0 into tNotchPos
         end if
      set the notchNum of me to tNotchPos
      end if
      -- put "  Start Loc = " & theStartLoc && tNotchPos  after msg
   end repeat
end mouseDown

on mouseLeave
  send mouseUp to me
end mouseLeave
