-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: launcher.launcher 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

(package.loaded)["launcher.init"] = nil
require("launcher.init")
local luaj = {}
local callJavaStaticMethod = nil
if Launcher.platform == "android" then
  callJavaStaticMethod = CCLuaJavaBridge.callStaticMethod
  local checkArguments = function(args, sig)
  -- function num : 0_0
  if type(args) ~= "table" then
    args = {}
  end
  if sig then
    return args, sig
  end
  sig = {"("}
  for i,v in ipairs(args) do
    local t = type(v)
    if t == "number" then
      sig[#sig + 1] = "F"
    else
      if t == "boolean" then
        sig[#sig + 1] = "Z"
      else
        if t == "function" then
          sig[#sig + 1] = "I"
        else
          sig[#sig + 1] = "Ljava/lang/String;"
        end
      end
    end
  end
  sig[#sig + 1] = ")V"
  return args, (table.concat)(sig)
end

  do
    luaj.callStaticMethod = function(className, methodName, args, sig)
  -- function num : 0_1 , upvalues : checkArguments, callJavaStaticMethod
  local args, sig = checkArguments(args, sig)
  print("luaj.callStaticMethod(\"%s\",\n\t\"%s\",\n\targs,\n\t\"%s\"", className, methodName, sig)
  return callJavaStaticMethod(className, methodName, args, sig)
end

  end
else
  do
    luaj.callStaticMethod = function(...)
  -- function num : 0_2
end

    local enter_game = function(self)
  -- function num : 0_3
  if Launcher.platform == "android" or Launcher.platform == "ios" then
    CCLuaLoadChunksFromZIP("framework_precompiled.zip")
    CCLuaLoadChunksFromZIP("app_precompiled.zip")
    ;
    (SDKHelper:shareSDKHelper()):addSkipBackupAttribute(Launcher.writablePath .. Launcher.updFile)
  end
  if Launcher.platform == "android" then
    (SDKHelper:shareSDKHelper()):setSDKType(CONFIG_CHANNEL_ID)
  end
  if not (self._progressLabel):isVisible() then
    self:_updateNeedDownloadFiles()
  end
  ;
  (self._progressDesLbl):setVisible(false)
  ;
  (self._intoDesLbl):setVisible(true)
  ;
  (self._progressLabel):setText((string.format)("%d%%", 0))
  ;
  (self._progressBar):setPercentage(0)
  local process = 0
  local setProcess = function(max)
    -- function num : 0_3_0 , upvalues : process, self
    if max then
      process = 100
    else
      process = process + 2.5
    end
    if process > 100 then
      return 
    end
    ;
    (self._progressLabel):setText((string.format)("%d%%", process))
    ;
    (self._progressBar):setPercentage(process)
  end

  ;
  (((require("app.SanguoApp")).new)("Sanguo", nil, setProcess)):run()
end

    local LauncherScene = lcher_class("LauncherScene", function()
  -- function num : 0_4
  local scene = CCScene:create()
  scene.name = "LauncherScene"
  return scene
end
)
    LauncherScene.ViewTag = {BG = 493, WAIT_DES_LBL = 520, PROGRESS_DES_LBL = 507, INTO_DES_LBL = 2763, PROGRESS_BAR = 534, PROGRESS_PERCENT_LBL = 535, PROGRESS_LIGHT = 546, TIPS = 664}
    LauncherScene.AlertViewTag = {DES_LBL1 = 500, DES_LBL2 = 501, EXIT_BTN = 502, SURE_BTN = 503, UPDATE_BTN = 504}
    LauncherScene.ctor = function(self)
  -- function num : 0_5 , upvalues : LauncherScene, luaj, enter_game
  self._path = Launcher.writablePath .. Launcher.updDir
  if (Launcher.platform == "android" or Launcher.platform == "ios") and not self:_checkUpdate() then
    return 
  end
  local logo, bg = nil, nil
  local sdkLogo = {}
  local cnLogo = "image/logo/cn_Logo.png"
  sdkLogo[24] = "image/logo/ky_logo.png"
  sdkLogo[14] = "image/logo/dangle_logo.jpg"
  sdkLogo[34] = "image/logo/pps_logo.png"
  sdkLogo[32] = "image/logo/pptv_logo.png"
  sdkLogo[33] = "image/logo/muzhiwan_logo.png"
  sdkLogo[11] = "image/logo/anzhi_logo.png"
  sdkLogo[31] = "image/logo/youku_logo.png"
  sdkLogo[42] = "image/logo/chongchong_logo.png"
  sdkLogo[45] = "image/logo/sougou_logo.png"
  sdkLogo[48] = "image/logo/leshi_logo.png"
  sdkLogo[51] = "image/logo/dangle_logo.jpg"
  if sdkLogo[CONFIG_CHANNEL_ID] then
    bg = CCLayerColor:create(ccc4(255, 255, 255, 255))
    self:addChild(bg)
    logo = CCSprite:create(sdkLogo[CONFIG_CHANNEL_ID])
    logo:setPosition(ccp(Launcher.width / 2, Launcher.height / 2))
    local contentSize = logo:getContentSize()
    do
      do
        if CONFIG_CHANNEL_ID == 32 then
          local winSize = (CCDirector:sharedDirector()):getWinSize()
          logo:setScaleX(winSize.width / contentSize.width)
          logo:setScaleY(winSize.height / contentSize.height)
        end
        logo:setOpacity(0)
        self:addChild(logo)
        local init = function()
    -- function num : 0_5_0 , upvalues : self, LauncherScene, luaj, enter_game
    self:removeAllChildren()
    local layer, tp, ccs = (Launcher.CCSReader)("UI/login/updataing.json")
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

    self.tp_ = tp
    layer:setTouchEnabled(true)
    self:addChild(layer)
    local logo2 = (Launcher.CCSReaderWidgetGroup)("UI/login/login_logo.json")
    self:addChild(logo2)
    if CONFIG_CHANNEL_ID == 57 then
      (logo2:getWidgetByTag(2519)):loadTexture("image/login/hongjiangsanguo.png")
    end
    logo2:setPosition(ccp(0, Launcher.height - 640))
    ;
    (Launcher.CCSWidgetVisible)(self.tp_, (LauncherScene.ViewTag).TIPS, false)
    local playSound = false
    local playMusic = false
    local gameStateFilePath = Launcher.writablePath .. "gamestate" .. "/" .. "GameState"
    local gameState = (Launcher.readFile)(gameStateFilePath)
    if not gameState then
      playSound = true
      playMusic = true
    else
      local gameStateData = (Launcher.decode)(gameState)
      if not gameStateData.bgMusicState or gameStateData.bgMusicState == 1 then
        playMusic = true
      end
      if not gameStateData.soundState or gameStateData.soundState == 1 then
        playSound = true
      end
    end
    do
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R8 in 'UnsetPending'

      self._intoDesLbl = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).INTO_DES_LBL)
      -- DECOMPILER ERROR at PC102: Confused about usage of register: R8 in 'UnsetPending'

      self._waitDesLbl = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).WAIT_DES_LBL)
      -- DECOMPILER ERROR at PC111: Confused about usage of register: R8 in 'UnsetPending'

      self._progressDesLbl = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).PROGRESS_DES_LBL)
      ;
      (self._progressDesLbl):setVisible(false)
      -- DECOMPILER ERROR at PC125: Confused about usage of register: R8 in 'UnsetPending'

      self._progressBar = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).PROGRESS_BAR)
      ;
      (self._progressBar):setVisible(false)
      -- DECOMPILER ERROR at PC139: Confused about usage of register: R8 in 'UnsetPending'

      self._progressBarLight = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).PROGRESS_LIGHT)
      ;
      (self._progressBarLight):setVisible(false)
      -- DECOMPILER ERROR at PC153: Confused about usage of register: R8 in 'UnsetPending'

      self._progressLabel = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).PROGRESS_PERCENT_LBL)
      ;
      (self._progressLabel):setVisible(false)
      -- DECOMPILER ERROR at PC167: Confused about usage of register: R8 in 'UnsetPending'

      self._progressParent = (self.tp_):getWidgetByTag((LauncherScene.ViewTag).BG)
      local alertLayer, alertTp, alertCcs = (Launcher.CCSReader)("UI/login/updatanotice.json")
      -- DECOMPILER ERROR at PC173: Confused about usage of register: R11 in 'UnsetPending'

      self.alertLayer_ = alertLayer
      -- DECOMPILER ERROR at PC175: Confused about usage of register: R11 in 'UnsetPending'

      self.alertTp_ = alertTp
      ;
      (self.alertLayer_):setVisible(false)
      self:addChild(self.alertLayer_)
      local onExitGame = function()
      -- function num : 0_5_0_0 , upvalues : playSound, self, luaj
      if playSound then
        (SimpleAudioEngine:sharedEngine()):playEffect("sound/ui/btn.mp3", false, 1)
      end
      if self._updateRetType == (Launcher.UpdateRetType).VERSION_ERROR then
        local url = ""
        if Launcher.platform == "android" then
          print("定位大版本更新URL " .. Android_FuncPath)
          url = "http://cow.sky-dragon.net/"
          ;
          (luaj.callStaticMethod)(Android_FuncPath, "directURL", {url}, "(Ljava/lang/String;)V")
        else
          if Launcher.platform == "ios" then
            if CONFIG_CHANNEL_ID == 26 and CONFIG_PAY_NAME == "APP_STORE" then
              url = "https://itunes.apple.com/cn/app/san-guo-ba-xiong-di/id987912389?mt=8"
              ;
              (SDKHelper:shareSDKHelper()):openURL(url)
            else
              if CONFIG_CHANNEL_ID == 26 and CONFIG_PAY_NAME == "APP_STORE_HD" then
                url = "https://itunes.apple.com/cn/app/wo-shi-da-zhu-gong-quan-qiu/id1014347316?mt=8"
                ;
                (SDKHelper:shareSDKHelper()):openURL(url)
              end
            end
          end
        end
        return 
      else
        do
          if self._updateRetType == (Launcher.UpdateRetType).UPDATE_UPDATE then
            CCLuaLoadChunksFromZIP("launcher_precompiled.zip")
            -- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

            ;
            (package.loaded)["launcher.launcher"] = nil
            require("launcher.launcher")
            return 
          end
          ;
          (CCDirector:sharedDirector()):endToLua()
          if Launcher.platform == "windows" or Launcher.platform == "mac" then
            (os.exit)()
          end
        end
      end
    end

      ;
      (Launcher.CCSBindButton)(self.alertTp_, (LauncherScene.AlertViewTag).EXIT_BTN, self, onExitGame)
      ;
      (Launcher.CCSBindButton)(self.alertTp_, (LauncherScene.AlertViewTag).SURE_BTN, self, onExitGame)
      local onUpdate = function()
      -- function num : 0_5_0_1 , upvalues : playSound, self
      if playSound then
        (SimpleAudioEngine:sharedEngine()):playEffect("sound/ui/btn.mp3", false, 1)
      end
      ;
      (self.alertLayer_):setVisible(false)
      self:_updateNeedDownloadFiles()
      -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

      self._numFileCheck = 0
      self:_reqNextResFile()
    end

      ;
      (Launcher.CCSBindButton)(self.alertTp_, (LauncherScene.AlertViewTag).UPDATE_BTN, self, onUpdate)
      ;
      (SimpleAudioEngine:sharedEngine()):preloadBackgroundMusic("sound/ui/denglu.mp3")
      ;
      (SimpleAudioEngine:sharedEngine()):preloadBackgroundMusic("sound/ui/zhandou.mp3")
      ;
      (SimpleAudioEngine:sharedEngine()):preloadBackgroundMusic("sound/ui/zhucheng.mp3")
      if playMusic then
        (SimpleAudioEngine:sharedEngine()):playBackgroundMusic("sound/ui/denglu.mp3", true)
      end
      ;
      (Launcher.performWithDelayGlobal)(function()
      -- function num : 0_5_0_2 , upvalues : self, enter_game
      if Launcher.platform == "android" or Launcher.platform == "ios" then
        self:_requestFromServer(CONFIG_GATE_BASE .. "/versionlist?v=" .. self.versionCode, (Launcher.RequestType).FLIST)
      else
        enter_game(self)
      end
    end
, 0.2)
    end
  end

        local cnLogoDuring = function()
    -- function num : 0_5_1 , upvalues : bg, self, logo, cnLogo, init
    if not bg then
      bg = CCLayerColor:create(ccc4(255, 255, 255, 255))
      self:addChild(bg)
    end
    if not logo then
      logo = CCSprite:create(cnLogo)
      logo:setPosition(ccp(Launcher.width / 2, Launcher.height / 2))
      self:addChild(logo)
    else
      logo:initWithFile(cnLogo)
      if CONFIG_CHANNEL_ID == 32 then
        logo:setScaleX(1)
        logo:setScaleY(1)
      end
    end
    local array3 = CCArray:create()
    array3:addObject(CCFadeTo:create(0.2, 255))
    array3:addObject(CCDelayTime:create(1))
    array3:addObject(CCFadeTo:create(0.5, 0))
    array3:addObject(CCCallFunc:create(init))
    logo:runAction(CCSequence:create(array3))
    bg:runAction(CCFadeTo:create(2, 100))
  end

        if sdkLogo[CONFIG_CHANNEL_ID] then
          local array1 = CCArray:create()
          array1:addObject(CCDelayTime:create(0.4))
          array1:addObject(CCFadeTo:create(0.5, 255))
          array1:addObject(CCDelayTime:create(1))
          array1:addObject(CCFadeTo:create(0.5, 0))
          logo:runAction(CCSequence:create(array1))
          local array2 = CCArray:create()
          array2:addObject(CCFadeTo:create(2.2, 0))
          array2:addObject(CCCallFunc:create(cnLogoDuring))
          bg:runAction(CCSequence:create(array2))
        else
          do
            cnLogoDuring()
          end
        end
      end
    end
  end
