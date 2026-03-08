--
-- LevelRange :: Main Lua File
-- Copyright (c) 2006 Philip Hughes (Bull3t)
--
-- Shows the zone level range on the World Map.
--
-- Thanks to Dhask for allowing the use of his FlightMap.
--
-- An unlimited license to use, reproduce and copy this work is granted, on
-- the condition that the licensee accepts all responsibility and liability
-- for any damage that may arise from the use of this AddOn.
--
--------------------------------------------------------------------------------------------------
-- Global Variables
--------------------------------------------------------------------------------------------------

-- Name
LEVELRANGE_NAME     = "LevelRange"

-- Version Number
LEVELRANGE_VERSION  = "2.2.0";

-- Details
Details = {
    name            = LEVELRANGE_NAME,
    version         = LEVELRANGE_VERSION,
    releaseDate     = "Feb 19, 2024",
    author          = "Bull3t, Tenyar97, rado-boy, blehz.",
    email           = "",
    website         = "https://github.com/Tenyar97/LevelRange-Turtle",
    category        = MYADDONS_CATEGORY_MAP,
    optionsframe    = "LevelRangeOptionsFrame"
};

-- Help
Help = {
    [1] = LEVELRANGE_HELP0 .. "\n" .. LEVELRANGE_HELP1 .. "\n" .. LEVELRANGE_HELP2 .. "\n" .. LEVELRANGE_HELP3 .. "\n" .. LEVELRANGE_HELP4 .. "\n" .. LEVELRANGE_HELP5 .. "\n" .. LEVELRANGE_HELP6,
};

-- Player Info
playerName = UnitName("player");
realmName  = GetRealmName();

-- Default Variables
LevelRangeSettings              = {};
DEFAULT_LEVELRANGE_SHOW         = true;
DEFAULT_LEVELRANGE_SHOWINSTANCE = true;
DEFAULT_LEVELRANGE_SHOWRAIDS    = true;
DEFAULT_LEVELRANGE_SHOWPVP      = true;

-- Realm|PlayerName
LEVELRANGE_REALMPLAYERNAME = realmName .. "|" .. playerName

-- Slash Commands
LEVELRANGE_SLASH1 = "lr"
LEVELRANGE_SLASH2 = "levelrange"

-- Faction Types
local lTYPE_HORDE       = LEVELRANGE_HORDE;
local lTYPE_ALLIANCE    = LEVELRANGE_ALLIANCE;
local lTYPE_CONTESTED   = LEVELRANGE_CONTESTED;

-- Level Ranges
LEVELRANGE_RANGES = {
    [LEVELRANGE_ELWYNN]                 = { 1, 10, lTYPE_ALLIANCE},
    [LEVELRANGE_DUNMOROGH]              = { 1, 10, lTYPE_ALLIANCE},
    [LEVELRANGE_TIRISFAL]               = { 1, 10, lTYPE_HORDE},
    [LEVELRANGE_LOCHMODAN]              = {10, 20, lTYPE_ALLIANCE},
    [LEVELRANGE_SILVERPINE]             = {10, 20, lTYPE_HORDE},
    [LEVELRANGE_WESTFALL]               = {10, 20, lTYPE_ALLIANCE},
    [LEVELRANGE_REDRIDGE]               = {15, 25, lTYPE_CONTESTED},
    [LEVELRANGE_DUSKWOOD]               = {18, 30, lTYPE_CONTESTED},
    [LEVELRANGE_HILLSBRAD]              = {20, 30, lTYPE_CONTESTED},
    [LEVELRANGE_WETLANDS]               = {20, 30, lTYPE_CONTESTED},
    [LEVELRANGE_ALTERAC]                = {30, 40, lTYPE_CONTESTED},
    [LEVELRANGE_ARATHI]                 = {30, 40, lTYPE_CONTESTED},
    [LEVELRANGE_STRANGLETHORN]          = {30, 45, lTYPE_CONTESTED},
    [LEVELRANGE_BADLANDS]               = {35, 45, lTYPE_CONTESTED},
    [LEVELRANGE_SORROWS]                = {35, 45, lTYPE_CONTESTED},
    [LEVELRANGE_HINTERLANDS]            = {40, 50, lTYPE_CONTESTED},
    [LEVELRANGE_SEARINGGORGE]           = {43, 50, lTYPE_CONTESTED},
    [LEVELRANGE_BLASTEDLANDS]           = {45, 55, lTYPE_CONTESTED},
    [LEVELRANGE_BURNINGSTEPPE]          = {50, 58, lTYPE_CONTESTED},
    [LEVELRANGE_WESTERNPLAGUE]          = {51, 58, lTYPE_CONTESTED},
    [LEVELRANGE_EASTERNPLAGUE]          = {53, 60, lTYPE_CONTESTED},
    [LEVELRANGE_DEADWINDPASS]           = {55, 60, lTYPE_CONTESTED},

    [LEVELRANGE_DUROTAR]                = { 1, 10, lTYPE_HORDE},
    [LEVELRANGE_MULGORE]                = { 1, 10, lTYPE_HORDE},
    [LEVELRANGE_DARKSHORE]              = {10, 20, lTYPE_ALLIANCE},
    [LEVELRANGE_BARRENS]                = {10, 25, lTYPE_HORDE},
    [LEVELRANGE_STONETALON]             = {15, 27, lTYPE_CONTESTED},
    [LEVELRANGE_ASHENVALE]              = {18, 30, lTYPE_CONTESTED},
    [LEVELRANGE_1KNEEDLES]              = {25, 35, lTYPE_CONTESTED},
    [LEVELRANGE_DESOLACE]               = {30, 40, lTYPE_CONTESTED},
    [LEVELRANGE_DUSTWALLOW]             = {35, 45, lTYPE_CONTESTED},
    [LEVELRANGE_FERALAS]                = {40, 50, lTYPE_CONTESTED},
    [LEVELRANGE_TANARIS]                = {40, 50, lTYPE_CONTESTED},
    [LEVELRANGE_AZSHARA]                = {45, 55, lTYPE_CONTESTED},
    [LEVELRANGE_FELWOOD]                = {48, 55, lTYPE_CONTESTED},
    [LEVELRANGE_UNGOROCRATER]           = {48, 55, lTYPE_CONTESTED},
    [LEVELRANGE_SILITHUS]               = {55, 60, lTYPE_CONTESTED},
    [LEVELRANGE_WINTERSPRING]           = {55, 60, lTYPE_CONTESTED},

    [LEVELRANGE_MOONGLADE]              = { 1, 60, lTYPE_CONTESTED},
    [LEVELRANGE_TELDRASSIL]             = { 1, 10, lTYPE_ALLIANCE},

    -- Turtle WoW Zones
    [LEVELRANGE_THALASSIANHIGHLANDS]    = { 1, 10, lTYPE_ALLIANCE},
    [LEVELRANGE_BLACKSTONEISLAND]       = { 1, 10, lTYPE_HORDE},
    [LEVELRANGE_GILNEAS]                = {39, 46, lTYPE_CONTESTED},
    [LEVELRANGE_GILLIJIM]               = {48, 53, lTYPE_CONTESTED},
    [LEVELRANGE_LAPIDIS]                = {48, 53, lTYPE_CONTESTED},
    [LEVELRANGE_TELABIM]                = {54, 60, lTYPE_CONTESTED},
    [LEVELRANGE_SCARLETENCLAVE]         = {55, 60, lTYPE_CONTESTED},
    [LEVELRANGE_HYJAL]                  = {58, 60, lTYPE_CONTESTED},
    -- added in patch 1.18
    [LEVELRANGE_GRIMREACHES]            = {33, 38, lTYPE_CONTESTED},
    [LEVELRANGE_NORTHWIND]              = {28, 34, lTYPE_CONTESTED},
    [LEVELRANGE_BALOR]                  = {29, 34, lTYPE_CONTESTED},
};

