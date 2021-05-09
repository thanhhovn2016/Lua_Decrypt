-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: launcher.init 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

(package.loaded)["launcher.config"] = nil
require("launcher.config")
require("lfs")
local cjson = require("cjson")
Launcher = {}
-- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

Launcher.updDir = "upd/"
-- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

Launcher.updFile = "upd"
-- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

Launcher.fListName = "flist"
-- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

Launcher.initFlistName = "initFlist"
-- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

Launcher.updateFilePostfix = ".upd"
local sharedApplication = CCApplication:sharedApplication()
local sharedDirector = CCDirector:sharedDirector()
local target = sharedApplication:getTargetPlatform()
-- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

Launcher.platform = "unknown"
-- DECOMPILER ERROR at PC35: Confused about usage of register: R4 in 'UnsetPending'

Launcher.model = "unknown"
local sharedApplication = CCApplication:sharedApplication()
local target = sharedApplication:getTargetPlatform()
-- DECOMPILER ERROR at PC45: Confused about usage of register: R6 in 'UnsetPending'

if target == kTargetWindows then
  Launcher.platform = "windows"
else
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R6 in 'UnsetPending'

  if target == kTargetMacOS then
    Launcher.platform = "mac"
  else
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R6 in 'UnsetPending'

    if target == kTargetAndroid then
      Launcher.platform = "android"
    else
      -- DECOMPILER ERROR at PC66: Confused about usage of register: R6 in 'UnsetPending'

      if target == kTargetIphone or target == kTargetIpad then
        Launcher.platform = "ios"
        -- DECOMPILER ERROR at PC71: Confused about usage of register: R6 in 'UnsetPending'

        if target == kTargetIphone then
          Launcher.model = "iphone"
        else
          -- DECOMPILER ERROR at PC74: Confused about usage of register: R6 in 'UnsetPending'

          Launcher.model = "ipad"
        end
      end
    end
  end
end
local glview = sharedDirector:getOpenGLView()
local size = glview:getFrameSize()
local w = size.width
local h = size.height
if CONFIG_SCREEN_WIDTH == nil or CONFIG_SCREEN_HEIGHT == nil then
  CONFIG_SCREEN_WIDTH = w
  CONFIG_SCREEN_HEIGHT = h
end
if not CONFIG_SCREEN_AUTOSCALE then
  local fw = w / CONFIG_SCREEN_WIDTH
  local fh = h / CONFIG_SCREEN_HEIGHT
  if fh < fw then
    CONFIG_SCREEN_AUTOSCALE = "FIXED_HEIGHT"
  else
    CONFIG_SCREEN_AUTOSCALE = "FIXED_WIDTH"
  end
else
  do
    CONFIG_SCREEN_AUTOSCALE = (string.upper)(CONFIG_SCREEN_AUTOSCALE)
    local scale, scaleX, scaleY = nil, nil, nil
    if CONFIG_SCREEN_AUTOSCALE then
      if type(CONFIG_SCREEN_AUTOSCALE_CALLBACK) == "function" then
        scaleX = CONFIG_SCREEN_AUTOSCALE_CALLBACK(w, h, Launcher.model)
      end
      -- DECOMPILER ERROR at PC133: Overwrote pending register: R12 in 'AssignReg'

      if not scaleX or not scaleY then
        scaleX = w / CONFIG_SCREEN_WIDTH
      end
      if CONFIG_SCREEN_AUTOSCALE == "FIXED_WIDTH" then
        scale = scaleX
        CONFIG_SCREEN_HEIGHT = h / (scale)
      else
        if CONFIG_SCREEN_AUTOSCALE == "FIXED_HEIGHT" then
          scale = scaleY
          CONFIG_SCREEN_WIDTH = w / scale
        else
          scale = 1
        end
      end
      glview:setDesignResolutionSize(CONFIG_SCREEN_WIDTH, CONFIG_SCREEN_HEIGHT, kResolutionNoBorder)
    end
    local winSize = sharedDirector:getWinSize()
    -- DECOMPILER ERROR at PC163: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.size = {width = winSize.width, height = winSize.height}
    -- DECOMPILER ERROR at PC168: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.width = (Launcher.size).width
    -- DECOMPILER ERROR at PC173: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.height = (Launcher.size).height
    -- DECOMPILER ERROR at PC178: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.cx = Launcher.width / 2
    -- DECOMPILER ERROR at PC183: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.cy = Launcher.height / 2
    -- DECOMPILER ERROR at PC190: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.writablePath = (CCFileUtils:sharedFileUtils()):getWritablePath()
    -- DECOMPILER ERROR at PC195: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.RequestType = {FLIST = 0, RES = 2}
    -- DECOMPILER ERROR at PC205: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.UpdateRetType = {SUCCESSED = 0, NETWORK_ERROR = 1, MD5_ERROR = 2, VERSION_ERROR = 3, OTHER_ERROR = 4, UPDATE_UPDATE = 5, FILE_LOST = 6}
    lcher_handler = function(obj, method)
  -- function num : 0_0
  return function(...)
    -- function num : 0_0_0 , upvalues : method, obj
    return method(obj, ...)
  end

