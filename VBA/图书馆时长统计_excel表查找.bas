Attribute VB_Name = "ͼ���ʱ��ͳ��"

'���ڸ�ʽΪyyyy-mm-dd hh:mm:ss

Sub �ɼ�ͳ��()
Dim StudyID&, x1&, x3%, xt%, y%, i%, count% ' ��������
count = 1 '��ʼ����λ��
Do
StudyID = Sheet4.Cells(count, 1).Value
If StudyID = 0 Then Exit Do
x1 = 1 'sheet1������������ʼλ��
x3 = 1 'sheet3������������ʼλ��
Do
If Sheet1.Cells(x1, 1).Value = StudyID Then
Sheet3.Cells(x3, 1) = x3 'ID
Sheet3.Cells(x3, 2) = Sheet1.Cells(x1, 1).Value 'ѧ��
Sheet3.Cells(x3, 3) = Sheet1.Cells(x1, 2).Value '����
Sheet3.Cells(x3, 4) = Sheet1.Cells(x1, 3).Value 'רҵ�꼶
Sheet3.Cells(x3, 5) = Application.WorksheetFunction.Text(Mid(Sheet1.Cells(x1, 4).Value, 1, 10), "yyyymmdd") '��������
Sheet3.Cells(x3, 6) = TimeValue(Mid(Sheet1.Cells(x1, 4).Value, 12, 8)) '����ʱ��
Sheet3.Cells(x3, 7) = Sheet1.Cells(x1, 5).Value '����
x3 = x3 + 1
End If
If x1 > 52026 Then Exit Do '�޸������������
x1 = x1 + 1
Loop 'ԭʼ���ݱ��������ݽ���
Sheet2.Cells(count, 1) = StudyID '�洢��Ԫѧ��
Sheet2.Cells(count, 2) = Sheet4.Cells(count, 2).Value '�洢��Ԫ����
Sheet2.Cells(count, 3) = Sheet3.Cells(1, 4).Value '�洢��Ԫ�꼶
'Loop '�������浥Ԫ����
xt = 1 '������ʱ�������ʼ��λ��
i = 1 '������ѭ����ʼλ��
Do While i < x3 'sheet3���ݸ���
If Sheet3.Cells(i, 7).Value = "��" Then
i = i + 1
If Sheet3.Cells(i, 7).Value = "��" Then '�жϽ���״̬
If Sheet3.Cells(i, 5).Value - Sheet3.Cells(i - 1, 5) = 0 Then '�ж��Ƿ����ˢ��
Sheet3.Cells(xt, 8) = Sheet3.Cells(i, 6) - Sheet3.Cells(i - 1, 6)
i = i + 1
xt = xt + 1
End If '�����жϿ���ˢ��
End If
Else
i = i + 1
End If '�����жϽ���״̬
Loop '����������ʱ������
'Sheet2.Cells(count, 4) = Application.WorksheetFunction.sum(Sheet3.Range("H:H")) '����������
Sheet3.Cells(1, 9) = Application.WorksheetFunction.Text(Application.WorksheetFunction.sum(Sheet3.Range("H:H")), "dd.hh:mm:ss") '�����ڹ�ʱ����ȷ����ʽ���洢������������
Sheet2.Cells(count, 4) = "'" & Mid(Sheet3.Cells(1, 9), 1, 2) * 24 + Mid(Sheet3.Cells(1, 9), 4, 2) & ":" & Mid(Sheet3.Cells(1, 9), 7, 2) & ":" & Mid(Sheet3.Cells(1, 9), 10, 2) '��ʾ��ʽ����ΪHH:MM:SS��ʽ�����浽�洢��
If Mid(Sheet3.Cells(1, 9), 1, 2) * 24 + Mid(Sheet3.Cells(1, 9), 4, 2) < 15 Then
Sheet2.Cells(count, 4).Interior.ColorIndex = 6 'ʱ��С��15Сʱ����Ԫ�������ʾ
End If
Sheet3.Range("A:I").ClearContents '���������
count = count + 1 '��ν�������
Loop '����ѭ������
MsgBox ("ͳ���������")
End Sub