-- Fishing Level Requirements
LEVELRANGE_FISHING = {
    [LEVELRANGE_ELWYNN]             = {25},
    [LEVELRANGE_DUNMOROGH]          = {25},
    [LEVELRANGE_TIRISFAL]           = {25},
    [LEVELRANGE_LOCHMODAN]          = {75},
    [LEVELRANGE_SILVERPINE]         = {75},
    [LEVELRANGE_WESTFALL]           = {75},
    [LEVELRANGE_REDRIDGE]           = {150},
    [LEVELRANGE_DUSKWOOD]           = {150},
    [LEVELRANGE_HILLSBRAD]          = {150},
    [LEVELRANGE_WETLANDS]           = {150},
    [LEVELRANGE_ALTERAC]            = {225},
    [LEVELRANGE_ARATHI]             = {225},
    [LEVELRANGE_STRANGLETHORN]      = {225},
    [LEVELRANGE_BADLANDS]           = {35},
    [LEVELRANGE_SORROWS]            = {225},
    [LEVELRANGE_HINTERLANDS]        = {300},
    -- [LEVELRANGE_SEARINGGORGE]       = {0},
    -- [LEVELRANGE_BLASTEDLANDS]       = {0},
    -- [LEVELRANGE_BURNINGSTEPPE]      = {0},
    [LEVELRANGE_WESTERNPLAGUE]      = {300},
    -- [LEVELRANGE_EASTERNPLAGUE]      = {0},
    -- [LEVELRANGE_DEADWINDPASS]       = {0},

    [LEVELRANGE_DUROTAR]            = {25},
    [LEVELRANGE_MULGORE]            = {25},
    [LEVELRANGE_DARKSHORE]          = {75},
    [LEVELRANGE_BARRENS]            = {75},
    [LEVELRANGE_STONETALON]         = {150},
    [LEVELRANGE_ASHENVALE]          = {150},
    [LEVELRANGE_1KNEEDLES]          = {225},
    [LEVELRANGE_DESOLACE]           = {225},
    [LEVELRANGE_DUSTWALLOW]         = {225},
    [LEVELRANGE_FERALAS]            = {300},
    [LEVELRANGE_TANARIS]            = {300},
    [LEVELRANGE_AZSHARA]            = {300},
    [LEVELRANGE_FELWOOD]            = {300},
    [LEVELRANGE_UNGOROCRATER]       = {300},
    -- [LEVELRANGE_SILITHUS]           = {0},
    -- [LEVELRANGE_WINTERSPRING]       = {0},

    [LEVELRANGE_MOONGLADE]          = {300},
    [LEVELRANGE_TELDRASSIL]         = {25},

    -- Turtle WoW Zones
    -- [LEVELRANGE_GILNEAS]            = {0},
    -- [LEVELRANGE_GILLIJIM]           = {0},
    -- [LEVELRANGE_LAPIDIS]            = {0},
    -- [LEVELRANGE_TELABIM]            = {0},
    -- [LEVELRANGE_HYJAL]              = {0},

    -- added in patch 1.18 - TODO as of yet unknown, to be verified after patch release
    -- [LEVELRANGE_GRIMREACHES]        = {0},
    -- [LEVELRANGE_NORTHWIND]          = {0},
    -- [LEVELRANGE_BALOR]              = {0},
};

