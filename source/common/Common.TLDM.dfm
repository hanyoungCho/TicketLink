object TLDataModule: TTLDataModule
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 375
  Width = 614
  object ABSDB: TABSDatabase
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 152
    Top = 16
  end
  object TBReceipt: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    InMemory = False
    ReadOnly = False
    TableName = 'TBReceipt'
    Exclusive = False
    Left = 152
    Top = 72
    object TBReceiptreceipt_no: TStringField
      FieldName = 'receipt_no'
    end
    object TBReceiptreceipt_status: TSmallintField
      FieldName = 'receipt_status'
    end
    object TBReceiptpartner_no: TIntegerField
      FieldName = 'partner_no'
    end
    object TBReceiptcounter_no: TIntegerField
      FieldName = 'counter_no'
    end
    object TBReceiptproduct_id: TIntegerField
      FieldName = 'product_id'
    end
    object TBReceiptschedule_id: TIntegerField
      FieldName = 'schedule_id'
    end
    object TBReceiptproduct_round: TIntegerField
      FieldName = 'product_round'
    end
    object TBReceiptreserve_no: TLargeintField
      FieldName = 'reserve_no'
    end
    object TBReceiptsale_date: TStringField
      FieldName = 'sale_date'
      Size = 10
    end
    object TBReceiptsale_time: TStringField
      FieldName = 'sale_time'
      Size = 8
    end
    object TBReceiptsale_qty: TIntegerField
      FieldName = 'sale_qty'
    end
    object TBReceiptsale_amt: TIntegerField
      FieldName = 'sale_amt'
    end
    object TBReceiptdc_amt: TIntegerField
      FieldName = 'dc_amt'
    end
    object TBReceiptpayment_amt: TIntegerField
      FieldName = 'payment_amt'
    end
    object TBReceiptvat: TIntegerField
      FieldName = 'vat'
    end
    object TBReceiptupdate_dttm: TDateTimeField
      FieldName = 'update_dttm'
    end
  end
  object TBOrder: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    InMemory = False
    ReadOnly = False
    TableName = 'TBOrder'
    Exclusive = False
    Left = 152
    Top = 128
    object TBOrderreceipt_no: TStringField
      FieldName = 'receipt_no'
    end
    object TBOrderproduct_id: TIntegerField
      FieldName = 'product_id'
    end
    object TBOrderschedule_id: TIntegerField
      FieldName = 'schedule_id'
    end
    object TBOrderproduct_round: TSmallintField
      FieldName = 'product_round'
    end
    object TBOrderproduct_grade_id: TIntegerField
      FieldName = 'product_grade_id'
    end
    object TBOrderdenomin_id: TIntegerField
      FieldName = 'denomin_id'
    end
    object TBOrderdenomin_category_id: TIntegerField
      FieldName = 'denomin_category_id'
    end
    object TBOrderunit_price: TIntegerField
      FieldName = 'unit_price'
    end
    object TBOrdersale_qty: TIntegerField
      FieldName = 'sale_qty'
    end
    object TBOrdersale_amt: TIntegerField
      FieldName = 'sale_amt'
    end
    object TBOrderproduct_nm: TStringField
      FieldName = 'product_nm'
      Size = 100
    end
    object TBOrderdenomin_category_nm: TStringField
      FieldName = 'denomin_category_nm'
    end
    object TBOrderdenomin_nm: TStringField
      FieldName = 'denomin_nm'
      Size = 100
    end
    object TBOrderupdate_dttm: TDateTimeField
      FieldName = 'update_dttm'
    end
  end
  object TBPayment: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'DBTicketLink'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'PKPayment'
        Fields = 'receipt_no;pay_method'
        Options = [ixPrimary]
      end>
    FieldDefs = <
      item
        Name = 'receipt_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pay_method'
        DataType = ftSmallint
      end
      item
        Name = 'approval_yn'
        DataType = ftBoolean
      end
      item
        Name = 'van_cd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'tid'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'manual_yn'
        DataType = ftBoolean
      end
      item
        Name = 'credit_card_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'inst_mon'
        DataType = ftInteger
      end
      item
        Name = 'approve_amt'
        DataType = ftInteger
      end
      item
        Name = 'vat'
        DataType = ftInteger
      end
      item
        Name = 'service_amt'
        DataType = ftInteger
      end
      item
        Name = 'approve_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'org_approve_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'trade_request_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pin_code'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'trade_no'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'trade_dttm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'issuer_cd'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'issuer_nm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'buyer_div'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'buyer_cd'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'buyer_nm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'merchant_key'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'payco_pay_method'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'update_dttm'
        DataType = ftDateTime
      end>
    TableName = 'TBPayment'
    Exclusive = False
    Left = 152
    Top = 184
    object TBPaymentreceipt_no: TStringField
      FieldName = 'receipt_no'
    end
    object TBPaymentpay_method: TSmallintField
      FieldName = 'pay_method'
    end
    object TBPaymentapproval_yn: TBooleanField
      FieldName = 'approval_yn'
    end
    object TBPaymentvan_cd: TStringField
      FieldName = 'van_cd'
      Size = 10
    end
    object TBPaymenttid: TStringField
      DisplayWidth = 20
      FieldName = 'tid'
    end
    object TBPaymentmanual_yn: TBooleanField
      FieldName = 'manual_yn'
    end
    object TBPaymentcredit_card_no: TStringField
      FieldName = 'credit_card_no'
    end
    object TBPaymentinst_mon: TIntegerField
      FieldName = 'inst_mon'
    end
    object TBPaymentapprove_amt: TIntegerField
      FieldName = 'approve_amt'
    end
    object TBPaymentvat: TIntegerField
      FieldName = 'vat'
    end
    object TBPaymentservice_amt: TIntegerField
      FieldName = 'service_amt'
    end
    object TBPaymentapprove_no: TStringField
      FieldName = 'approve_no'
    end
    object TBPaymentorg_approve_no: TStringField
      FieldName = 'org_approve_no'
    end
    object TBPaymenttrade_request_no: TStringField
      FieldName = 'trade_request_no'
    end
    object TBPaymentpin_code: TStringField
      FieldName = 'pin_code'
      Size = 30
    end
    object TBPaymenttrade_no: TStringField
      FieldName = 'trade_no'
    end
    object TBPaymenttrade_dttm: TStringField
      DisplayWidth = 20
      FieldName = 'trade_dttm'
    end
    object TBPaymentissuer_cd: TStringField
      FieldName = 'issuer_cd'
    end
    object TBPaymentissuer_nm: TStringField
      FieldName = 'issuer_nm'
    end
    object TBPaymentbuyer_div: TStringField
      FieldName = 'buyer_div'
    end
    object TBPaymentbuyer_cd: TStringField
      FieldName = 'buyer_cd'
    end
    object TBPaymentbuyer_nm: TStringField
      FieldName = 'buyer_nm'
    end
    object TBPaymentmerchant_key: TStringField
      FieldName = 'merchant_key'
    end
    object TBPaymentpayco_pay_method: TStringField
      FieldName = 'payco_pay_method'
      Size = 2
    end
    object TBPaymentupdate_dttm: TDateTimeField
      FieldName = 'update_dttm'
    end
  end
  object csrGridStyle: TcxStyleRepository
    Left = 48
    Top = 16
    PixelsPerInch = 96
    object StandStyleHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16759155
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      TextColor = clWhite
    end
    object StandStyleBandHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5848878
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object StandStyleSelectionWhite: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      TextColor = clBlack
    end
    object StandStyleSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5292171
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Noto Sans CJK KR Regular'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object MTProduct: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    TableName = 'MTProduct'
    Exclusive = False
    Left = 256
    Top = 16
  end
  object MTRound: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    TableName = 'MTRound'
    Exclusive = False
    Left = 256
    Top = 72
  end
  object MTDenomin: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    TableName = 'MTDenomin'
    Exclusive = False
    Left = 256
    Top = 128
  end
  object MTReserveList: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    TableName = 'MTReserveList'
    Exclusive = False
    Left = 256
    Top = 184
  end
  object MTTicketList: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    TableName = 'MTTicketList'
    Exclusive = False
    Left = 256
    Top = 240
  end
  object MTTicketTemplate: TABSTable
    CurrentVersion = '7.94 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    TableName = 'MTTicketTemplate'
    Exclusive = False
    Left = 256
    Top = 296
  end
end
