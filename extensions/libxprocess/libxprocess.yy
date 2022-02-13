{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2021-06-09T18:32:23.3229009+08:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"filename":"libxprocess.dll","origname":"","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"ProcessExecute","kind":1,"help":"ProcessExecute(command)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ProcessExecute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcessExecuteAsync","kind":1,"help":"ProcessExecuteAsync(command)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"ProcessExecuteAsync","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"CompletionStatusFromExecutedProcess","kind":1,"help":"CompletionStatusFromExecutedProcess(procIndex)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"CompletionStatusFromExecutedProcess","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ExecutedProcessWriteToStandardInput","kind":1,"help":"ExecutedProcessWriteToStandardInput(procId,input)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"ExecutedProcessWriteToStandardInput","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ExecutedProcessReadFromStandardOutput","kind":1,"help":"ExecutedProcessReadFromStandardOutput(procId)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ExecutedProcessReadFromStandardOutput","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcIdExists","kind":1,"help":"ProcIdExists(procId)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ProcIdExists","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcIdKill","kind":1,"help":"ProcIdKill(procId)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ProcIdKill","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcListCreate","kind":1,"help":"ProcListCreate()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"ProcListCreate","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcessId","kind":1,"help":"ProcessId(procList,i)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"ProcessId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcessIdLength","kind":1,"help":"ProcessIdLength(procList)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ProcessIdLength","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"FreeProcInfo","kind":1,"help":"FreeProcInfo(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"FreeProcInfo","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"FreeProcList","kind":1,"help":"FreeProcList(procList)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"FreeProcList","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ExecutableImageFilePath","kind":1,"help":"ExecutableImageFilePath(procInfo)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ExecutableImageFilePath","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"CurrentWorkingDirectory","kind":1,"help":"CurrentWorkingDirectory(procInfo)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"CurrentWorkingDirectory","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ParentProcessId","kind":1,"help":"ParentProcessId(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ParentProcessId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ChildProcessId","kind":1,"help":"ChildProcessId(procInfo,i)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"ChildProcessId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ChildProcessIdLength","kind":1,"help":"ChildProcessIdLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ChildProcessIdLength","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"CommandLine","kind":1,"help":"CommandLine(procInfo,i)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"CommandLine","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"CommandLineLength","kind":1,"help":"CommandLineLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"CommandLineLength","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"Environment","kind":1,"help":"Environment(procInfo,i)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"Environment","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"EnvironmentLength","kind":1,"help":"EnvironmentLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"EnvironmentLength","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"OwnedWindowId","kind":1,"help":"OwnedWindowId(procInfo,i)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"OwnedWindowId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"OwnedWindowIdLength","kind":1,"help":"OwnedWindowIdLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"OwnedWindowIdLength","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"WindowIdExists","kind":1,"help":"WindowIdExists(winId)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"WindowIdExists","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"WindowIdKill","kind":1,"help":"WindowIdKill(winId)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"WindowIdKill","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcIdFromSelf","kind":1,"help":"ProcIdFromSelf()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"ProcIdFromSelf","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ParentProcIdFromSelf","kind":1,"help":"ParentProcIdFromSelf()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"ParentProcIdFromSelf","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ExecutableFromSelf","kind":1,"help":"ExectuableFromSelf()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"ExecutableFromSelf","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"DirectoryGetCurrentWorking","kind":1,"help":"DirectoryGetCurrentWorking()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"DirectoryGetCurrentWorking","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"DirectorySetCurrentWorking","kind":1,"help":"DirectorySetCurrentWorking(dname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"DirectorySetCurrentWorking","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"EnvironmentGetVariable","kind":1,"help":"EnvironmentGetVariable(name)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"EnvironmentGetVariable","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"EnvironmentSetVariable","kind":1,"help":"EnvironmentSetVariable(name,value)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"EnvironmentSetVariable","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"EnvironmentUnsetVariable","kind":1,"help":"EnvironmentUnsetVariable(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"EnvironmentUnsetVariable","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"FreeExecutedProcessStandardInput","kind":1,"help":"FreeExecutedProcessStandardInput(procIndex)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"FreeExecutedProcessStandardInput","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"FreeExecutedProcessStandardOutput","kind":1,"help":"FreeExecutedProcessStandardOutput(procIndex)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"FreeExecutedProcessStandardOutput","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ProcInfoFromProcId","kind":1,"help":"ProcInfoFromProcId(procId)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ProcInfoFromProcId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"ExeFromProcId","kind":1,"help":"ExeFromProcId(procId)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"ExeFromProcId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"CwdFromProcId","kind":1,"help":"CwdFromProcId(procId)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"CwdFromProcId","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"WindowIdFromNativeWindow","kind":1,"help":"WindowIdFromNativeWindow(window)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"WindowIdFromNativeWindow","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[
        {"TargetMask":1,"resourceVersion":"1.0","name":"libxprocess.dylib","tags":[],"resourceType":"GMProxyFile",},
        {"TargetMask":7,"resourceVersion":"1.0","name":"libxprocess.so","tags":[],"resourceType":"GMProxyFile",},
      ],"copyToTargets":194,"order":[
        {"name":"ProcessExecute","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcessExecuteAsync","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CompletionStatusFromExecutedProcess","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutedProcessWriteToStandardInput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutedProcessReadFromStandardOutput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcIdExists","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcIdKill","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcListCreate","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcessId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcessIdLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeProcInfo","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeProcList","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutableImageFilePath","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CurrentWorkingDirectory","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ParentProcessId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ChildProcessId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ChildProcessIdLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CommandLine","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CommandLineLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"Environment","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"OwnedWindowId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"OwnedWindowIdLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"WindowIdExists","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"WindowIdKill","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcIdFromSelf","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ParentProcIdFromSelf","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutableFromSelf","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"DirectoryGetCurrentWorking","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"DirectorySetCurrentWorking","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentGetVariable","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentSetVariable","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentUnsetVariable","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeExecutedProcessStandardInput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeExecutedProcessStandardOutput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcInfoFromProcId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExeFromProcId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CwdFromProcId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"WindowIdFromNativeWindow","path":"extensions/libxprocess/libxprocess.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"libxprocess.zip","origname":"","init":"","final":"","kind":4,"uncompress":false,"functions":[],"constants":[],"ProxyFiles":[],"copyToTargets":0,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"libxprocess.gml","origname":"","init":"libxprocess_init","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"libxprocess_init","kind":2,"help":"libxprocess_init()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"libxprocess_init","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"execute_shell","kind":2,"help":"execute_shell(prog,arg)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"execute_shell","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"execute_program","kind":2,"help":"execute_program(prog,arg,wait)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            2,
          ],"resourceVersion":"1.0","name":"execute_program","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_enable_stddesc","kind":2,"help":"file_text_enable_stddesc(enable)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_enable_stddesc","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_write_stdin(pid)","kind":2,"help":"file_text_open_write_stdin(pid)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_open_write_stdin","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_write_string_stdin(file,","kind":2,"help":"file_text_write_string_stdin(file,str)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"file_text_write_string_stdin","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_close_stdin(file)","kind":2,"help":"file_text_close_stdin(file)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_close_stdin","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_read_stdout","kind":2,"help":"file_text_open_read_stdout(pid)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_open_read_stdout","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_read_string_stdout","kind":2,"help":"file_text_read_string_stdout(file)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_read_string_stdout","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_close_stdout","kind":2,"help":"file_text_close_stdout(file)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_close_stdout","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":194,"order":[
        {"name":"libxprocess_init","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"execute_shell","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"execute_program","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_enable_stddesc","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_open_write_stdin","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_write_string_stdin","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_close_stdin","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_open_read_stdout","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_read_string_stdout","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_close_stdout","path":"extensions/libxprocess/libxprocess.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": null,
  "tvosplistinject": null,
  "androidinject": null,
  "androidmanifestinject": null,
  "androidactivityinject": null,
  "gradleinject": null,
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 194,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "libxprocess",
  "tags": [],
  "resourceType": "GMExtension",
}