-- Instances
LEVELRANGE_INSTANCES = {
    [LEVELRANGE_WESTFALL]           = {LEVELRANGE_DEADMINES, " (17-26)"},
    [LEVELRANGE_BARRENS]            = {LEVELRANGE_WAILINGCAVERNS, " (17-24)", LEVELRANGE_RAZORFENKRAUL, " (25-30)", LEVELRANGE_RAZORFENDOWNS, " (33-45)"},
    [LEVELRANGE_SILVERPINE]         = {LEVELRANGE_SHADOWFANGKEEP, " (22-30)"},

    [LEVELRANGE_DUNMOROGH]          = {LEVELRANGE_GNOMEREGAN, " (29-38)"},
    [LEVELRANGE_TIRISFAL]           = {LEVELRANGE_SCARLETMONASTERY, " (34-45)"},
    [LEVELRANGE_BADLANDS]           = {LEVELRANGE_ULDAMAN, " (35-47)"},
    [LEVELRANGE_DESOLACE]           = {LEVELRANGE_MARAUDON, " (46-55)"},
    [LEVELRANGE_SORROWS]            = {LEVELRANGE_SUNKENTEMPLE, " (45-55)"},
    [LEVELRANGE_SEARINGGORGE]       = {LEVELRANGE_BLACKROCKDEPTH, " (52-60)", LEVELRANGE_BLACKROCKSPIRE, " (58-60)"},
    [LEVELRANGE_EASTERNPLAGUE]      = {LEVELRANGE_STRATHOLME, " (58-60)"},
    [LEVELRANGE_FERALAS]            = {LEVELRANGE_DIREMAUL, " (55-60)"},
    [LEVELRANGE_WESTERNPLAGUE]      = {LEVELRANGE_SCHOLOMANCE, " (57-60)"},
    [LEVELRANGE_DUROTAR]            = {LEVELRANGE_RAGEFIRECHASM, " (13-18)"},

    -- Turtle WoW Dungeons
    [LEVELRANGE_ASHENVALE]          = {LEVELRANGE_BLACKFATHOMDEEPS, " (24-32)", LEVELRANGE_CRESCENTGROVE, " (32-38)"},
    [LEVELRANGE_GILNEAS]            = {LEVELRANGE_GILNEASCITY, " (43-49)"},
    [LEVELRANGE_BURNINGSTEPPE]      = {LEVELRANGE_HATEFORGEQUARRY, " (52-60)", LEVELRANGE_BLACKROCKDEPTH, " (52-60)", LEVELRANGE_BLACKROCKSPIRE, " (58-60)"},
    [LEVELRANGE_DEADWINDPASS]       = {LEVELRANGE_KARAZHANCRYPT, " (58 - 60)"},
    [LEVELRANGE_ELWYNN]             = {LEVELRANGE_STOCKADES, " (24-32)", LEVELRANGE_STORMWINDVAULT, " (60+)"},
    [LEVELRANGE_TANARIS]            = {LEVELRANGE_ZULFARRAK, " (44-54)", LEVELRANGE_COTBLACKMORASS, " (60+)"},
    -- added in patch 1.18
    [LEVELRANGE_BALOR]              = {LEVELRANGE_STORMWROUGHTRUINS, " (35-41)"},
    [LEVELRANGE_WETLANDS]           = {LEVELRANGE_DRAGONMAWRETREAT, " (27-33)"},
};

-- Raids
LEVELRANGE_RAIDS = {
    [LEVELRANGE_EASTERNPLAGUE]      = {LEVELRANGE_NAXXRAMAS, " (60+)"},
    [LEVELRANGE_DUSTWALLOW]         = {LEVELRANGE_ONYXIASLAIR, " (60+)"},
    [LEVELRANGE_SILITHUS]           = {LEVELRANGE_RUINSAHNQIRAJ, " (60+)", LEVELRANGE_TEMPLEAHNQIRAJ, " (60+)"},
    [LEVELRANGE_STRANGLETHORN]      = {LEVELRANGE_ZULGURUB, " (60+)"},

    -- Turtle WoW Raids
    [LEVELRANGE_HYJAL]              = {LEVELRANGE_EMERALDSANCTUM, " (60+)"},
    [LEVELRANGE_DEADWINDPASS]       = {LEVELRANGE_LOWERKARAZHANHALLS, " (60+)"},
};

