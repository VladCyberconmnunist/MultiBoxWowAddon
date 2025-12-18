local  succesLoadAddon = CreateFrame("Frame")
succesLoadAddon:RegisterEvent("PLAYER_ENTERING_WORLD")
succesLoadAddon:SetScript("OnEvent", function() print("Multibox addon is loaded!")
    local playerName = GetUnitName("player")
    -- print(playerName)
    if playerName == "Nergn" or playerName == "Nergt" or playerName == "Nergtr" or playerName == "Nergf" or playerName == "Nergfv"  then
    print("Hello My Allys Rogue!")
    local ShamyNames =
    {
        [1]="Nergn",
        [2]="Nergt",
        [3]="Nergtr",
        [4]="Nergf",
        [5]="Nergfv",
    }
    for k,v in ipairs(ShamyNames) do
    local multiadd = "Multi"..k..""
    local multiadd = CreateFrame("Button", multiadd, UIParent, "SecureActionButtonTemplate")
    multiadd:RegisterForClicks("AnyUp")
    multiadd:SetAttribute("type", "macro")
    multiadd:SetAttribute("macrotext", "/follow "..v.."\n/assist "..v.."\n/cast [mod:lctrl] Shadowstep\n/cast [mod:lshift] Shadow dance")
    print("Succes")
end
local frame1 = CreateFrame("Frame", nil, nil, "SecureHandlerStateTemplate")
frame1:SetAttribute("_onstate-actbar", [[
 if newstate == "actbarone" then
self:SetBindingClick(false, "F", "Multi1")
elseif newstate == "actbartwo" then
self:SetBindingClick(false, "F", "Multi2")
elseif newstate == "actbarthree" then
self:SetBindingClick(false, "F", "Multi3")
elseif newstate == "actbarfr" then
self:SetBindingClick(false, "F", "Multi4")
elseif newstate == "actbarfv" then
self:SetBindingClick(false, "F", "Multi5")
 end
]])
RegisterStateDriver(frame1, "actbar", "[actionbar:1] actbarone;[actionbar:2] actbartwo;[actionbar:3] actbarthree;[actionbar:4] actbarfr;[actionbar:5] actbarfv;")
local gtQuestMacrs = CreateFrame("Button", "gtQuestMacrs", UIParent, "SecureActionButtonTemplate")
gtQuestMacrs:RegisterForClicks("AnyUp")
gtQuestMacrs:SetAttribute("type", "macro")
gtQuestMacrs:SetAttribute("macrotext", "/script SelectGossipAvailableQuest(1)\n/script CompleteQuest()\n/script GetQuestReward()\n/script SelectGossipOption(1)\n/script AcceptQuest()\n/script GetQuestReward(1)\n/script SelectGossipActiveQuest(1)")
SetOverrideBindingClick(gtQuestMacrs, false, "ALT-Z", "gtQuestMacrs")
-------------------------------------------bind key interact to frame----------------------------------------------------------------------
SetOverrideBinding(gtQuestMacrs, false, "ALT-F", "INTERACTTARGET")
-- SetOverrideBinding(gtQuestMacrs, false, "BUTTON4", "TOGGLEAUTORUN")
------------------------------------------------Create function for frames fabric--------------------------------------------------------------
local function CrtFrameToBind(nameoFrame,bindKey,macText)
    local idnameoframe = "IdFrmBtn"..nameoFrame
    local nmeBtn="Btn"..nameoFrame
    local idnameoframe = CreateFrame("Button", nmeBtn, UIParent, "SecureActionButtonTemplate")
    idnameoframe:RegisterForClicks("AnyUp")
    idnameoframe:SetAttribute("type","macro")
    idnameoframe:SetAttribute("macrotext",macText)
    SetOverrideBindingClick(idnameoframe,true,bindKey,nmeBtn)
end

------------------------------------------------Table of binds buttons----------------------------------------------------------------

local MyBindsBtnsTable =
{
 --------------------------------Name of frame and button,keys to bind,macros-------------------------------------------------------------------   
 [1]={"1","/cast [mod:lalt] Eviscerate\n/cast [stealth] Sap; Sinister Strike"},
 [2]={"2","/cast [mod:lctrl] Kick\n/cast [mod:lalt] Kidney Shot\n/cast [stance] Cheap Shot; [nomod,nostance] Shiv"},
 [3]={"CTRL-Z","/script AcceptGroup()\n/script AcceptQuest()\n/script AcceptTrade()\n/script RetrieveCorpse()\n/script RepopMe()\n/click StaticPopup1Button1"},
 [4]={"SHIFT-Z","/script QuestLogPushQuest()"},
 [5]={"CTRL-SHIFT-Z","/click QuestLogFrameAbandonButton\n/click StaticPopup1Button1\n/script QuestFrameCloseButton:Enable()\n/click QuestFrameCloseButton\n/click GossipFrameCloseButton"},
 [6]={"ALT-SHIFT-Z","/invite"},
 [7]={"E","/cast [mod:lalt] Rupture\n/cast [nostealth] Stealth\n/cast [stealth] Sinister Strike; Sinister Strike"},
 [8]={"3","/castsequence [nomod] reset=5 Premeditation,Shadowstep,Ambush,Eviscerate\n/castsequence [mod:alt] reset=5 Premeditation,Shadowstep,Garrote,Hemorrhage,Rupture"},
 [9]={"SHIFT-S","/cast Cloak of Shadows"},
 [10]={"R","/cast [mod:lctrl] Dismantle\n/cast [mod:lshift] Preparation\n/cast [nomod] Gouge; [mod:alt] Throw"},
 [11]={"CTRL-W","/cast Sprint"},
}
---------------------------------------------Loop for creating frames----------------------------------------------------------
for k,v in ipairs(MyBindsBtnsTable) do
-- print("k: "..k.." v[1]:"..v[1].." v[2]: "..v[2].."")
CrtFrameToBind(k,v[1],v[2])
end
    end
end)

-----------------------------New Commentary-----------------------------