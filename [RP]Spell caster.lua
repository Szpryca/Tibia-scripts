strikeSpells = {"exori gran con", "exori con"}
 
--Square range you can shoot your spells
castRange = 7
 
--will only cast if mana percent is this or above
manaPercentToCast = 10
 
--Whether you want automatic casts to be on when you start the script
castingSpells = true
 
enableHotkey = 35 -- 35 = END, 36 = HOME
 
--------------------------------------------
--[[ ----- Script -- No need to edit ---- ]]
--------------------------------------------
Module.New('saySpell', function(saySpell)
    if( castingSpells ) then
        local curTargetID = Self.TargetID()
        if( curTargetID ~= 0 ) then
            local enemyPos = Creature.New(curTargetID):Position()
            local manaPercent = math.floor(( Self.Mana() * 100 ) / Self.MaxMana())
            if( Self.DistanceFromPosition(enemyPos.x, enemyPos.y, enemyPos.z) <= castRange and
                Self.Position().z == enemyPos.z and manaPercent >= manaPercentToCast ) then
                for spellIndex = 1, #strikeSpells do
                    if( Self.CanCastSpell(strikeSpells[spellIndex] ) ) then
                        Self.Cast(strikeSpells[spellIndex] )
                        break
                    end
                end
            end
        end
    end
end)
 
if not Hotkeys.Register(enableHotkey) then
    print("Could not enable hotkey, check that enableHotkey (" .. enableHotkey .. ") is valid.")
end
 
function pressHandler(key, control, shift)
    if( castingSpells ) then
        print("Pausing Spell Caster")
        castingSpells = false
    else
        print("Starting Spell Caster")
        castingSpells = true
    end
end
Hotkeys.AddPressHandler(pressHandler)