-- Sub-zones
LEVELRANGE_SUBZONES = {
    [LEVELRANGE_ORGRIMMAR]          = LEVELRANGE_DUROTAR,
    [LEVELRANGE_THUNDERBLUFF]       = LEVELRANGE_MULGORE,
    [LEVELRANGE_UNDERCITY]          = LEVELRANGE_TIRISFAL,
    [LEVELRANGE_IRONFORGE]          = LEVELRANGE_DUNMOROGH,
    [LEVELRANGE_STORMWIND]          = LEVELRANGE_ELWYNN,
    [LEVELRANGE_DARNASSUS]          = LEVELRANGE_TELDRASSIL,

    -- Turtle WoW Sub-zones
    [LEVELRANGE_ALAHTHALAS]         = LEVELRANGE_THALASSIANHIGHLANDS,
};

-- Colours
LEVELRANGE_COLORS = {
    Unknown     = { r = 0.8, g = 0.8, b = 0.8 },
    Hostile     = { r = 0.9, g = 0.2, b = 0.2 },
    Friendly    = { r = 0.2, g = 0.9, b = 0.2 },
    Contested   = { r = 0.8, g = 0.6, b = 0.4 },

    None        = { r = 1.0, g = 1.0, b = 1.0 },
    Levels      = { r = 0.8, g = 0.6, b = 0.0 },

    ON          = { r = 0.0, g = 1.0, b = 0.0 },
    OFF         = { r = 1.0, g = 0.0, b = 0.0 },

    Difficult = { r = 1, g = 0.5, b = 0.25, },
    Normal = { r = 1, g = 1, b = 0, },
    Easy = { r = 0.12, g = 1, b = 0, },
};

-- Options
LevelRange = {
    ["Opts"] = LEVELRANGE_DEFAULT_OPTS,
};


--------------------------------------------------------------------------------------------------
-- Map Drawing Functions
--------------------------------------------------------------------------------------------------

local quest_db = {}

function quest_db.zone_ids(name)
    local dict = pfDatabase:GetIDByName(name, "zones", true)

    local count = 0
    local ids = {}
    for id in pairs(dict) do
        if id and id ~= 0 then
            ids[id] = true
            count = count + 1
        end
    end
    return count == 0 and nil or ids
end

function quest_db.zone_quests(zone_name)
    local zone_ids = quest_db.zone_ids(zone_name)
    
    -- local str = zone_name
    -- for id in pairs(zone_ids) do
    --     str = str .. ", " .. id
    -- end
    -- print(str)

    if not zone_ids then
        return nil
    end

    local plevel = UnitLevel("player")
    local _, race = UnitRace("player")
    local prace = pfDatabase:GetBitByRace(race)
    local _, class = UnitClass("player")
    local pclass = pfDatabase:GetBitByClass(class)
    local pfaction = UnitFactionGroup("player")
    if pfaction == "Horde" then
        pfaction = "H"
    elseif pfaction == "Alliance" then
        pfaction = "A"
    else
        pfaction = "GM"
    end

    local quests = pfDB["quests"]["data"]
    local sum, count = quest_db.add_quests(quests, zone_ids, quest_id, plevel, pclass, prace, pfaction)
    -- print(zone_name, sum, count)

    local avg = sum / count
    return count, avg
end

function quest_db.add_quests(quests, zone_ids, quest_id, plevel, pclass, prace, pfaction, sum, count)
    local sum = sum or 0
    local count = count or 0

    for quest_id in pairs(quests) do
        if quest_db.is_valid_quest(quests, zone_ids, quest_id, plevel, pclass, prace, pfaction) then
            local qlevel = quest_db.get_level(quests, quest_id)
            sum = sum + qlevel
            count = count + 1
        end
    end
    return sum, count
end

local ignore_quests = {
    ["Arathi Basin Mark of Honor!"] = true,
    ["Battle of Warsong Gulch"] = true,
    ["Claiming Arathi Basin"] = true,
    ["Conquering Arathi Basin"] = true,
    ["Cut Arathor Supply Lines"] = true,
    ["Fight for Warsong Gulch"] = true,
    ["Mark of Honor"] = true,
    ["More Resource Crates"] = true,
    ["Quell the Silverwing Usurpers"] = true,
    ["Ribbons of Sacrifice"] = true,
    ["Talismans of Merit"] = true,
    ["The Battle for Arathi Basin!"] = true,
    ["Vanquish the Invaders!"] = true,
}

function quest_db.ignore_quest(quests, q_id)
    local title = pfDB.quests.loc[q_id] and pfDB.quests.loc[q_id].T
    if not title then
        return true
    end
    if ignore_quests[title] then
        return true
    end
    return false
end

function quest_db.is_valid_quest(quests, zone_ids, id, plevel, pclass, prace, pfaction)
    -- ignore empty quests
    if not quests[id]["lvl"] or not quests[id]["start"] then
        -- if not quests[id][]
        return false
    end

    if not pfDatabase:QuestFilter(id, plevel, pclass, prace) then
        return false
    end

    if quest_db.ignore_quest(quests, id) then
        return false
    end

    local qlevel = quest_db.get_level(quests, id)
    if (plevel - qlevel > 5) or (qlevel - plevel > 4) then
        return false
    end

    -- ignore blue quests
    if quests[id]["event"] then
        return false
    end

    -- ignore quests without a start unit / object
    if not quests[id]["start"] then
        return false
    end

    if quests[id]["start"]["U"] then
        local units = pfDB["units"]["data"]
        return quest_db.x_is_in_zone(quests, id, zone_ids, pfaction, units, "U")
    end
    if quests[id]["start"]["O"] then
        local objects = pfDB["objects"]["data"]
        return quest_db.x_is_in_zone(quests, id, zone_ids, pfaction, objects, "O")
    end

    return false
