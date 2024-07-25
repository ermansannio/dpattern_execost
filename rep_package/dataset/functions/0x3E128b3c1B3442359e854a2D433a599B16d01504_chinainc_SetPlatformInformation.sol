contract chinainc {
function SetPlatformInformation(string Info) OnlyCreater public{
        PlatformInformation=Info;
    }
}