pageextension 90101 DimaMarcaProducto extends "Fixed Asset Card"
{
    layout
    {
        addlast(General)
        {
            field(Marca; Rec.MarcaActivo)
            {
                Caption = 'Marca del Activo';
                ApplicationArea = All;
            }

            field(Modelo; Rec.Modelo)
            {
                Caption = 'Modelo del Activo';
                ApplicationArea = All;
            }

            field(Color; Rec.Color)
            {
                Caption = 'Color del Activo';
                ApplicationArea = All;
            }

            field(Otros; Rec.Otros)
            {
                Caption = 'Otros';
                ApplicationArea = All;
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