end

function quest_db.x_is_in_zone(quests, q_id, z_ids, pfaction, db, tag)
    for _, id in pairs(quests[q_id]["start"][tag]) do
        if db[id] and db[id]["coords"] and strfind(db[id]["fac"] or pfaction, pfaction) then
            for _, data in pairs(db[id]["coords"]) do
                local _, _, zone, _ = unpack(data)

                if z_ids[zone] then
                    return true
                end
            end
        end
    end

    return false
end

function quest_db.get_level(quests, id)
    return quests[id]["lvl"]
end

-- Update the tooltip for a zone
local function lUpdateTooltip(zoneName)

    -- Check Toggle
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange == false) then
        LevelRangeTooltip:Hide();
        return;
    end

    -- No zone name, no tooltip!
    if not zoneName or zoneName == "" then
        LevelRangeTooltip:Hide();
        return;
    end

    -- Unused anchor point
    LevelRangeTooltip:SetOwner(this, "ANCHOR_LEFT");

    -- Determine colour and level range
    local title = LEVELRANGE_COLORS.Unknown;
    local normalcol = LEVELRANGE_COLORS.None;
    local levelscol = LEVELRANGE_COLORS.Levels;

    local levels = nil;
    local actualside = nil;
    local flevel = nil;

    if (LEVELRANGE_RANGES[zoneName]) then
        local _, faction = UnitFactionGroup("player");
        local min = LEVELRANGE_RANGES[zoneName][1];
        local max = LEVELRANGE_RANGES[zoneName][2];
        local side = LEVELRANGE_RANGES[zoneName][3];

        if (side == lTYPE_CONTESTED) then
            title = LEVELRANGE_COLORS.Contested;
            actualside = lTYPE_CONTESTED;
        else
            if (faction == side) then
                title = LEVELRANGE_COLORS.Friendly;
                actualside = LEVELRANGE_FRIENDLY;
            else
                title = LEVELRANGE_COLORS.Hostile;
                actualside = LEVELRANGE_HOSTILE;
            end
        end
        levels = string.format(LEVELRANGE_LEVELS, min, max);
    end

    -- Generate the quest info string
    local quest_string = nil
    local quest_col = LEVELRANGE_COLORS.None
    local count, level = quest_db.zone_quests(zoneName)
    if count then
        quest_string = string.format("%d quests, level %.1f", count, level)

        local plevel = UnitLevel("player")
        if math.abs(level - plevel) <= 2 then
            quest_col = LEVELRANGE_COLORS.Normal
        end
        if plevel - level > 2 then
            quest_col = LEVELRANGE_COLORS.Easy
        end
        if level - plevel > 2 then
            quest_col = LEVELRANGE_COLORS.Difficult
        end
    end
    if count == 0 then
        quest_string = "No quests"
    end
    
    -- Start making the Tooltip

    -- Show the zone title and add level range if known
    LevelRangeTooltip:SetText(zoneName, normalcol.r, normalcol.g, normalcol.b);
    if levels then
        LevelRangeTooltip:AddLine(levels, levelscol.r, levelscol.g, levelscol.b);
    end

    -- Show the quest levels
    if quest_string then
        LevelRangeTooltip:AddLine(quest_string, quest_col.r, quest_col.g, quest_col.b)
    end

    -- Show fishing level requirement if desired
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing == true) then
        if flevel then
            LevelRangeTooltip:AddLine(flevel, levelscol.r, levelscol.g, levelscol.b);
        end
    end

    -- Show diplomacy if known and if wanted
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP == true) then
        if actualside then
            LevelRangeTooltip:AddLine(actualside, title.r, title.g, title.b);
        end
    end

    -- Add instance info if wanted
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances == true) then
        if (LEVELRANGE_INSTANCES[zoneName]) then
            LevelRangeTooltip:AddLine(" ");
            LevelRangeTooltip:AddLine(LEVELRANGE_INSTANCESTEXT);
            getInstanceLevels(zoneName, LevelRangeTooltip);
        end
    end
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids == true) then
        if (LEVELRANGE_RAIDS[zoneName]) then
            LevelRangeTooltip:AddLine(" ");
            LevelRangeTooltip:AddLine(LEVELRANGE_RAIDSTEXT);
            getRaidLevels(zoneName, LevelRangeTooltip);
        end
    end

    -- This stuff seems to get reset each time
    -- LevelRangeTooltip:SetBackdropColor(0, 0, 0, 0.8);
    LevelRangeTooltip:SetBackdropBorderColor(1, 1, 1, 1);
    LevelRangeTooltip:ClearAllPoints();
    LevelRangeTooltip:SetPoint("BOTTOMLEFT", "WorldMapDetailFrame", "BOTTOMLEFT", 0, 0);

    -- Only show if there is level information
    if levels then
        LevelRangeTooltip:Show();
    else
        LevelRangeTooltip:Hide();
    end

    -- Now go ahead and put the tooltip into the right location
    LevelRangeTooltip:ClearAllPoints();
    LevelRangeTooltip:SetPoint("BOTTOMLEFT", WorldMapDetailFrame);

    if (FlightMapFrame) then
        LevelRangeTooltip:ClearAllPoints();
        LevelRangeTooltip:SetPoint("BOTTOMRIGHT", "WorldMapDetailFrame",
                "BOTTOMRIGHT", 0, 0);
    end

