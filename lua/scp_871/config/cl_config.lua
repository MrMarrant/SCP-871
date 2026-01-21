SCP_871_CONFIG.ScrW = ScrW()
SCP_871_CONFIG.ScrH = ScrH()
SCP_871_CONFIG.WIdealResolution = 1920
SCP_871_CONFIG.HIdealResolution = 1080

hook.Add( "OnScreenSizeChanged", "OnScreenSizeChanged.HELLDOOR", function( oldWidth, oldHeight )
    SCP_871_CONFIG.ScrW = ScrW()
    SCP_871_CONFIG.ScrH = ScrH()
end )