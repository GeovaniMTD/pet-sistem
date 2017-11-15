unit untPgt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPagamento = class(TForm)
    edtDesconto: TEdit;
    edttotal: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagamento: TfrmPagamento;

implementation

{$R *.dfm}

end.