end

-- Last drawn info for tooltip
lLR_CurrentZone = nil;
lLR_CurrentArea = nil;
local lLR_OldUpdate = function() end;

-- Replacement function to draw all the extra goodies of LevelRange
function LevelRange_WorldMapButton_OnUpdate(arg1)
    lLR_OldUpdate(arg1);

    local areaNameRaw = WorldMapFrame.areaName or "";
    local _, _, areaNameTrimmed = string.find(areaNameRaw, "^%s*(.-)%s*$"); -- 2.0.7: Fixed code added in 2.0.6 to trim whitespace to deal with patch 1.18 bug for Northwind zone: In-game name contains trailing space 'Northwind '.
    local zoneNum = GetCurrentMapZone();

    -- Zone name equivalence map
    if LEVELRANGE_SUBZONES[areaNameTrimmed] then
        areaNameTrimmed = LEVELRANGE_SUBZONES[areaNameTrimmed];
    end

    -- Bail out if nothing has changed
    if zoneNum == lLR_CurrentZone and areaNameRaw == lLR_CurrentArea then
        return;
    else
      lLR_CurrentZone = zoneNum;
      lLR_CurrentArea = areaNameRaw;
    end

    -- Continent or zone map?
    if zoneNum == 0 then
        lUpdateTooltip(areaNameTrimmed);
    else
        lUpdateTooltip(nil);            -- hide it
    end
end


--------------------------------------------------------------------------------------------------
-- Print Message Functions
--------------------------------------------------------------------------------------------------

function printMSG(msg)
   DEFAULT_CHAT_FRAME:AddMessage("|CF4FFFF4FLevelRange|r: " .. msg, 1, 1, 1);
end

function printHELPMSG(msg)
   DEFAULT_CHAT_FRAME:AddMessage("|CF4FF4F4FLevelRange Help|r: " .. msg, 1, 1, 1);
end

function printOPTION(msg, status, r, g, b)
   DEFAULT_CHAT_FRAME:AddMessage("|CF4FFFF4F" .. msg .. ":|r " .. status, r or 1, g or 1, b or 1);
end


--------------------------------------------------------------------------------------------------
-- Slash Command Functions
--------------------------------------------------------------------------------------------------

-- Command
function LevelRange_GetCmd(msg)
    if msg then
        local a,b,c=strfind(msg, "(%S+)"); -- contiguous string of non-space characters
        if a then
            return c, strsub(msg, b+2);
        else
            return "";
        end
    end
end

-- Handler
function LevelRange_SlashHandler(msg)
    local Cmd, SubCmd = LevelRange_GetCmd(msg); -- call to above function
    if (Cmd == "help") then
        showHelp();

    elseif (Cmd == "list") then
        printInstances();

    -- Toggle LevelRange tooltip
    elseif (Cmd == "toggle") then
        toggleLevelRange();

    -- Toggle LevelRange showing instances
    elseif (Cmd == "instances") then
        toggleInstances();

    -- Toggle fishing level requirement on tooltip
    elseif (Cmd == "fishing") then
        toggleFishing();

    elseif (Cmd == "") then
        if (LevelRangeOptionsFrame:IsVisible()) then
            HideUIPanel(LevelRangeOptionsFrame);
        else
            ShowUIPanel(LevelRangeOptionsFrame);
        end

    -- Wrong command so show help
    else
        showHelp();
    end
end

function printInstances()
    return;
end

function showHelp()
    printHELPMSG(LEVELRANGE_HELP0);
    printHELPMSG(LEVELRANGE_HELP1);
    printHELPMSG(LEVELRANGE_HELP2);
    printHELPMSG(LEVELRANGE_HELP3);
    printHELPMSG(LEVELRANGE_HELP4);
    printHELPMSG(LEVELRANGE_HELP5);
end


--------------------------------------------------------------------------------------------------
-- Toggles
--------------------------------------------------------------------------------------------------

function toggleLevelRange()
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange == false) then
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange = true;
       printOPTION(LEVELRANGE_TOGGLESHOW, LEVELRANGE_ENABLED, LEVELRANGE_COLORS.ON.r, LEVELRANGE_COLORS.ON.g, LEVELRANGE_COLORS.ON.b);
    else
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange = false;
       printOPTION(LEVELRANGE_TOGGLESHOW, LEVELRANGE_DISABLED, LEVELRANGE_COLORS.OFF.r, LEVELRANGE_COLORS.OFF.g, LEVELRANGE_COLORS.OFF.b);
    end
end

function toggleInstances()
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances == false) then
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances = true;
       printOPTION(LEVELRANGE_TOGGLEINSTANCES, LEVELRANGE_ON, LEVELRANGE_COLORS.ON.r, LEVELRANGE_COLORS.ON.g, LEVELRANGE_COLORS.ON.b);
    else
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances = false;
       printOPTION(LEVELRANGE_TOGGLEINSTANCES, LEVELRANGE_OFF, LEVELRANGE_COLORS.OFF.r, LEVELRANGE_COLORS.OFF.g, LEVELRANGE_COLORS.OFF.b);
    end