end

    LauncherScene._checkUpdate = function(self)
  -- function num : 0_6
  local oldFileList = nil
  if Launcher.platform == "windows" then
    oldFileList = (Launcher.readFile)("res/" .. Launcher.fListName)
  else
    if Launcher.platform == "ios" then
      oldFileList = (Launcher.readFile)((CCFileUtils:sharedFileUtils()):getResourcePath() .. "/res/" .. Launcher.fListName)
    else
      if Launcher.platform == "android" then
        oldFileList = (Launcher.doFile)((CCFileUtils:sharedFileUtils()):getResourcePath() .. "res/" .. Launcher.fListName)
      end
    end
  end
  if oldFileList == nil then
    self._updateRetType = (Launcher.UpdateRetType).OTHER_ERROR
    self:_endUpdate()
    return false
  end
  local oldVersionCode = ((Launcher.decode)(oldFileList)).appVersion
  self.versionCode = oldVersionCode
  local initFileList = (Launcher.readFile)(self._path .. Launcher.initFlistName)
  if initFileList ~= nil then
    local oldVersionArr = (Launcher.split)(oldVersionCode, ".")
    local initVersionCode = ((Launcher.decode)(initFileList)).appVersion
    local initVersionArr = (Launcher.split)(initVersionCode, ".")
    for i = 1, 3 do
      if initVersionArr[i] ~= oldVersionArr[i] then
        (Launcher.performWithDelayGlobal)(function()
    -- function num : 0_6_0 , upvalues : self
    (Launcher.removePath)(self._path)
    CCLuaLoadChunksFromZIP("launcher_precompiled.zip")
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (package.loaded)["launcher.launcher"] = nil
    require("launcher.launcher")
  end
, 0.1)
        return false
      end
    end
  else
    do
      ;
      (Launcher.mkDir)(self._path)
      do
        local versionTable = {}
        versionTable.appVersion = self.versionCode
        ;
        (Launcher.writefile)(self._path .. Launcher.initFlistName, (Launcher.encode)(versionTable))
        local newFileList = (Launcher.readFile)(self._path .. Launcher.fListName)
        do
          if newFileList ~= nil then
            local newVersionCode = ((Launcher.decode)(newFileList)).appVersion
            self.versionCode = newVersionCode
          end
          self._haveDownList = {}
          local haveDownFileList = (Launcher.readFile)(self._path .. Launcher.fListName .. Launcher.updateFilePostfix)
          if haveDownFileList ~= nil then
            self._haveDownList = (Launcher.decode)(haveDownFileList)
          end
          ;
          (Launcher.mkDir)(self._path)
          return true
        end
      end
    end
  end
