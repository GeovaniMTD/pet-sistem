unit untDMLogin;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DBXFirebird, Data.DB,
  Data.SqlExpr;

type
  TDMLOgin = class(TDataModule)
    SQLDataSet1: TSQLDataSet;
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLOgin: TDMLOgin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
