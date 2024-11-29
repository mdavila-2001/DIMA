tableextension 90102 DIMA_MovActivo extends "FA Ledger Entry"
{
    fields
    {
        field(487; MarcaActivo; Code[20])
        {
            Caption = 'Marca Activo';
            TableRelation = DimaMarcas.CodMarca;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnBeforeInsert()
    var
        lineaPedidoCompra: Record "Purchase Line";
    begin
        lineaPedidoCompra.Reset();
        lineaPedidoCompra.SetRange("Document No.", Rec."Document No.");
        if lineaPedidoCompra.FindFirst() then
            rec.MarcaActivo := lineaPedidoCompra.MarcaActivo;
    end;

    var
        myInt: Integer;
}