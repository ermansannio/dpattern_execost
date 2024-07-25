contract gradeinfo {
function SetPlatformInformation(string Info) OnlyCreater public{
        PlatformInformation=Info;
    }
}