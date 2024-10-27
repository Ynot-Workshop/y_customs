---@meta
---@class blipOptions
---@field sprite integer -- Blip sprite
---@field color integer -- Blip color
---@field label string -- Blip label
---@field scale number -- Blip scale
---@field hide boolean? -- hide the blip
---@field checkAccess boolean? -- Wether to show the blip to everyone or just allowed players

---@meta
---@class ZoneOptions
---@field blip blipOptions? -- Blip options for the zone
---@field freeRepair string[]? -- Array of jobs that can repair vehicles for free
---@field freeMods string[]? -- Array of jobs that can modify vehicles for free
---@field job string[]? -- Array of jobs that can access the zone
---@field allowedClasses table<number, boolean>? -- Array of classes that are allowed to access the zone
---@field deniedClasses table<number, boolean>? -- Array of classes that are denied access to the zone
---@field modelBlacklist table<number, boolean>? -- Array of vehicle models (hashes) that are denied access to the zone
---@field points vector3[] -- Array of points that make up the zone