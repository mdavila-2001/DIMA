page 90101 DIMA_Marcas
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = DimaMarcas;
    Caption = 'Dima Marca Activo';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CodMarca; Rec.CodMarca)
                {
                    ApplicationArea = All;
                }
                field(NombreMarca; Rec.NombreMarca)
                {
                    Caption = 'Descripcion';
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}