end

    LauncherScene._endUpdate = function(self)
  -- function num : 0_7 , upvalues : LauncherScene, enter_game
  if self._updateRetType ~= (Launcher.UpdateRetType).SUCCESSED then
    (self.alertLayer_):setVisible(true)
    ;
    (Launcher.CCSWidgetVisible)(self.alertTp_, (LauncherScene.AlertViewTag).SURE_BTN, true)
    ;
    (Launcher.CCSWidgetVisible)(self.alertTp_, (LauncherScene.AlertViewTag).EXIT_BTN, false)
    ;
    (Launcher.CCSWidgetVisible)(self.alertTp_, (LauncherScene.AlertViewTag).UPDATE_BTN, false)
    ;
    (Launcher.CCSWidgetVisible)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL2, false)
    if self._updateRetType == (Launcher.UpdateRetType).NETWORK_ERROR then
      (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, STR_LCHER_NETWORK_FAIL)
    else
      if self._updateRetType == (Launcher.UpdateRetType).MD5_ERROR then
        (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, STR_LCHER_MD5_FAIL)
      else
        if self._updateRetType == (Launcher.UpdateRetType).FILE_LOST then
          (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, STR_LCHER_FILE_LOST)
        else
          if self._updateRetType == (Launcher.UpdateRetType).VERSION_ERROR then
            (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, STR_LCHER_REDOWN_TEXT)
            if Launcher.platform ~= "windows" then
              (Launcher.CCSSetUIButtonImage)(self.alertTp_, (LauncherScene.AlertViewTag).SURE_BTN, "image/btn/b_btn_up1.png", "image/btn/b_btn_up2.png")
            end
          else
            if self._updateRetType == (Launcher.UpdateRetType).OTHER_ERROR then
              (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, STR_LCHER_OTHER_FAL)
            else
              if self._updateRetType == (Launcher.UpdateRetType).UPDATE_UPDATE then
                (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, STR_LCHER_UPDATE_UPDATE)
              end
            end
          end
        end
      end
    end
  else
    enter_game(self)
  end
