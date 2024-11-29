codeunit 90100 DIMA_Logics
{
    procedure traerMontoRetencion(codProd: Code[20]): Decimal
    var
        movProveedores: Record "Purch. Inv. Line";
        porcentaje: Decimal;
        monto: Decimal;
    begin
        movProveedores.SetFilter("No.", codProd);
        if movProveedores.FindFirst() then begin
            porcentaje := movProveedores."VAT %" / 100;
            monto := movProveedores."Line Amount" * porcentaje;
        end;
        exit(monto);
    end;

    procedure traerGiroTotalUSD(codProd: Code[20]): Decimal
    var
        movProveedores: Record "Purch. Inv. Line";
        porcentaje: Decimal;
        monto: Decimal;
    begin
        movProveedores.SetFilter("No.", codProd);
        if movProveedores.FindFirst() then begin
            porcentaje := movProveedores."VAT %" / 100;
            monto := movProveedores."Line Amount" + movProveedores."Line Amount" * porcentaje;
        end;
        exit(monto);
    end;

    procedure traerGrossRetencion(codProd: Code[20]): Decimal
    var
        movProveedores: Record "Purch. Inv. Line";
        porcentaje: Decimal;
        monto: Decimal;
        gross: Decimal;
    begin
        movProveedores.SetFilter("No.", codProd);
        if movProveedores.FindFirst() then begin
            porcentaje := movProveedores."VAT %" / 100;
            monto := movProveedores."Line Amount" + movProveedores."Line Amount" * porcentaje;
            gross := monto * porcentaje;
        end;
        exit(gross);
    end;

    procedure traerCostoTotalUSD(codProd: Code[20]): Decimal
    var
        movProveedores: Record "Purch. Inv. Line";
        porcentaje: Decimal;
        monto: Decimal;
        gross: Decimal;
        costoTotal: Decimal;
    begin
        movProveedores.SetFilter("No.", codProd);
        if movProveedores.FindFirst() then begin
            porcentaje := movProveedores."VAT %" / 100;
            monto := movProveedores."Line Amount" + movProveedores."Line Amount" * porcentaje;
            gross := monto * porcentaje;
            costoTotal := monto + gross;
        end;
        exit(costoTotal);
    end;

    procedure traerPrecioBOB(codProd: Code[20]): Decimal
    var
        movProveedores: Record "Purch. Inv. Line";
        Divisas: Record "Currency Exchange Rate";
        tipoCambio: Decimal;
        porcentaje: Decimal;
        monto: Decimal;
        gross: Decimal;
        costoTotal: Decimal;
        precioBol: Decimal;
    begin
        tipoCambio := 0.00;
        divisas.SetFilter("Currency Code", 'USD');
        if divisas.FindFirst() then
            tipoCambio := divisas."Exchange Rate Amount";
        movProveedores.SetFilter("No.", codProd);
        if movProveedores.FindFirst() then begin
            porcentaje := movProveedores."VAT %" / 100;
            monto := movProveedores."Line Amount" + movProveedores."Line Amount" * porcentaje;
            gross := monto * porcentaje;
            costoTotal := monto + gross;
            precioBol := costoTotal * tipoCambio;
        end;
        exit(precioBol);
    end;

    procedure traerTipoProv(codProv: Code[20]): Text
    var
        Proveedores: Record Vendor;
        tipoProv: Text;
    begin
        Proveedores.SetFilter("No.", codProv);
        if Proveedores.FindFirst() then begin
            if Proveedores."Vendor Posting Group" = 'PROV-EXT' then
                tipoProv := 'Extranjero'
            else
                tipoProv := 'Nacional';
        end;
        exit(tipoProv);
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}