end

    lcher_class = function(classname, super)
  -- function num : 0_1
  local superType = (type(super))
  local cls = nil
  if superType ~= "function" and superType ~= "table" then
    superType = nil
    super = nil
  end
  if superType == "function" or super and super.__ctype == 1 then
    cls = {}
    if superType == "table" then
      for k,v in pairs(super) do
        cls[k] = v
      end
      cls.__create = super.__create
      cls.super = super
    else
      cls.__create = super
      cls.ctor = function()
    -- function num : 0_1_0
  end

    end
    cls.__cname = classname
    cls.__ctype = 1
    cls.new = function(...)
    -- function num : 0_1_1 , upvalues : cls
    local instance = (cls.__create)(...)
    for k,v in pairs(cls) do
      instance[k] = v
    end
    instance.class = cls
    instance:ctor(...)
    return instance
  end

  else
    if super then
      cls = {}
      setmetatable(cls, {__index = super})
      cls.super = super
    else
      cls = {ctor = function()
    -- function num : 0_1_2
  end
}
    end
    cls.__cname = classname
    cls.__ctype = 2
    cls.__index = cls
    cls.new = function(...)
    -- function num : 0_1_3 , upvalues : cls
    local instance = setmetatable({}, cls)
    instance.class = cls
    instance:ctor(...)
    return instance
  end

  end
  return cls
end

    -- DECOMPILER ERROR at PC212: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.fileExists = function(path)
  -- function num : 0_2
  return (CCFileUtils:sharedFileUtils()):isFileExist(path)
end

    -- DECOMPILER ERROR at PC215: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.readFile = function(path)
  -- function num : 0_3
  local file = (io.open)(path, "rb")
  do
    if file then
      local content = file:read("*all")
      ;
      (io.close)(file)
      return content
    end
    return nil
  end
end

    -- DECOMPILER ERROR at PC218: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.writefile = function(path, content, mode)
  -- function num : 0_4
  if not mode then
    mode = "w+b"
  end
  local file = (io.open)(path, mode)
  if file then
    if file:write(content) == nil then
      return false
    end
    ;
    (io.close)(file)
    return true
  else
    return false
  end
end

    -- DECOMPILER ERROR at PC221: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.removePath = function(path)
  -- function num : 0_5
  local mode = (lfs.attributes)(path, "mode")
  if mode == "directory" then
    local dirPath = path .. "/"
    for file in (lfs.dir)(dirPath) do
      if file ~= "." and file ~= ".." then
        local f = dirPath .. file
        ;
        (Launcher.removePath)(f)
      end
    end
    ;
    (os.remove)(path)
  else
    do
      ;
      (os.remove)(path)
    end
  end
end

    -- DECOMPILER ERROR at PC224: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.mkDir = function(path)
  -- function num : 0_6
  if not (Launcher.fileExists)(path) then
    return (lfs.mkdir)(path)
  end
  return true
