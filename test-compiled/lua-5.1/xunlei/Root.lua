LuaQ  Z   @E:\workspace\MobileAssistant\DeviceConnecter\pub\XLDC\productrelease\bin\Script\Root.lua           	.      d       G@  E  ΐ  \   Α   Ε  A ά   A  E  Α \   Α  ΑA $B   $       Β $Β      $    B $B            $       Β             @   GetVersion    XLGetObject    XLDC.DeviceManager    XLDC.DataService    XLDC.CacheManager    XLDC.DriverManager    XLDC.DeviceConnecter    XLDC.OperationManager       @   IsStringEmpty    OnKnownDeviceFound    AddNewDevice    SetNewDeviceConnected    OnUnKnownDeviceFound    Root                                                        Verison             
   W @ @ @@  B  ^  @ B   ^                
                                       str     	              <           @A  @  A@ΐ  Λΐΐ ά  Α  @A ΐ  ΑA    A  Δ Β C€            A     
   AppendLog     [Found]Known device found, key=    IsDebugMode 
   GetConfig  *   [Error<Known device>]config is nilγkey=    AsynGetUsbInfo       $@       (   ;    .     @    ΐ  B@  Δ Γ  @ ΕC  ά ΒB AΒ ΑΒ Γ B  B ΐ A ΐ  @  B    B@ Δ ΒB    BB B  
      IsStringEmpty 
   AppendLog /   [Error<Known device>]Get usb info failed, key=     errorCode=     retryTime= 	   tostring    SetUsbInfo     /   [Error<Known device>]Set usb info failed, key=    SetDeviceConnect     .   )   )   )   )   )   *   *   *   *   *   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   /   /   /   /   /   /   /   /   /   0   0   0   0   0   0   1   :   :   :   :   ;         devkey     -      usbkey     -      usbDriverKey     -      serialNumber     -      bOpenDebug     -      nRealRetryTime     -   	   userdata     -      errCode     -      
   DeviceMgr 
   devicekey    device                                    "   "   #   #   #   #   #   #   $   '   '   '   '   '   '   ;   ;   ;   ;   '   <      
   devicekey           device           bOldOpenDebug          config 
         
   DeviceMgr    nRetryTime     >   R    9   W @ ΐ W ΐ @  @ Δ  ΛAΐA    UάAΓ  ήΔ  ΛΑΐ@  ά W ΐ  A  ΐB BΑΐ  @  B     B@ ΐ  ΒB B    B@Β ΐ  ΒB B  B        
   AppendLog "   [Error] AddNewDevice failed, key=    CreateDevice 
   AddDevice    SetUsbInfo !   [Error]Set usb info failed, key=    AddDevice success, key=     9   A   A   A   A   A   A   B   B   B   B   B   B   C   C   C   F   F   F   F   F   G   G   H   H   H   H   H   I   I   I   I   I   I   I   I   J   J   J   J   J   J   K   K   K   M   M   M   M   M   M   N   N   N   Q   Q   Q   R      
   devicekey     8      devInfo     8   
   devConfig     8      usbkey     8      usbDriverKey     8      serialNumber     8      bOpenDebug     8      device    8      
   DeviceMgr     T   b    *   Ε     @  ΐ  @ άΑ   @Ϊ  ΐKBΐ Α  \BD  KΒΐΐ  \ZB  D  KΑΑB    Υ\B  KA\B D  KΒΑΐ  \BD  KΑΑ    Υ\B  	      AddNewDevice    SetDeviceType       π?   IsUsbDeviceConnect 
   AppendLog 6   [End]mobile device found, usb device is removed, key=    SetAllDriverItemValid    SetDeviceConnect %   [Found]new mobile device found, key=     *   V   V   V   V   V   V   V   V   V   W   W   W   W   X   X   X   Y   Y   Y   Y   Y   Y   Z   Z   Z   Z   Z   Z   [   ^   ^   _   _   _   _   `   `   `   `   `   `   b   	   
   devicekey     )      devInfo     )   
   devConfig     )      usbkey     )      usbDriverKey     )      serialNumber     )      bOpenDebug     )      device 	   )      res 	   )      
   DeviceMgr     d       
   D   K ΐ ΐ   \   @@   Δ   Λΐ@   ΑΑ   d                  ά@        CreateDeviceInfo    CreateDeviceConfig    AsynGetUsbInfo       $@       n       S     @       B@  Δ Γ  @ ΕC  ά ΒB@  B@ Δ Γ EC  \ BB B@B D  Δ  @ ΐ B    B   ΐ  B@Β Δ ΒBB D  Δ  @ ΐ B     B@ BBC Δ C€                     B        IsStringEmpty 
   AppendLog !   [Error]Get usb info failed, key=     errorCode=     retryTime= 	   tostring    Get usb info success, key=    ,DebugMode=    SetNewDeviceConnected    QueryCacheExist    Found in cache, key=    StartQueryDeviceConfig...    AsynQueryDeviceConfig               9     @A  Δ   @AAΐΐ@ A @Aΐ A @A ΑA @A@ B @A  AB @Aΐ B ΐ@  @Α Δ ΑA   D Δ  D ΔA      
   AppendLog !   QueryDeviceConfig callback, key= 
   ,errCode=            GetOriginBrand     	   GetModel    GetProductID 	   GetBrand    GetName    GetDriverItemCount )   [End]device is not a mobile device, key=    SetNewDeviceConnected     9                                                                                                                                                                                    v1     8      v2     8      v3     8      errCode     8      
   DeviceMgr 
   devicekey 
   devConfig    devInfo    usbkey    usbDriverKey    serialNumber    bOpenDebug S   p   p   p   p   p   q   q   q   q   q   q   q   q   q   q   q   q   q   s   s   s   s   s   s   s   s   s   s   u   u   v   v   v   v   v   v   v   v   v   w   |   |   |   |   |   |   }   }   }   }   }   }   ~   ~   ~   ~   ~   ~   ~   ~   ~                                                                           devkey     R      usbkey     R      usbDriverKey     R      serialNumber     R      bOpenDebug     R      nRealRetryTime     R   	   userdata     R      errCode     R      
   DeviceMgr 
   devicekey    devInfo 
   devConfig 	   CacheMgr    DataService    j   j   j   j   k   k   k   k   m   m   m   m   m   m                        m         
   devicekey           devInfo       
   devConfig          
   DeviceMgr    nRetryTime 	   CacheMgr    DataService        Ε            @ @  Β   $     @    @   Β   $A     @    @ ΐ  Β   $       @    @   Β   $Α       @        AttachListener    OnDeviceConnect    OnDeviceDisConnect    OnDeviceFound    OnDeviceRemoved           €           @A  @ A@   @      Εΐ    @ ά@ Ε    ά@      
   AppendLog    [OnDeviceConnect], key=    GetKnownDevice    OnKnownDeviceFound    OnUnKnownDeviceFound                                                                ’   ’   ’   €         sender        
   devicekey           device 
         
   DeviceMgr     ¨   «           @A  @ A@   @  @     
   AppendLog    [OnDeviceDisConnect], key=    SetDeviceDisConnect        ©   ©   ©   ©   ©   ©   ͺ   ͺ   ͺ   ͺ   «         sender     
   
   devicekey     
      
   DeviceMgr     ―   Ί       D  Kΐΐ   @ \A D KAΐΑ    Υ\AD  KΑΐ\ Z  @D  KΑΐ \AΑA      
   AddDevice 
   AppendLog    [OnDeviceFound], key=    GetAutoCheck    GetCheckEnvOperation    BeginCheck        ±   ±   ±   ±   ±   ±   ±   ³   ³   ³   ³   ³   ³   ΅   ΅   ΅   ΅   ΅   Ά   Ά   Ά   Ά   ·   ·   Ί         sender           key           brand           model           name           checkEnvOperation             OperationMgr 
   DeviceMgr     Ύ   Γ         @A  ΐ ΑA @ A     
   AppendLog    [OnDeviceRemoved], key=    RemoveDevice        Ώ   Ώ   Ώ   Ώ   Ώ   Ώ   Α   Α   Α   Α   Γ         sender     
      key     
      brand     
      model     
      
   DeviceMgr    OperationMgr                €   €      §   §   §   §   «   «   §   ?   ?   ?   ?   Ί   Ί   Ί   ?   ½   ½   ½   ½   Γ   Γ   Γ   ½   Ε          
   DeviceMgr    OperationMgr .                                 	   	   	   
   
   
                              <   <   <      R   R   >   b   b   T                  d   Ε   Ε   Ε      Ε         Verison    -   
   DeviceMgr    -      DataService 
   -   	   CacheMgr    -   
   DriverMgr    -      DeviceConnecter    -      OperationMgr    -      nRetryTime    -       