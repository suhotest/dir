---@meta

---ARIS Lua API Definition (Updated from Source Code)
---Lua interface for Minecraft mod scripting

---============================================
--- Base Functions (Available in all environments)
---============================================

---Print debug log
---@param msg string Message to print
function log_debug(msg) end

---Print info log
---@param msg string Message to print
function log_info(msg) end

---Print warning log
---@param msg string Message to print
function log_warn(msg) end

---Print error log
---@param msg string Message to print
function log_error(msg) end

---Check ARIS version
---@param v string Required minimum version
function check_version(v) end

---============================================
--- aris Library (Core Functions)
---============================================

aris = aris or {}

---Print debug log
---@param msg string Message to print
function aris.log_debug(msg) end

---Print info log
---@param msg string Message to print
function aris.log_info(msg) end

---Print warning log
---@param msg string Message to print
function aris.log_warn(msg) end

---Print error log
---@param msg string Message to print
function aris.log_error(msg) end

---Check ARIS version
---@param v string Required minimum version
function aris.check_version(v) end

---============================================
--- aris.math Library (Math Utilities)
---============================================

aris.math = {}

---Create rectangular area
---@param x number Left-top X coordinate
---@param y number Left-top Y coordinate
---@param width number Width
---@param height number Height
---@return Area Area(x with y, x with (y + height), (x + width) with (y + height), (x + width) with y)
---@overload fun(p1: Point, p2: Point): Area
function aris.math.create_rect_area(x, y, width, height) end

---Create 2D point
---@param x number X coordinate
---@param y number Y coordinate
---@return Point Point(x, y)
---@overload fun(x: number, y: number, z: number): Point3
function aris.math.create_point(x, y) end

---============================================
--- aris.init Library (Initialization Phase)
---============================================

aris.init = {}

---Create a new scriptable item
---@param key string Item ID
function aris.init.create_item(key) end

---Create a new particle type
---@param key string Particle ID
function aris.init.create_particle(key) end

---============================================
--- aris.init.client Library (Client Initialization)
---============================================

aris.init.client = {}