end

    -- DECOMPILER ERROR at PC227: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.checkFileWithMd5 = function(filePath, cryptoCode)
  -- function num : 0_7
  local fMd5 = CCCrypto:MD5File(filePath)
  if fMd5 == (string.lower)(cryptoCode) then
    return true
  end
  return false
end

    -- DECOMPILER ERROR at PC230: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.getFileMd5 = function(filePath)
  -- function num : 0_8
  return CCCrypto:MD5File(filePath)
end

    -- DECOMPILER ERROR at PC233: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.performWithDelayGlobal = function(listener, time)
  -- function num : 0_9
  local scheduler = ((CCDirector:sharedDirector()):getScheduler())
  local handle = nil
  handle = scheduler:scheduleScriptFunc(function()
    -- function num : 0_9_0 , upvalues : scheduler, handle, listener
    scheduler:unscheduleScriptEntry(handle)
    listener()
  end
, time, false)
end

    -- DECOMPILER ERROR at PC236: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.getpathes = function(rootpath, pathes)
  -- function num : 0_10
  if not pathes then
    pathes = {}
  end
  ret = pcall(lfs.dir, rootpath)
  if ret == false then
    return pathes
  end
  for entry in files do
    local next = false
    if entry ~= "." and entry ~= ".." then
      local path = rootpath .. "/" .. entry
      local attr = (lfs.attributes)(path)
      if attr == nil then
        next = true
      end
      if next == false then
        if attr.mode == "directory" then
          (Launcher.getpathes)(path, pathes)
        else
          ;
          (table.insert)(pathes, path)
        end
      end
    end
    do
      do
        next = false
        -- DECOMPILER ERROR at PC53: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return pathes
end

    -- DECOMPILER ERROR at PC240: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.runWithScene = function(scene)
  -- function num : 0_11 , upvalues : sharedDirector
  local curScene = sharedDirector:getRunningScene()
  if curScene then
    sharedDirector:replaceScene(scene)
  else
    sharedDirector:runWithScene(scene)
  end
end

    -- DECOMPILER ERROR at PC244: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.decode = function(text)
  -- function num : 0_12 , upvalues : cjson
  local status, result = pcall(cjson.decode, text)
  if status then
    return result
  end
  if DEBUG > 1 then
    printError("json.decode() - decoding failed: %s", tostring(result))
  end
end

    -- DECOMPILER ERROR at PC248: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.encode = function(var)
  -- function num : 0_13 , upvalues : cjson
  local status, result = pcall(cjson.encode, var)
  if status then
    return result
  end
  if DEBUG > 1 then
    printError("json.encode() - encoding failed: %s", tostring(result))
  end
end

    -- DECOMPILER ERROR at PC251: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.string_split = function(str, split_char)
  -- function num : 0_14
  local sub_str_tab = {}
  while 1 do
    local pos = (string.find)(str, split_char)
    do
      if not pos then
        local size_t = (table.getn)(sub_str_tab)
        ;
        (table.insert)(sub_str_tab, size_t + 1, str)
        break
      end
      local sub_str = (string.sub)(str, 1, pos - 1)
      local size_t = (table.getn)(sub_str_tab)
      ;
      (table.insert)(sub_str_tab, size_t + 1, sub_str)
      do
        local t = (string.len)(str)
        str = (string.sub)(str, pos + 1, t)
        -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  return sub_str_tab
end

    -- DECOMPILER ERROR at PC254: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.split = function(input, delimiter)
  -- function num : 0_15
  input = tostring(input)
  delimiter = tostring(delimiter)
  if delimiter == "" then
    return false
  end
  local pos, arr = 0, {}
  for st,sp in function()
    -- function num : 0_15_0 , upvalues : input, delimiter, pos
    return (string.find)(input, delimiter, pos, true)
  end
 do
    (table.insert)(arr, (string.sub)(input, pos, st - 1))
    pos = sp + 1
  end
  ;
  (table.insert)(arr, (string.sub)(input, pos))
  return arr
end

    -- DECOMPILER ERROR at PC257: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSReaderWidget = function(fileName)
  -- function num : 0_16
  return (GUIReader:shareReader()):widgetFromJsonFileAndPath(fileName, "")
