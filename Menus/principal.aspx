<%@ Page Title="" Language="C#" MasterPageFile="~/M_Principal.Master" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="OpenHack.Web.Menus.principal" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <br />
            <h4>PAGINA PRINCIPAL</h4>
            <hr />
            
            <div class="row">
            <div class="row">
                <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="up_ConcentradoTickets">
                    <ContentTemplate>
                        <div class="col-md-12">
                            <div class="chat-panel panel panel-default">
                                <div class="panel-heading">
                                    <i class=" fa fa-table fa-fw"></i>
                                    <asp:Label ID="lbl_Concentrado" runat="server" Text="ULTIMOS COMENTARIOS"></asp:Label>
                                    <div class="btn-group pull-right">
                                        <asp:LinkButton ID="btn_Refresh5" CssClass="btn btn-primary btn-sm" 
                                         runat="server" onclick="btn_Refresh5_Click"><i class="fa fa-refresh fa-fw"></i></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="panel-body">
                                <div class="col-md-4" align="center">
                                    <asp:GridView ID="gv_Concentrado" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="MYSQL_Concentrado" EmptyDataText="DATOS NO ENCONTRADOS" 
                                        CssClass="table table-bordered table-condensed table-hover" Width="750px"
                                        AlternatingRowStyle-BackColor="Silver" HeaderStyle-BackColor="Black" 
                                        HeaderStyle-ForeColor="White">
                                        <Columns>
                                            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                                                SortExpression="empresa">
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="comentario" HeaderText="Comentario" 
                                                SortExpression="comentarios" >
                                                <ItemStyle Width="300px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fecha" HeaderText="Fecha" 
                                                SortExpression="fecha" >
                                                <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="MYSQL_Concentrado" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                                        SelectCommand="wDB_obtOpinionesPorEmpresa" 
                                        SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                </div>
                <div class="col-md-6">
                <asp:UpdatePanel runat="server" ID="up_ConcentradoTipos">
                    <ContentTemplate>
                        <div class="col-md-12">
                            <div class="chat-panel panel panel-default">
                               <div class="panel-heading">
                                <i class=" fa fa-table fa-fw"></i>
                                <asp:Label ID="Label1" runat="server" Text="CALIFICACIONES POR EMPRESA"></asp:Label>
                                <div class="btn-group pull-right">
                                    <asp:LinkButton ID="btn_Refresh6" CssClass="btn btn-primary btn-sm" 
                                     runat="server" onclick="btn_Refresh6_Click"><i class="fa fa-refresh fa-fw"></i></asp:LinkButton>
                                </div>
                            </div>
                                <div class="panel-body">
                                <div class="col-md-4">
                                    <asp:GridView ID="gv_TicktesPorTipo" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="MYSQL_ConcentradoPorTipo" EmptyDataText="DATOS NO ENCONTRADOS" 
                                        CssClass="table table-bordered table-condensed table-hover" Width="400px"
                                        AlternatingRowStyle-BackColor="Silver" HeaderStyle-BackColor="Black" 
                                        HeaderStyle-ForeColor="White">
                                        <Columns>
                                            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                                                SortExpression="empresa">
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="calificacion" HeaderText="Calificacion" 
                                                SortExpression="calificacion" >
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="MYSQL_ConcentradoPorTipo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                                        SelectCommand="wDB_obtCalificaciones" 
                                        SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                            </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                  <asp:UpdatePanel runat="server" ID="up_Comentarios">
                    <ContentTemplate>
                        <div class="col-md-12">
                            <div class="chat-panel panel panel-default">
                               <div class="panel-heading">
                                <i class=" fa fa-table fa-fw"></i>
                                <asp:Label ID="lbl_Crear" runat="server" Text="CREAR UN COMENTARIO"></asp:Label>
                                <div class="btn-group pull-right">
                                    <asp:LinkButton ID="btn_Refresh7" CssClass="btn btn-primary btn-sm" 
                                     runat="server" onclick="btn_Refresh7_Click"><i class="fa fa-refresh fa-fw"></i></asp:LinkButton>
                                </div>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">CATEGORIA: </label>
                                            <asp:DropDownList ID="ddl_Categorias" runat="server" CssClass="form-control" 
                                                DataSourceID="MYSQL_Categorias" DataTextField="nombre" DataValueField="id">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="MYSQL_Categorias" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                                                ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                                                SelectCommand="wCAT_obtCategoriasG" SelectCommandType="StoredProcedure">
                                            </asp:SqlDataSource>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">EMPRESA: </label>
                                            <asp:DropDownList ID="ddl_Empresas" runat="server" CssClass="form-control" 
                                                DataSourceID="MYSQL_Empresas" DataTextField="nombre" DataValueField="id">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="MYSQL_Empresas" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                                                ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                                                SelectCommand="wCAT_obtEmpresasXCategorias" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddl_Categorias" DefaultValue="0" Name="p_id" 
                                                        PropertyName="SelectedValue" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                             </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>  
                </div>
            </div>
            </div>
    </div>

    <!-- SCRIPTS -->
    <script type="text/javascript" language="javascript">

        function openModal() {
            $('#myModalGeneral').modal('show');
            $('#myModalGeneral').on('hidden.bs.modal', function (e) {
            })
        }
    </script>

    <hr />
</asp:Content>