end

    LauncherScene._requestFromServer = function(self, url, requestType, waittime, head)
  -- function num : 0_8
  local request = CCHTTPRequest:createWithUrl(function(event)
    -- function num : 0_8_0 , upvalues : self, requestType
    self:_onResponse(event, requestType)
  end
, url, kCCHTTPRequestMethodGET)
  if not waittime then
    request:setTimeout(not request or 86400)
    if head then
      request:addRequestHeader(head)
    end
    if requestType == (Launcher.RequestType).RES then
      request:setReachFile(self.curFileName)
    end
    request:start()
    print("注意 CCHTTPRequest URL请求失败 返回值为null")
    self._updateRetType = UpdateRetType.NETWORK_ERROR
    self:_endUpdate()
  end
end

    LauncherScene._getHttpLocationURL = function(self, requestData)
  -- function num : 0_9
  local httpValues = ((Launcher.string_split)(requestData:getResponseHeadersString(), "\r\n"))
  local posLocation, urlLocation = nil, nil
  for _,valueItem in pairs(httpValues) do
    _ = (string.find)(valueItem, "Location")
    if posLocation then
      local startIndex, endIndex = (string.find)(valueItem, ":")
      if endIndex then
        urlLocation = (string.sub)(valueItem, endIndex + 2, (string.len)(valueItem))
        break
      end
    end
  end
  do
    return urlLocation
  end