end

    -- DECOMPILER ERROR at PC260: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSReader = function(filename, stretch)
  -- function num : 0_17
  local layer = CCLayer:create()
  layer:setPosition(ccp((Launcher.width - 960) / 2, (Launcher.height - 640) / 2))
  local tp = TouchGroup:create()
  layer:addChild(tp, 0, 100)
  local ccs = (Launcher.CCSReaderWidget)(filename)
  tp:addWidget(ccs)
  return layer, tp, ccs
end

    -- DECOMPILER ERROR at PC263: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSReaderWidgetGroup = function(filename)
  -- function num : 0_18
  local touchGroup = TouchGroup:create()
  local ccs = (Launcher.CCSReaderWidget)(filename)
  touchGroup:addWidget(ccs)
  return touchGroup
end

    -- DECOMPILER ERROR at PC265: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.GBSize = 1073741824
    -- DECOMPILER ERROR at PC267: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.MBSize = 1048576
    -- DECOMPILER ERROR at PC269: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.KBSize = 1024
    -- DECOMPILER ERROR at PC272: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.getDownLoadSize = function(size)
  -- function num : 0_19
  local x = 1
  local sizeStr = nil
  if Launcher.GBSize < size then
    if size % Launcher.GBSize == 0 then
      sizeStr = (string.format)("%dG", size / Launcher.GBSize)
    else
      sizeStr = (string.format)("%.2fG", size / Launcher.GBSize)
    end
  else
    if Launcher.MBSize < size then
      if size % Launcher.MBSize == 0 then
        sizeStr = (string.format)("%dM", size / Launcher.MBSize)
      else
        sizeStr = (string.format)("%.2fM", size / Launcher.MBSize)
      end
    else
      if Launcher.KBSize < size then
        if size % Launcher.KBSize == 0 then
          sizeStr = (string.format)("%dK", size / Launcher.KBSize)
        else
          sizeStr = (string.format)("%.2fK", size / Launcher.KBSize)
        end
      else
        sizeStr = tostring(size) .. "B"
      end
    end
  end
  return sizeStr
end

    -- DECOMPILER ERROR at PC275: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSBindButton = function(tp, tag, target, handler, param)
  -- function num : 0_20
  local callback = function(sender, touchType)
    -- function num : 0_20_0 , upvalues : handler, target, param
    if touchType == 0 then
      return true
    else
      if touchType == 1 then
        return false
      else
        if touchType == 2 then
          handler(target, sender, param)
        end
      end
    end
  end

  local btn = nil
  if tag then
    btn = tp:getWidgetByTag(tag)
  else
    btn = tp
  end
  if btn then
    btn:setTouchEnabled(true)
    btn:addTouchEventListener(callback)
  end
  return btn
end

    -- DECOMPILER ERROR at PC278: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSWidgetVisible = function(tp, tag, bvisible)
  -- function num : 0_21
  local widget = tp:getWidgetByTag(tag)
  if widget then
    widget:setVisible(bvisible)
  end
  return widget
end

    -- DECOMPILER ERROR at PC281: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSSetLableString = function(tp, tag, str)
  -- function num : 0_22
  do
    if str and tp then
      local label = tp:getWidgetByTag(tag)
      if label then
        label:setText(tostring(str))
      end
      return label
    end
    return nil
  end
end

    -- DECOMPILER ERROR at PC284: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.CCSSetUIButtonImage = function(tp, tag, normal, press, disable)
  -- function num : 0_23
  local widgetItem = tp:getWidgetByTag(tag)
  if widgetItem then
    widgetItem:loadTextures(normal, press, disable)
  end
  return widgetItem
end

    -- DECOMPILER ERROR at PC287: Confused about usage of register: R14 in 'UnsetPending'

    Launcher.doFile = function(path)
  -- function num : 0_24
  do
    if (Launcher.fileExists)(path) then
      local fileData = CZHelperFunc:getFileData(path)
      return fileData
    end
    return nil
  end
end

  end
end