end

function toggleRaids()
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids == false) then
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids = true;
       printOPTION(LEVELRANGE_TOGGLERAIDS, LEVELRANGE_ON, LEVELRANGE_COLORS.ON.r, LEVELRANGE_COLORS.ON.g, LEVELRANGE_COLORS.ON.b);
    else
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids = false;
       printOPTION(LEVELRANGE_TOGGLERAIDS, LEVELRANGE_OFF, LEVELRANGE_COLORS.OFF.r, LEVELRANGE_COLORS.OFF.g, LEVELRANGE_COLORS.OFF.b);
    end
end

function togglePvP()
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP == false) then
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP = true;
       printOPTION(LEVELRANGE_TOGGLEPVP, LEVELRANGE_ON, LEVELRANGE_COLORS.ON.r, LEVELRANGE_COLORS.ON.g, LEVELRANGE_COLORS.ON.b);
    else
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP = false;
       printOPTION(LEVELRANGE_TOGGLEPVP, LEVELRANGE_OFF, LEVELRANGE_COLORS.OFF.r, LEVELRANGE_COLORS.OFF.g, LEVELRANGE_COLORS.OFF.b);
    end
end

function toggleFishing()
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing == false) then
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing = true;
       printOPTION(LEVELRANGE_TOGGLEFISHING, LEVELRANGE_ON, LEVELRANGE_COLORS.ON.r, LEVELRANGE_COLORS.ON.g, LEVELRANGE_COLORS.ON.b);
    else
       LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing = false;
       printOPTION(LEVELRANGE_TOGGLEFISHING, LEVELRANGE_OFF, LEVELRANGE_COLORS.OFF.r, LEVELRANGE_COLORS.OFF.g, LEVELRANGE_COLORS.OFF.b);
    end
end


--------------------------------------------------------------------------------------------------
-- Instance and Raid Information
--------------------------------------------------------------------------------------------------

function getInstanceLevels(zoneName, theTooltip)
    if (LEVELRANGE_INSTANCES[zoneName]) then
        if (LEVELRANGE_INSTANCES[zoneName][1]) then
            theTooltip:AddDoubleLine("|CFFcFcFcF" .. LEVELRANGE_INSTANCES[zoneName][1] .. "|r", "|CFFcFcFcF" .. LEVELRANGE_INSTANCES[zoneName][2] .. "|r");
        end
        if (LEVELRANGE_INSTANCES[zoneName][3]) then
            theTooltip:AddDoubleLine("|CFFcFcFcF" .. LEVELRANGE_INSTANCES[zoneName][3] .. "|r", "|CFFcFcFcF" .. LEVELRANGE_INSTANCES[zoneName][4] .. "|r");
        end
        if (LEVELRANGE_INSTANCES[zoneName][5]) then
            theTooltip:AddDoubleLine("|CFFcFcFcF" .. LEVELRANGE_INSTANCES[zoneName][5] .. "|r", "|CFFcFcFcF" .. LEVELRANGE_INSTANCES[zoneName][6] .. "|r");
        end
    end
end

function getRaidLevels(zoneName, theTooltip)
    if (LEVELRANGE_RAIDS[zoneName]) then
        if (LEVELRANGE_RAIDS[zoneName][1]) then
            theTooltip:AddDoubleLine("|CFFcFcFcF" .. LEVELRANGE_RAIDS[zoneName][1] .. "|r", "|CFFcFcFcF" .. LEVELRANGE_RAIDS[zoneName][2] .. "|r");
        end
        if (LEVELRANGE_RAIDS[zoneName][3]) then
            theTooltip:AddDoubleLine("|CFFcFcFcF" .. LEVELRANGE_RAIDS[zoneName][3] .. "|r", "|CFFcFcFcF" .. LEVELRANGE_RAIDS[zoneName][4] .. "|r");
        end
    end
end


--------------------------------------------------------------------------------------------------
-- Options Frame
--------------------------------------------------------------------------------------------------

-- OnShow of options frame
function LevelRangeOptionsFrame_OnShow()
    -- Set localised strings
    LevelRangeOptionsFrameClose:SetText(LEVELRANGE_OPTIONS_CLOSE);
    LevelRangeOptionsFrameTitle:SetText(LEVELRANGE_OPTIONS_TITLE);

    -- Set up options from localised data
    local base = "LevelRangeOptionsFrame"
    for optid, option in pairs(LEVELRANGE_OPTIONS) do
        local name = base .. "Opt" .. optid;
        local button = getglobal(name);
        local label = getglobal(name .. "Text");
        OptionsFrame_EnableCheckBox(button, 1, LevelRange.Opts[option.option]);

        -- Simple stuff
        label:SetText(option.label);
        button.tooltipText = option.tooltip;
        button.option = option.option;
        button.children = option.children or {};
    end

    for optid, option in pairs(LEVELRANGE_OPTIONS) do
        -- Enable/disable any children
        for _, child in option.children or {} do
            local other = getglobal(base .. "Opt" .. child);
            if other then
                if LevelRange.Opts[option.option] then
                    OptionsFrame_EnableCheckBox(other, 1,
                        LevelRange.Opts[LEVELRANGE_OPTIONS[child].option]);
                else
                    OptionsFrame_DisableCheckBox(other);
                end
            end
        end
    end
    loadSettings();