end

    LauncherScene._onResponse = function(self, event, requestType)
  -- function num : 0_10
  if event.name == "completed" then
    local request = event.request
    print("注意:【�\128�请求更�\176 HTTP返回�\188:】�\128\145" .. tostring(request:getResponseStatusCode()))
    if request:getResponseStatusCode() == 302 then
      local location = self:_getHttpLocationURL(request)
      if location then
        self:_requestFromServer(location, requestType, waittime, head)
        return 
      else
        self._updateRetType = (Launcher.UpdateRetType).NETWORK_ERROR
        self:_endUpdate()
      end
    else
      do
        if request:getResponseStatusCode() ~= 200 and request:getResponseStatusCode() ~= 206 then
          self._updateRetType = (Launcher.UpdateRetType).NETWORK_ERROR
          self:_endUpdate()
        else
          if requestType == (Launcher.RequestType).FLIST then
            local dataRecv = request:getResponseData()
            self:_onFileListDownloaded(dataRecv)
          else
            do
              do
                self:_onResFileDownloaded()
                -- DECOMPILER ERROR at PC78: Unhandled construct in 'MakeBoolean' P1

                if event.name == "inprogress" and requestType == (Launcher.RequestType).RES and event.dlnow > 0 then
                  self:_onResProgress(event.dlnow)
                end
                self._updateRetType = (Launcher.UpdateRetType).NETWORK_ERROR
                self:_endUpdate()
              end
            end
          end
        end
      end
    end
  end
