report 90101 DIMA_CompraDeProductos
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'DIMA Reporte de Compra de Productos';

    dataset
    {
        dataitem(cabeceraCompra; "Purch. Inv. Header")
        {
            column(NumCabecera; "No.") { }
            column(fechaCabecera; "Posting Date") { }
            dataitem(Compras; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = SORTING("Document No.");
                column(Fecha; "Posting Date") { }
                column(ID_Producto; "No.") { }
                column(NombreProducto; Description) { }
                column(CantidadAsignada; Quantity) { }
                column(PrecioUnitario; "Direct Unit Cost") { }
                column(Total; "Line Amount") { }
            }
            column(NombreEmpresa; CompanyInfo.Name) { }
            column(CiudadEmpresa; CompanyInfo.City) { }
            column(Direccion; CompanyInfo.Address) { }
            column(Telefono; CompanyInfo."Phone No.") { }
            column(Imagen; CompanyInfo.Picture) { }
            column(FechaI; FechaI) { }
            column(FechaF; FechaF) { }
            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", FechaI, FechaF);
                Compras.SetFilter(Type, Format(Compras.Type::Item));
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(FechaI; FechaI)
                    {
                        ApplicationArea = All;
                        Caption = 'Fecha Inicial';
                    }
                    field(FechaF; FechaF)
                    {
                        ApplicationArea = All;
                        Caption = 'Fecha Final';
                    }
                    field(Producto; Compras."No.")
                    {
                        ApplicationArea = All;
                        Caption = 'Producto';
                        TableRelation = Item;
                    }

                    field(Ciudad; Compras."Shortcut Dimension 1 Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Ciudad';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1), Blocked = const(false));
                    }
                    field(UnidadNegocios; Compras."Shortcut Dimension 2 Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Código de Unidad de Negocios';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false));
                    }
                    field(CodFuncionario; Dimensiones.Code)
                    {
                        ApplicationArea = All;
                        Caption = 'Código de Funcionario';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3), Blocked = const(false));
                    }
                    field(Cliente; Dimensiones."Dimension Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Cliente';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4), Blocked = const(false));
                    }
                    field(Departamento; Dimensiones.Name)
                    {
                        ApplicationArea = All;
                        Caption = 'Departamento';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(0), Blocked = const(false));
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'src/ReportsLayout/DIMA Compra de Productos.rdl';
        }
    }

    var
        CompanyInfo: Record "Company Information";
        Dimensiones: Record "Dimension Value";
        FechaI: Date;
        FechaF: Date;
}