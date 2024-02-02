unit Common.TLCipher;

interface

uses
  { Native }
  System.SysUtils,
  { LockBox }
  uTPLb_CryptographicLibrary, uTPLb_Codec, uTPLb_Constants;

{$I common.TLGlobal.inc}

type
  { 암/복호화 클래스 }
  TLbCipher = class
    FCryptographicLibrary: TCryptographicLibrary;
    FCodec: TCodec;
  private
    procedure SetBlockCipherId(const AValue: string);
    function GetBlockCipherId: string;
  public
    constructor Create;
    destructor Destroy; override;

    function GetDecryptedString(const AValue: string): string;
    function GetEncryptedString(const AValue: string): string;

    property BlockCipherId: string read GetBlockCipherId write SetBlockCipherId;
  end;

implementation

{ TLbCipher }

constructor TLbCipher.Create;
begin
  inherited;

  FCryptographicLibrary := TCryptographicLibrary.Create(nil);
  FCodec := TCodec.Create(nil);
  FCodec.CryptoLibrary := FCryptographicLibrary;
  FCodec.StreamCipherId := BlockCipher_ProgID;
  FCodec.BlockCipherId := Format(AES_ProgId, [256]);
  FCodec.ChainModeId := CBC_ProgId;
  FCodec.Password := CCC_MAGIC_KEY;
end;

destructor TLbCipher.Destroy;
begin
  FreeAndNil(FCryptographicLibrary);
  FreeAndNil(FCodec);

  inherited;
end;

function TLbCipher.GetBlockCipherId: string;
begin
  Result := FCodec.BlockCipherId;
end;

procedure TLbCipher.SetBlockCipherId(const AValue: string);
begin
  FCodec.BlockCipherId := AValue;
end;

function TLbCipher.GetDecryptedString(const AValue: string): string;
begin
  Result := '';
  try
    FCodec.DecryptString(Result, AValue, TEncoding.UTF8);
  except
  end;
end;

function TLbCipher.GetEncryptedString(const AValue: string): string;
begin
  Result := '';
  try
    FCodec.EncryptString(AValue, Result, TEncoding.UTF8);
  except
  end;
end;

end.