end

    LauncherScene._onFileListDownloaded = function(self, dataRecv)
  -- function num : 0_11 , upvalues : LauncherScene
  local upDateList = (Launcher.decode)(dataRecv)
  local upDateListNum = #upDateList
  if upDateListNum <= 0 then
    self._updateRetType = (Launcher.UpdateRetType).SUCCESSED
    self:_endUpdate()
    return 
  end
  self._needDownloadSize = 0
  self._hasDownloadSize = 0
  self._hasCurFileDownloadSize = 0
  self._downList = {}
  for i = 1, upDateListNum do
    local data = upDateList[i]
    local needCheck = true
    for j = 1, #self._haveDownList do
      if (self._haveDownList)[j] == data.verion then
        needCheck = false
        self.versionCode = data.verion
        break
      end
    end
    do
      if needCheck then
        if data.type == 2 then
          self._updateRetType = (Launcher.UpdateRetType).VERSION_ERROR
          self:_endUpdate()
          return 
        end
        data.haveSize = 0
        local filenameArr = (Launcher.split)(data.url, "/")
        local fileName = self._path .. filenameArr[#filenameArr]
        if (Launcher.fileExists)(fileName) then
          if (Launcher.checkFileWithMd5)(fileName, data.md5) then
            AssetsManager:uncompressDir(fileName, self._path)
            ;
            (os.remove)(fileName)
            self:_updateVersion(data.verion, false)
            self._hasDownloadSize = self._hasDownloadSize + data.size
            if data.type == 0 then
              self:_updateVersion(self.versionCode, true)
              self._updateRetType = (Launcher.UpdateRetType).UPDATE_UPDATE
              self:_endUpdate()
              return 
            end
          else
            local file = (io.open)(fileName, "rb")
            if file then
              data.haveSize = file:seek("end")
              if data.size <= data.haveSize then
                data.haveSize = 0
                ;
                (io.close)(file)
                ;
                (os.remove)(fileName)
              else
                ;
                (io.close)(file)
                self._hasDownloadSize = self._hasDownloadSize + data.haveSize
              end
            end
            ;
            (table.insert)(self._downList, data)
          end
        else
          do
            do
              do
                ;
                (table.insert)(self._downList, data)
                self._hasDownloadSize = self._hasDownloadSize + data.size
                self._needDownloadSize = self._needDownloadSize + data.size
                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC160: LeaveBlock: unexpected jumping out DO_STMT

              end
            end
          end
        end
      end
    end
  end
  if #self._downList > 0 then
    (self.alertLayer_):setVisible(true)
    ;
    (Launcher.CCSWidgetVisible)(self.alertTp_, (LauncherScene.AlertViewTag).SURE_BTN, false)
    if self._hasDownloadSize == 0 then
      (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, (string.format)(STR_LCHER_UPDATE_TEXT1, (Launcher.getDownLoadSize)(self._needDownloadSize)))
    else
      ;
      (Launcher.CCSSetLableString)(self.alertTp_, (LauncherScene.AlertViewTag).DES_LBL1, (string.format)(STR_LCHER_UPDATE_TEXT2, (Launcher.getDownLoadSize)(self._needDownloadSize - self._hasDownloadSize)))
    end
  else
    self._numFileCheck = 0
    self:_reqNextResFile()
  end
end

    LauncherScene._updateNeedDownloadFiles = function(self)
  -- function num : 0_12
  (self._progressDesLbl):setVisible(true)
  ;
  (self._waitDesLbl):setVisible(false)
  local progressBar = CCProgressTimer:create(CCSprite:create("image/common/up-progress.png"))
  progressBar:setType(kCCProgressTimerTypeBar)
  progressBar:setMidpoint(CCPointMake(0, 1))
  progressBar:setBarChangeRate(CCPointMake(1, 0))
  progressBar:setPosition(ccp((self._progressBar):getPositionX(), (self._progressBar):getPositionY()))
  ;
  (self._progressParent):addNode(progressBar, (self._progressBar):getZOrder())
  self._progressBar = progressBar
  self._progressBarSize = (self._progressBar):getContentSize()
  ;
  (self._progressBarLight):setVisible(true)
  ;
  (self._progressBarLight):setPosition(ccp((self._progressBar):getPositionX(), (self._progressBar):getPositionY()))
  self._pBLOriginalPosX = (self._progressBarLight):getPositionX() - (self._progressBarSize).width / 2 - 1
  ;
  (self._progressBarLight):setPositionX(self._pBLOriginalPosX)
  ;
  (self._progressLabel):setText("0%")
  ;
  (self._progressLabel):setVisible(true)
end

    LauncherScene._reqNextResFile = function(self)
  -- function num : 0_13
  self._numFileCheck = self._numFileCheck + 1
  self._curFileInfo = (self._downList)[self._numFileCheck]
  if self._curFileInfo and (self._curFileInfo).url then
    if tonumber((self._curFileInfo).url) == -1 then
      self:_updateVersion((self._curFileInfo).verion, false)
      self:_reqNextResFile()
    else
      local filenameArr = (Launcher.split)((self._curFileInfo).url, "/")
      self.curFileName = self._path .. filenameArr[#filenameArr]
      self:_requestFromServer((self._curFileInfo).url, (Launcher.RequestType).RES, 86400, "RANGE: bytes=" .. tostring((self._curFileInfo).haveSize) .. "-")
    end
  else
    do
      self:_updateVersion(self.versionCode, true)
      self._updateRetType = (Launcher.UpdateRetType).SUCCESSED
      self:_endUpdate()
    end
  end
end

    LauncherScene._onResFileDownloaded = function(self, dataRecv)
  -- function num : 0_14
  if not (Launcher.fileExists)(self.curFileName) then
    self._updateRetType = (Launcher.UpdateRetType).FILE_LOST
    self:_endUpdate()
  else
    if (Launcher.checkFileWithMd5)(self.curFileName, (self._curFileInfo).md5) then
      AssetsManager:uncompressDir(self.curFileName, self._path)
      ;
      (os.remove)(self.curFileName)
      self:_updateVersion((self._curFileInfo).verion, false)
      self._hasDownloadSize = self._hasDownloadSize + (self._curFileInfo).size - (self._curFileInfo).haveSize
      self._hasCurFileDownloadSize = 0
      self:_updateProgressUI()
      if (self._curFileInfo).type == 0 then
        self:_updateVersion(self.versionCode, true)
        self._updateRetType = (Launcher.UpdateRetType).UPDATE_UPDATE
        self:_endUpdate()
      else
        self:_reqNextResFile()
      end
    else
      print("注意:文件下载错误: " .. self.curFileName)
      self._updateRetType = (Launcher.UpdateRetType).MD5_ERROR
      self:_endUpdate()
    end
  end
end

    LauncherScene._onResProgress = function(self, dlnow)
  -- function num : 0_15
  self._hasCurFileDownloadSize = dlnow
  self:_updateProgressUI()
end

    LauncherScene._updateProgressUI = function(self)
  -- function num : 0_16
  local downloadPro = (self._hasDownloadSize + self._hasCurFileDownloadSize) * 100 / self._needDownloadSize
  ;
  (self._progressBar):setPercentage(downloadPro)
  ;
  (self._progressLabel):setText((string.format)("%d%%", downloadPro))
  ;
  (self._progressBarLight):setPositionX(self._pBLOriginalPosX + (self._progressBarSize).width * downloadPro / 100)
end

    LauncherScene._updateVersion = function(self, version, last)
  -- function num : 0_17
  if not last then
    self.versionCode = version
    ;
    (table.insert)(self._haveDownList, version)
    ;
    (Launcher.writefile)(self._path .. Launcher.fListName .. Launcher.updateFilePostfix, (Launcher.encode)(self._haveDownList))
  else
    local versionTable = {}
    versionTable.appVersion = version
    ;
    (Launcher.writefile)(self._path .. Launcher.fListName, (Launcher.encode)(versionTable))
    ;
    (os.remove)(self._path .. Launcher.fListName .. Launcher.updateFilePostfix)
  end
end

    local lchr = (LauncherScene.new)()
    ;
    (Launcher.runWithScene)(lchr)
  end
end

