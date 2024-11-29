pageextension 90102 DIMA_PedidoCompra extends "Purchase Lines"
{
    layout
    {
        addlast(Control1)
        {
            field(MarcaActivo; Rec.MarcaActivo)
            {
                ApplicationArea = All;
                Caption = 'Marca del Activo';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}