---Create a new keybinding
---@param key string Key name
---@param code number Key code (see: https://www.glfw.org/docs/3.3/group__keys.html)
---@param category string Key category
function aris.init.client.create_keybinding(key, code, category) end

---Create particle info for a custom particle
---@param key string Particle key
---@return ParticleInfo
function aris.init.client.create_particle_info(key) end

---============================================
--- aris.init.command Library (Command Initialization)
---============================================

aris.init.command = {}

---Create a new command
---@param of string Command name
---@return AbstractCommandHandler
function aris.init.command.create_command(of) end

---Create sub-command handler
---@param of string Sub-command name
---@return AbstractCommandHandler
function aris.init.command.sub_command(of) end

---Create integer argument for command
---@param of string Argument name
---@return AbstractCommandHandler
function aris.init.command.integer_arg(of) end

---Create float argument for command
---@param of string Argument name
---@return AbstractCommandHandler
function aris.init.command.float_arg(of) end

---Create player argument for command
---@param of string Argument name
---@return AbstractCommandHandler
function aris.init.command.player_arg(of) end

---============================================
--- aris.init.networking Library (Networking Initialization)
---============================================

aris.init.networking = {}

---Create integer argument for packet
---@param of string Argument name
---@return PackableData
function aris.init.networking.integer_arg(of) end

---Create float argument for packet
---@param of string Argument name
---@return PackableData
function aris.init.networking.float_arg(of) end

---Create string argument for packet
---@param of string Argument name
---@return PackableData
function aris.init.networking.string_arg(of) end

---Create C2S (Client to Server) packet
---@param id string Packet ID
---@return PacketDeclaration
function aris.init.networking.create_c2s_packet(id) end

---Create S2C (Server to Client) packet
---@param id string Packet ID
---@return PacketDeclaration
function aris.init.networking.create_s2c_packet(id) end

---============================================
--- aris.init.nbt Library (NBT Initialization)
---============================================

aris.init.nbt = {}

---Converts Lua Table into NBT Compound
---@param table any Lua table to convert
---@return LuaNBTCompound
function aris.init.nbt.from_table(table) end

---Get NBT of entity
---@param entity LuaEntity Entity to get NBT from
---@return LuaNBTCompound Full NBT object of entity
function aris.init.nbt.from_entity(entity) end

---Get NBT of item stack
---@param stack LuaItemStack Item stack to get NBT from
---@return LuaNBTCompound Full NBT object of item stack
function aris.init.nbt.from_item_stack(stack) end

---Get NBT of block entity at specific position
---@param level LuaServerWorld Server level for target block entity
---@param x number X position
---@param y number Y position
---@param z number Z position
---@return LuaNBTCompound|nil Full NBT object (nil if not exists)
function aris.init.nbt.from_block_entity(level, x, y, z) end

---Get NBT of block state at specific position
---@param level LuaServerWorld Server level for target block state
---@param x number X position
---@param y number Y position
---@param z number Z position
---@return LuaNBTCompound Full NBT object of provided location
function aris.init.nbt.from_block_state(level, x, y, z) end

---Converts string into NBT
---@param string string NBT string to convert
---@return LuaNBTCompound NBT object of provided string
function aris.init.nbt.from_string(string) end

---============================================
--- aris.game Library (In-Game Server)
---============================================

aris.game = {}

---[DEPRECATED - use aris.game.hook.add_on_use_item] Register function to execute when item is used
---@param item string Item ID
---@param func function Function to execute
---@deprecated
function aris.game.add_on_use_item(item, func) end

---[DEPRECATED] Clear registered item use functions
---@param item string Item ID to clear
---@deprecated
function aris.game.clear_on_use_item(item) end

---[DEPRECATED - use aris.game.hook.add_on_right_click] Register right-click hook
---@param f function Function to execute
---@deprecated
function aris.game.add_on_right_click_hook(f) end

---[DEPRECATED - use aris.game.hook.add_tick] Register tick hook
---@param f function Function to execute
---@deprecated
function aris.game.add_tick_hook(f) end

---Execute command from server console
---@param command string Command to execute
function aris.game.dispatch_command(command) end

---Create effect builder
---@param of string Effect resource ID (namespace:id)
---@return LuaMobEffectInstance
---@overload fun(ns: string, of: string): LuaMobEffectInstance
function aris.game.create_effect_builder(of) end

---Summon an entity at a position
---@param entityType LuaEntityType Entity type
---@param world LuaServerWorld World
---@param pos Point3 Position
---@return LuaEntity
function aris.game.summon_entity(entityType, world, pos) end

---Get entity type from resource location string
---@param str string Resource location
---@return LuaEntityType|nil
function aris.game.entity_type_of(str) end

---Iterate over all players
---@param fn fun(player: LuaServerPlayer) Callback to execute for each player
function aris.game.iter_players(fn) end

---============================================
--- aris.game.nbt Library (NBT Operations)
---============================================

aris.game.nbt = {}

---Converts Lua Table into NBT Compound
---@param table any Lua table to convert
---@return LuaNBTCompound
function aris.game.nbt.from_table(table) end

---Get NBT of entity
---@param entity LuaEntity Entity to get NBT from
---@return LuaNBTCompound Full NBT object of entity
function aris.game.nbt.from_entity(entity) end

---Get NBT of item stack
---@param stack LuaItemStack Item stack to get NBT from
---@return LuaNBTCompound Full NBT object of item stack
function aris.game.nbt.from_item_stack(stack) end

---Get NBT of block entity at specific position
---@param level LuaServerWorld Server level for target block entity
---@param x number X position
---@param y number Y position
---@param z number Z position
---@return LuaNBTCompound|nil Full NBT object (nil if not exists)
function aris.game.nbt.from_block_entity(level, x, y, z) end

---Get NBT of block state at specific position
---@param level LuaServerWorld Server level for target block state
---@param x number X position
---@param y number Y position
---@param z number Z position
---@return LuaNBTCompound Full NBT object of provided location
function aris.game.nbt.from_block_state(level, x, y, z) end

---Converts string into NBT
---@param string string NBT string to convert
---@return LuaNBTCompound NBT object of provided string
function aris.game.nbt.from_string(string) end

---============================================
--- aris.game.world Library (World Management)
---============================================

aris.game.world = {}

---Get world by name
---@param world string World name
---@return LuaServerWorld
function aris.game.world.get_world(world) end

---The overworld dimension
---@type LuaServerWorld|nil
aris.game.world.overworld = nil

---The nether dimension
---@type LuaServerWorld|nil
aris.game.world.nether = nil

---The end dimension
---@type LuaServerWorld|nil
aris.game.world.end = nil

---============================================
--- aris.game.hook Library (Server Hooks)
---============================================

aris.game.hook = {}

---Register function to execute when item is used
---@param item string Item ID
---@param func function Function to execute
function aris.game.hook.add_on_use_item(item, func) end

---Clear registered item use functions
---@param item string Item ID to clear
function aris.game.hook.clear_on_use_item(item) end

---Register right-click hook
---@param f function Function to execute
function aris.game.hook.add_on_right_click(f) end

---Clear all right-click hooks
function aris.game.hook.clear_on_right_click() end

---Register entity damaged hook
---@param f function Function to execute
function aris.game.hook.add_on_entity_damaged(f) end

---Register tick hook
---@param f function Function to execute
function aris.game.hook.add_tick(f) end

---Clear all tick hooks
function aris.game.hook.clear_tick() end

---Register command endpoint handler
---@param of string Endpoint ID
---@param func fun(player: LuaServerPlayer|nil, args: table) Function to execute
function aris.game.hook.register_endpoint(of, func) end

---Register C2S packet handler
---@param id string Packet ID
---@param func fun(player: LuaServerPlayer, data: table) Function to execute when packet is received
function aris.game.hook.add_c2s_packet_handler(id, func) end

---============================================
--- aris.game.command Library (Command Handling)
---============================================

aris.game.command = {}

---[DEPRECATED - use aris.game.hook.register_endpoint] Register function to execute when command endpoint is called
---@param of string Command endpoint ID
---@param func fun(player: LuaServerPlayer|nil, args: table) Function to execute
---@deprecated
function aris.game.command.register_endpoint(of, func) end

---============================================
--- aris.game.networking Library (Server Networking)
---============================================

aris.game.networking = {}

---Send S2C (Server to Client) packet
---@param player LuaServerPlayer Target player
---@param packet PacketBuilder Packet to send
function aris.game.networking.send_s2c_packet(player, packet) end

---Create S2C packet builder
---@param of string Packet ID
---@return PacketBuilder
function aris.game.networking.create_s2c_packet_builder(of) end

---[DEPRECATED - use aris.game.hook.add_c2s_packet_handler] Register C2S (Client to Server) packet handler
---@param id string Packet ID
---@param func fun(player: LuaServerPlayer, data: table) Function to execute when packet is received
---@deprecated
function aris.game.networking.register_c2s_packet_handler(id, func) end

---============================================
--- aris.game.client Library (Client In-Game)
---============================================

aris.game.client = {}

---Add system message to chat
---@param message string Message to add
function aris.game.client.send_system_message(message) end

---Invoke command in chat (client)
---@param command string Command to execute
function aris.game.client.invoke_command(command) end

---Get current player's X coordinate
---@return number
function aris.game.client.get_player_x() end

---Get current player's Y coordinate
---@return number
function aris.game.client.get_player_y() end

---Get current player's Z coordinate
---@return number
function aris.game.client.get_player_z() end

---Get current player's pitch (xRot)
---@return number
function aris.game.client.get_player_pitch() end

---Get current player's yaw (yRot)
---@return number
function aris.game.client.get_player_yaw() end

---[DEPRECATED - use aris.game.client.hook.add_tick_hook] Add function to execute every tick
---@param f function Function to execute
---@deprecated
function aris.game.client.add_tick_hook(f) end

---Get how long player has been using/charging an item (in ticks)
---@return number
function aris.game.client.item_used_duration() end

---Create HUD
---@return HudRenderer
function aris.game.client.create_hud() end

---Close all opened HUDs
function aris.game.client.clear_opened_hud() end

---Get string data received from server
---@param of string Data key
---@return string
function aris.game.client.remote_string_data(of) end

---Get number data received from server
---@param of string Data key
---@return number
function aris.game.client.remote_number_data(of) end

---Get item data received from server
---@param of string Data key
---@return LuaItemStack
function aris.game.client.remove_item_data(of) end

---[DEPRECATED - use aris.game.client.hook.on_key_pressed] Register function to execute on key press
---@param key string Key name
---@param func function Function to execute
---@deprecated
function aris.game.client.add_on_key_pressed(key, func) end

---Check if a key is currently pressed (may be unreliable)
---@param key number GLFW key code
---@return boolean
function aris.game.client.is_key_pressed(key) end

---Get the entity the player is looking at within reach distance
---@param reach number Reach distance
---@return LuaEntity|nil
function aris.game.client.target_crosshair_entity(reach) end

---============================================
--- aris.game.client.hook Library (Client Hooks)
---============================================

aris.game.client.hook = {}

---Add client-side tick hook
---매 틱마다 실행할 함수를 추가합니다
---@param f function Function to execute
function aris.game.client.hook.add_tick_hook(f) end

---Clear all client tick hooks
---매 틱마다 실행할 함수를 초기화합니다
function aris.game.client.hook.clear_tick_hook() end

---Register key press handler
---새로 추가한 조작키를 실행할때 실행될 함수를 지정합니다
---@param key string Key name (누를 키)
---@param func function Function to execute (실행할 함수)
function aris.game.client.hook.on_key_pressed(key, func) end

---Register S2C packet handler
---@param id string Packet ID
---@param func fun(data: table) Function to execute when packet is received
function aris.game.client.hook.add_s2c_packet_handler(id, func) end

---============================================
--- aris.game.client.networking Library (Client Networking)
---============================================

aris.game.client.networking = {}

---Send C2S (Client to Server) packet
---@param packet PacketBuilder Packet to send
function aris.game.client.networking.send_c2s_packet(packet) end

---Create C2S packet builder
---@param of string Packet ID
---@return PacketBuilder
function aris.game.client.networking.create_c2s_packet_builder(of) end

---[DEPRECATED - use aris.game.client.hook.add_s2c_packet_handler] Register S2C (Server to Client) packet handler
---@param id string Packet ID
---@param func fun(data: table) Function to execute when packet is received
---@deprecated
function aris.game.client.networking.register_s2c_packet_handler(id, func) end

---============================================
--- aris.client Library (Client GUI)
---============================================

aris.client = {}

---Create area builder
---@return AreaBuilder
function aris.client.create_area_builder() end

---Create 2D point
---@param x number X coordinate
---@param y number Y coordinate
---@return Point
---@overload fun(x: number, y: number, z: number): Point3
function aris.client.create_point(x, y) end

---Create window
---@return ScreenRenderer
function aris.client.create_window() end

---Create image renderer
---@param res ImageResource Image resource
---@return ScriptImageRenderer
function aris.client.create_image_renderer(res) end

---Create clickable area
---@param onClick function Function to execute on click
---@param area Area Area
---@return ScriptClickableRenderer
---@overload fun(onClick: function, x: number, y: number, width: number, height: number): ScriptClickableRenderer
function aris.client.create_clickable(onClick, area) end

---Create color renderer
---@param r number Red (0-255) or full color value
---@param g? number Green (0-255)
---@param b? number Blue (0-255)
---@param a? number Alpha (0-255)
---@return ScriptColorRenderer
function aris.client.create_color_renderer(r, g, b, a) end

---Create default text renderer
---@param text string Text to display
---@param color number Color
---@return ScriptDefaultTextRenderer
function aris.client.create_default_text_renderer(text, color) end

---Create item renderer
---@param item LuaItemStack Item stack
---@return ScriptItemRenderer
function aris.client.create_item_renderer(item) end

---Load image
---@param path string Image file path
---@param name? string Image name (optional)
---@return ImageResource
function aris.client.load_image(path, name) end

---Create base component
---@return BaseComponent
function aris.client.create_component() end

---Create rect component
---@return BaseRectComponent
function aris.client.create_rect_component() end

---Close screen
function aris.client.close_screen() end

---Get key binding
---@param of string Key binding name
---@return LuaKeyBinding|nil
function aris.client.get_keybinding(of) end

---============================================
--- Area Functions
---============================================

---Create rectangular area
---@param x number Left-top X coordinate
---@param y number Left-top Y coordinate
---@param width number Width
---@param height number Height
---@return Area
---@overload fun(p1: Point, p2: Point): Area
function create_rect_area(x, y, width, height) end

---============================================
--- Class Definitions
---============================================

---@class Point
---@field x number X coordinate
---@field y number Y coordinate
local Point = {}

---Subtract point
---@param other Point
---@return Point
function Point:minus(other) end

---Add point
---@param other Point
---@return Point
function Point:plus(other) end

---Divide point
---@param divisor number
---@return Point
function Point:div(divisor) end

---Get center point between two points
---@param other Point
---@return Point
function Point:center(other) end

---Convert to string
---@return string
function Point:into_string() end

---@class Point3
---@field x number X coordinate
---@field y number Y coordinate
---@field z number Z coordinate
local Point3 = {}

---Subtract point
---@param other Point3
---@return Point3
function Point3:minus(other) end

---Add point
---@param other Point3
---@return Point3
function Point3:plus(other) end

---Divide point
---@param divisor number
---@return Point3
function Point3:div(divisor) end

---Get center point between two points
---@param other Point3
---@return Point3
function Point3:center(other) end

---Convert to string
---@return string
function Point3:into_string() end

---@class Area
local Area = {}

---Check if point is inside area
---@param p Point
---@return boolean
function Area:is_in(p) end

---Scale area
---@param x number Scale factor
---@return Area
function Area:times(x) end

---Get center point of area
---@return Point
function Area:center() end

---Convert to string
---@return string
function Area:into_string() end

---@class AreaBuilder
local AreaBuilder = {}

---Append point
---@param p Point
function AreaBuilder:append(p) end

---Build area
---@return Area
function AreaBuilder:build() end

---@class LuaEntity
---@field name string Entity name
---@field type string Entity type
---@field display_name string Display name
---@field custom_name string Custom name
---@field entity_type LuaEntityType Entity type wrapper
---@field x number X coordinate
---@field y number Y coordinate
---@field z number Z coordinate
---@field uuid string Entity UUID
---@field server_world LuaServerWorld World entity is in
local LuaEntity = {}

---Add damage
---@param damage number Damage amount
function LuaEntity:add_damage(damage) end

---Add velocity
---@param x number X velocity
---@param y number Y velocity
---@param z number Z velocity
function LuaEntity:add_velocity(x, y, z) end

---Add velocity relative to entity direction
---@param x number Forward velocity
---@param y number Upward velocity
---@param z number Lateral velocity
function LuaEntity:add_velocity_relative(x, y, z) end

---Move relative to current position
---@param x number X delta
---@param y number Y delta
---@param z number Z delta
function LuaEntity:move_delta(x, y, z) end

---Move to absolute position
---@param x number X coordinate
---@param y number Y coordinate
---@param z number Z coordinate
function LuaEntity:move_to(x, y, z) end

---Move relative to entity direction
---@param x number Forward delta
---@param y number Upward delta
---@param z number Lateral delta
function LuaEntity:move_delta_relative(x, y, z) end

---Iterate over nearby entities
---@param fn function Callback function
---@param radius number Radius
---@param includeSelf boolean Whether to include self
function LuaEntity:iter_entities_nearby(fn, radius, includeSelf) end

---Get entity name
---@return string
function LuaEntity:get_name() end

---Get entity type
---@return string
function LuaEntity:get_type() end

---Get entity display name
---@return string
function LuaEntity:get_display_name() end

---Set entity custom name
---@param name string Custom name
function LuaEntity:set_custom_name(name) end

---Get entity custom name
---@return string
function LuaEntity:get_custom_name() end

---Get entity type wrapper
---@return LuaEntityType
function LuaEntity:get_entity_type() end

---Set entity X coordinate
---@param x number X coordinate
function LuaEntity:set_x(x) end

---Get entity X coordinate
---@return number
function LuaEntity:get_x() end

---Set entity Y coordinate
---@param y number Y coordinate
function LuaEntity:set_y(y) end

---Get entity Y coordinate
---@return number
function LuaEntity:get_y() end

---Set entity Z coordinate
---@param z number Z coordinate
function LuaEntity:set_z(z) end

---Get entity Z coordinate
---@return number
function LuaEntity:get_z() end

---Get entity UUID
---@return string
function LuaEntity:get_uuid() end

---Get entity's world
---@return LuaServerWorld
function LuaEntity:get_server_world() end

---@class LuaLivingEntity : LuaEntity
---@field pitch number Entity pitch (xRot)
---@field yaw number Entity yaw (yRot)
local LuaLivingEntity = {}

---Add effect
---@param effect LuaMobEffectInstance Effect
function LuaLivingEntity:add_effect(effect) end

---Clear all effects
function LuaLivingEntity:clear_effect() end

---Remove specific effect
---@param of string Effect ID
---@overload fun(ns: string, of: string)
function LuaLivingEntity:remove_effect(of) end

---Set entity pitch (xRot)
---@param pitch number Pitch value
function LuaLivingEntity:set_pitch(pitch) end

---Get entity pitch (xRot)
---@return number
function LuaLivingEntity:get_pitch() end

---Set entity yaw (yRot)
---@param yaw number Yaw value
function LuaLivingEntity:set_yaw(yaw) end

---Get entity yaw (yRot)
---@return number
function LuaLivingEntity:get_yaw() end

---@class LuaPlayerEntity : LuaLivingEntity
---@field main_hand_item LuaItemStack Main hand item
local LuaPlayerEntity = {}

---Get main hand item
---@return LuaItemStack
function LuaPlayerEntity:get_main_hand_item() end

---@class LuaServerPlayer : LuaPlayerEntity
local LuaServerPlayer = {}

---Send message (text)
---@param msg string Message
function LuaServerPlayer:send_message_text(msg) end

---Send message
---@param msg any Message component
function LuaServerPlayer:send_message(msg) end

---Iterate over nearby players
---@param fn function Callback function
---@param distance number Distance
---@param includeSelf boolean Whether to include self
function LuaServerPlayer:iter_player_nearby(fn, distance, includeSelf) end

---Set main hand item
---@param item LuaItemStack Item to set
function LuaServerPlayer:set_main_hand_item(item) end

---Get main hand item
---@return LuaItemStack
function LuaServerPlayer:get_main_hand_item() end

---@class LuaItemStack
---@field count number Item count
---@field display_name string Display name
---@field name string Base name
local LuaItemStack = {}

---Set item count
---@param count number Item count
function LuaItemStack:set_count(count) end

---Get item count
---@return number
function LuaItemStack:get_count() end

---Get item display name
---@return string
function LuaItemStack:get_display_name() end

---Get item base name
---@return string
function LuaItemStack:get_name() end

---@class LuaMobEffectInstance
---@field duration number Duration (ticks)
---@field amplifier number Amplifier
---@field ambient boolean Show bubbles
---@field visible boolean Visible
---@field showIcon boolean Show icon
local LuaMobEffectInstance = {}

---Set duration (in ticks)
---@param duration number Duration in ticks
function LuaMobEffectInstance:set_duration(duration) end

---Get duration (in ticks)
---@return number
function LuaMobEffectInstance:get_duration() end

---Set amplifier
---@param amplifier number Amplifier value
function LuaMobEffectInstance:set_amplifier(amplifier) end

---Get amplifier
---@return number
function LuaMobEffectInstance:get_amplifier() end

---Set ambient (show bubbles)
---@param ambient boolean Whether to show bubbles
function LuaMobEffectInstance:set_ambient(ambient) end

---Get ambient (show bubbles)
---@return boolean
function LuaMobEffectInstance:get_ambient() end

---Set visible
---@param visible boolean Whether visible
function LuaMobEffectInstance:set_visible(visible) end

---Get visible
---@return boolean
function LuaMobEffectInstance:get_visible() end

---Set show icon
---@param showIcon boolean Whether to show icon
function LuaMobEffectInstance:set_showIcon(showIcon) end

---Get show icon
---@return boolean
function LuaMobEffectInstance:get_showIcon() end

---@class LuaNBTCompound
local LuaNBTCompound = {}

---Convert NBT into JSON string
---@return string
function LuaNBTCompound:into_string() end

---Convert NBT into Lua Table
---@return any
function LuaNBTCompound:into_table() end

---Convert NBT into item stack
---@return LuaItemStack
function LuaNBTCompound:into_item_stack() end

---Apply (overwrite) current NBT into entity
---@param entity LuaEntity Entity to apply NBT to
function LuaNBTCompound:apply_entity(entity) end

---Spawn entity with this NBT
---@param level LuaServerWorld Server level to spawn in
---@return LuaEntity Spawned entity
function LuaNBTCompound:spawn_entity(level) end

---Places block entity with this NBT (replaces if existing)
---@param level LuaServerWorld Server level
---@return boolean Whether successful
function LuaNBTCompound:place_block_entity(level) end

---Place block with this NBT at provided position (replaces if exists)
---@param level LuaServerWorld Server level
---@param x number X position
---@param y number Y position
---@param z number Z position
---@return boolean Whether successful
function LuaNBTCompound:place_block_state(level, x, y, z) end

---@class LuaDamageSource
---@field amount number Damage amount
---@field causing LuaEntity|nil Entity that caused damage
---@field direct LuaEntity|nil Direct entity that dealt damage
---@field isDirect boolean Whether this is direct damage
---@field id string Damage type ID
local LuaDamageSource = {}

---Set damage amount
---@param amount number Damage amount
function LuaDamageSource:set_amount(amount) end

---Get damage amount
---@return number
function LuaDamageSource:get_amount() end

---Get causing entity
---@return LuaEntity|nil
function LuaDamageSource:get_causing() end

---Get direct entity
---@return LuaEntity|nil
function LuaDamageSource:get_direct() end

---Get whether this is direct damage
---@return boolean
function LuaDamageSource:get_isDirect() end

---Get damage type ID
---@return string
function LuaDamageSource:get_id() end

---@class LuaServerWorld
local LuaServerWorld = {}

---@class LuaEntityType
local LuaEntityType = {}

---@class LuaKeyBinding
---@field is_down boolean Whether key is pressed
local LuaKeyBinding = {}

---Consume key press event
---@return boolean
function LuaKeyBinding:consume() end

---@class ParticleInfo
local ParticleInfo = {}

---Set particle lifetime
---@param lifetime number Lifetime value
function ParticleInfo:set_lifetime(lifetime) end

---Get particle lifetime
---@return number
function ParticleInfo:get_lifetime() end

---Set whether particle has physics
---@param hasPhysics boolean Has physics
function ParticleInfo:set_has_physics(hasPhysics) end

---Get whether particle has physics
---@return boolean
function ParticleInfo:get_has_physics() end

---Set particle friction
---@param friction number Friction value
function ParticleInfo:set_friction(friction) end

---Get particle friction
---@return number
function ParticleInfo:get_friction() end

---Set particle quad size
---@param quadSize number Quad size
function ParticleInfo:set_quadSize(quadSize) end

---Get particle quad size
---@return number
function ParticleInfo:get_quadSize() end

---Set particle red color component
---@param r number Red (0-255)
function ParticleInfo:set_r(r) end

---Get particle red color component
---@return number
function ParticleInfo:get_r() end

---Set particle green color component
---@param g number Green (0-255)
function ParticleInfo:set_g(g) end

---Get particle green color component
---@return number
function ParticleInfo:get_g() end

---Set particle blue color component
---@param b number Blue (0-255)
function ParticleInfo:set_b(b) end

---Get particle blue color component
---@return number
function ParticleInfo:get_b() end

---@class BaseComponent
---@field x number X position
---@field y number Y position
---@field rotation number Rotation in degrees
---@field anchor_x number Anchor point X (pivot point for rotation/scale)
---@field anchor_y number Anchor point Y (pivot point for rotation/scale)
---@field is_scale_rate_fixed boolean Whether scale rate is fixed
---@field scale_x number X scale
---@field scale_y number Y scale
---@field scale number Overall scale
---@field is_visible boolean Whether visible
---@field is_active boolean Whether active
---@field parent BaseComponent|nil Parent component (read-only)
local BaseComponent = {}

---Set X position
---@param x number X position
function BaseComponent:set_x(x) end

---Set Y position
---@param y number Y position
function BaseComponent:set_y(y) end

---Set rotation in degrees
---@param rotation number Rotation angle
function BaseComponent:set_rotation(rotation) end

---Set anchor X position (pivot point)
---@param anchor_x number Anchor X
function BaseComponent:set_anchor_x(anchor_x) end

---Set anchor Y position (pivot point)
---@param anchor_y number Anchor Y
function BaseComponent:set_anchor_y(anchor_y) end

---Set X scale
---@param scale_x number X scale
function BaseComponent:set_scale_x(scale_x) end

---Set Y scale
---@param scale_y number Y scale
function BaseComponent:set_scale_y(scale_y) end

---Set overall scale
---@param scale number Overall scale
function BaseComponent:set_scale(scale) end

---Set whether scale rate is fixed
---@param is_scale_rate_fixed boolean Whether scale rate is fixed
function BaseComponent:set_is_scale_rate_fixed(is_scale_rate_fixed) end

---Set whether visible
---@param is_visible boolean Whether visible
function BaseComponent:set_is_visible(is_visible) end

---Set whether active
---@param is_active boolean Whether active
function BaseComponent:set_is_active(is_active) end

---Add child component
---@param child BaseComponent
function BaseComponent:add_child(child) end

---Add render hook
---The function invoked on each frame
---@param fn fun(mx: number, my: number, delta: number) Function to execute on each frame (scaled_mouse_x, scaled_mouse_y, tick_delta)
function BaseComponent:add_render_hook(fn) end

---Clear render hooks
function BaseComponent:clear_render_hook() end

---Add tick hook
---The function invoked on each tick
---@param fn function Function to execute on each tick
function BaseComponent:add_tick_hook(fn) end

---Clear tick hooks
function BaseComponent:clear_tick_hook() end

---Clear child components
function BaseComponent:clear_child() end

---Remove child component
---@param child BaseComponent
function BaseComponent:remove_child(child) end

---Convert global screen coordinates to local coordinates relative to this component
---@param mx number Global X coordinate
---@param my number Global Y coordinate
---@return number local_x, number local_y
function BaseComponent:get_local_coordinate(mx, my) end

---Convert local coordinates to global screen coordinates
---@param lx number Local X coordinate
---@param ly number Local Y coordinate
---@return number global_x, number global_y
function BaseComponent:get_global_coordinate(lx, ly) end

---@class BaseRectComponent : BaseComponent
---@field width number Width
---@field height number Height
---@field fixed_width number Fixed width
---@field fixed_height number Fixed height
local BaseRectComponent = {}

---Set width
---@param width number Width
function BaseRectComponent:set_width(width) end

---Set height
---@param height number Height
function BaseRectComponent:set_height(height) end

---Set fixed width
---@param fixed_width number Fixed width
function BaseRectComponent:set_fixed_width(fixed_width) end

---Set fixed height
---@param fixed_height number Fixed height
function BaseRectComponent:set_fixed_height(fixed_height) end

---@class ScreenRenderer : BaseRectComponent
---@field can_exit_with_esc boolean Can exit with ESC
---@field window_width number Window width (read-only)
---@field window_height number Window height (read-only)
local ScreenRenderer = {}

---Open screen
function ScreenRenderer:open() end

---Close screen
function ScreenRenderer:close() end

---Set key down hook
---@param fn fun(keyCode: number, scanCode: number, modifiers: number) Function to execute when key is pressed
function ScreenRenderer:set_key_down_hook(fn) end

---Clear key down hook
function ScreenRenderer:clear_key_down_hook() end

---Set key up hook
---@param fn fun(keyCode: number, scanCode: number, modifiers: number) Function to execute when key is released
function ScreenRenderer:set_key_up_hook(fn) end

---Clear key up hook
function ScreenRenderer:clear_key_up_hook() end

---Set whether can exit with ESC
---@param can_exit boolean
function ScreenRenderer:set_can_exit_with_esc(can_exit) end

---@class HudRenderer : BaseRectComponent
local HudRenderer = {}

---Open HUD
function HudRenderer:open_hud() end

---Close HUD
function HudRenderer:close_hud() end

---@class ScriptImageRenderer : BaseRectComponent
---@field image ImageResource Image resource
local ScriptImageRenderer = {}

---Set image resource
---@param image ImageResource Image resource
function ScriptImageRenderer:set_image(image) end

---Get UV1 coordinates
---@return number u, number v
function ScriptImageRenderer:get_uv1() end

---Get UV2 coordinates
---@return number u, number v
function ScriptImageRenderer:get_uv2() end

---Set UV1 coordinates
---@param u number
---@param v number
function ScriptImageRenderer:set_uv1(u, v) end

---Set UV2 coordinates
---@param u number
---@param v number
function ScriptImageRenderer:set_uv2(u, v) end

---Crop from UV1
---@param u number
---@param v number
function ScriptImageRenderer:crop_uv1(u, v) end

---Crop to UV2
---@param u number
---@param v number
function ScriptImageRenderer:crop_uv2(u, v) end

---@class ScriptClickableRenderer : BaseComponent
---@field area Area Clickable area
local ScriptClickableRenderer = {}

---@class ScriptColorRenderer : BaseRectComponent
---@field r number Red (0-255)
---@field g number Green (0-255)
---@field b number Blue (0-255)
---@field a number Alpha (0-255)
---@field color number Packed color value
local ScriptColorRenderer = {}

---Set red component
---@param r number Red (0-255)
function ScriptColorRenderer:set_r(r) end

---Set green component
---@param g number Green (0-255)
function ScriptColorRenderer:set_g(g) end

---Set blue component
---@param b number Blue (0-255)
function ScriptColorRenderer:set_b(b) end

---Set alpha component
---@param a number Alpha (0-255)
function ScriptColorRenderer:set_a(a) end

---Set color
---@param color number Packed color value
function ScriptColorRenderer:set_color(color) end

---@class ScriptDefaultTextRenderer : BaseComponent
---@field text string Text content
---@field color number Text color
local ScriptDefaultTextRenderer = {}

---Set text
---@param text string Text content
function ScriptDefaultTextRenderer:set_text(text) end

---Set text color
---@param color number Text color
function ScriptDefaultTextRenderer:set_color(color) end

---@class ScriptItemRenderer : BaseComponent
---@field item LuaItemStack Item to render
local ScriptItemRenderer = {}

---Set item
---@param item LuaItemStack Item to render
function ScriptItemRenderer:set_item(item) end

---@class ImageResource
local ImageResource = {}

---============================================
--- Networking Classes
---============================================

---@class PacketBuilder
local PacketBuilder = {}

---Append integer to packet
---@param id string Parameter name
---@param value number Integer value
function PacketBuilder:append_int(id, value) end

---Append string to packet
---@param id string Parameter name
---@param value string String value
function PacketBuilder:append_string(id, value) end

---Append float to packet
---@param id string Parameter name
---@param value number Float value
function PacketBuilder:append_float(id, value) end

---@class PacketDeclaration
local PacketDeclaration = {}

---Append argument to packet declaration
---@param packet PackableData Packable data argument
function PacketDeclaration:append(packet) end

---@class PackableData
local PackableData = {}

---@class AbstractCommandHandler
local AbstractCommandHandler = {}

---Set command endpoint ID
---@param of string Endpoint ID
function AbstractCommandHandler:set_endpoint(of) end

---Append sub-command or argument
---@param handler AbstractCommandHandler Command handler to append
function AbstractCommandHandler:append(handler) end
