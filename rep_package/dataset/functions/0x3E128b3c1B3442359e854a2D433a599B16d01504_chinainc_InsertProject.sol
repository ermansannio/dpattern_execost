contract chinainc {
function InsertProject(string ProjectName,string Descript,address dapp_address,string dapp_ens,string dapp_jsoninfo,address OwnerAddress) OnlyCreater public 
    {
        if(__FindProjects(ProjectName)==false){
            if(bytes(Descript).length!=0) {
                ProjectDatas[ProjectName].Descript = Descript;
            }else{
                ProjectDatas[ProjectName].Descript = ProjectName;
            }
            ProjectDatas[ProjectName].dapp_address = dapp_address;
            ProjectDatas[ProjectName].dapp_ens = dapp_ens;
            ProjectDatas[ProjectName].dapp_jsoninfo = dapp_jsoninfo;
            ProjectDatas[ProjectName].Owner = OwnerAddress;
            
            AllProjectList.push(ProjectName);
        }else{
            //loginfo(NewProjectName,"项目已存在");
        }
    }
}