end

-- OnHide of options frame
function LevelRangeOptionsFrame_OnHide()
    return;
end

-- OnClick of options button
function LevelRangeOptionsCheckButton_OnClick()

    if (this.option == "showLevelRange") then
        toggleLevelRange(this);
    elseif (this.option == "showInstances") then
        toggleInstances();
    elseif (this.option == "showRaids") then
        toggleRaids();
    elseif (this.option == "showPvP") then
        togglePvP();
    elseif (this.option == "showFishing") then
        toggleFishing();
    end

    if (this:GetChecked()) then
        LevelRange.Opts[this.option] = true;
    else
        LevelRange.Opts[this.option] = false;
    end

    local base = "LevelRangeOptionsFrame";
    for _, child in this.children do
        local other = getglobal(base .. "Opt" .. child);
        if other then
            if LevelRange.Opts[this.option] then
                OptionsFrame_EnableCheckBox(other, 1,
                    LevelRange.Opts[LEVELRANGE_OPTIONS[child].option]);
            else
                OptionsFrame_DisableCheckBox(other);
            end
        end
    end
end

-- Load Settings
function loadSettings()
   if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange == true) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt1");

        optionButton:SetChecked(true);
        LevelRange.Opts["showLevelRange"] = true;

    elseif (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange == false) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt1");

        optionButton:SetChecked(false);
        LevelRange.Opts["showLevelRange"] = false;
    end

    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances == true) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt2");

        optionButton:SetChecked(true);
        LevelRange.Opts["showInstances"] = true;

    elseif (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances == false) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt2");

        optionButton:SetChecked(false);
        LevelRange.Opts["showInstances"] = false;
    end

    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids == true) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt3");

        optionButton:SetChecked(true);
        LevelRange.Opts["showRaids"] = true;

    elseif (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids == false) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt3");

        optionButton:SetChecked(false);
        LevelRange.Opts["showRaids"] = false;
    end

    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP == true) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt4");

        optionButton:SetChecked(true);
        LevelRange.Opts["showPvP"] = true;

    elseif (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP == false) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt4");

        optionButton:SetChecked(false);
        LevelRange.Opts["showPvP"] = false;
    end

    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing == true) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt5");

        optionButton:SetChecked(true);
        LevelRange.Opts["showFishing"] = true;

    elseif (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing == false) then
        local optionButton = getglobal("LevelRangeOptionsFrame" .. "Opt5");

        optionButton:SetChecked(false);
        LevelRange.Opts["showFishing"] = false;
    end

end


--------------------------------------------------------------------------------------------------
-- Initialize Functions
--------------------------------------------------------------------------------------------------

function LevelRange_OnLoad()
    -- Override the world map function
    lLR_OldUpdate = WorldMapButton_OnUpdate;
    WorldMapButton_OnUpdate = LevelRange_WorldMapButton_OnUpdate;

    -- Setup slash commands
    SlashCmdList["LEVELRANGE"] = LevelRange_SlashHandler;
    SLASH_LEVELRANGE1 = "/" .. LEVELRANGE_SLASH1;
    SLASH_LEVELRANGE2 = "/" .. LEVELRANGE_SLASH2;

    -- Reload UI Commands
    SlashCmdList["RELOADUI"] = ReloadUI;
    SLASH_RELOADUI1 = "/rui";
    SLASH_RELOADUI2 = "/reloadui";

    -- LevelRange is loaded
    printMSG(LEVELRANGE_LOADEDPREFIX .. LEVELRANGE_VERSION .. LEVELRANGE_LOADEDSUFFIX)
    this:RegisterEvent("ADDON_LOADED");
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("PLAYER_ENTERING_WORLD");
end

function LevelRange_Initialize()
    -- Make sure LevelRangeSettings is ready
    if (not LevelRangeSettings) then
        LevelRangeSettings = { };
    end

    if (not LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME]) then
        LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME] = { };
    end


    -- LevelRange Toggle
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange == nil) then
        LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showLevelRange = DEFAULT_LEVELRANGE_SHOW;
    end

    -- Instances Toggle
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances == nil) then
        LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showInstances = DEFAULT_LEVELRANGE_SHOWINSTANCE;
    end

    -- Raids Toggle
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids == nil) then
        LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showRaids = DEFAULT_LEVELRANGE_SHOWRAIDS;
    end

    -- PvP Toggle
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP == nil) then
        LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showPvP = DEFAULT_LEVELRANGE_SHOWPVP;
    end

    -- fishing Toggle
    if (LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing == nil) then
        LevelRangeSettings[LEVELRANGE_REALMPLAYERNAME].showFishing = DEFAULT_LEVELRANGE_SHOWFISHING;
    end

end

function LevelRange_OnEvent(event)
    if (event == "VARIABLES_LOADED") then
        LevelRange_Initialize();

        -- Register LevelRange with myAddons
        if (myAddOnsFrame_Register) then
            myAddOnsFrame_Register(Details, Help);
        end
    end
end
