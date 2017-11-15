object DMLOgin: TDMLOgin
  OldCreateOrder = False
  Height = 204
  Width = 334
  object SQLDataSet1: TSQLDataSet
    Params = <>
    Left = 144
    Top = 40
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=D:\Projetos\pet sistem\ATIVIDADE.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 152
    Top = 88
  end
end
