<%@ Page Title="" Language="C#" MasterPageFile="~/M_Principal.Master" AutoEventWireup="true" CodeBehind="empresas.aspx.cs" Inherits="OpenHack.Web.Catalogos.empresas" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="container-fluid">

        <!-- TITULO -->
        <div id="div_Titulo" class="row">
            <div class="col-md-12">
                <h4 class="page-header">
                    <label>CATALOGO EMPRESAS</label>
                </h4>
            </div>
        </div>

       
         <!-- UPDATE IMAGE -->
        <div id="div_UpdatePanel" class="row">
            <div class="col-md-12">
                <asp:UpdateProgress ID="up_Progress" runat="server" AssociatedUpdatePanelID="up_Datos">
                    <ProgressTemplate>
                        <asp:Image ID="img_LoadingPro" runat="server" Height="20px" Width="20px" ImageUrl="~/Images/loading.gif" />
                        <asp:Label ID="lbl_LoadingPro" runat="server" Text="Cargando datos...." Font-Bold="True"></asp:Label>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>

         <!--- DATOS --->
        <asp:UpdatePanel ID="up_Datos" UpdateMode="Conditional" runat="server">
            <ContentTemplate>

                <!-- MENSAJE -->
                <div id="div_Mensaje" class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lbl_Mensaje" CssClass="label" runat="server" Text=" "></asp:Label>
                    </div>
                </div>

                <br />

                <!-- CUADRO -->
                <div id="div_Cuadro" class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:HiddenField runat="server" Value="1" ID="hd_todos" />
                                        <asp:Label ID="lbl_RegFiltrados" ForeColor="#438AC9" Font-Bold="true" runat="server" Text="0"></asp:Label>
                                        <label>Registros Filtrados De</label>
                                        <asp:Label ID="lbl_TotalReg" ForeColor="#438AC9" Font-Bold="true" runat="server" Text="0"></asp:Label>
                                    </div>
                                    <div class="col-md-4" align="right">
                                        <asp:LinkButton ID="btn_Nuevo" CssClass="btn btn-primary btn-sm" 
                                            runat="server" onclick="btn_Nuevo_Click"><i class="fa fa-plus fa-fw"></i></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="btn_Refresh" CssClass="btn btn-primary btn-sm" 
                                            runat="server" onclick="btn_Refresh_Click"><i class="fa fa-refresh fa-fw"></i></asp:LinkButton>
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <asp:Panel runat="server" CssClass="table-responsive" ID="pan_General" DefaultButton="btn_Refresh">
                                    <div id="div_Datos">
                                        <!-- TABLA -->
                                        <div class="row">
                                            <div class="col-md-12">
                                    
                                                <table style="width:260px" class="table table-bordered table-condensed table-hover table-responsive">
                                                    <tr style="background-color: #333333; color: #FFFFFF">
                                                        <th style="width:30px"></th>
                                                        <th style="width:30px"></th>
                                                        <th style="width:200px">nombre</th>
                                                    </tr>
                                                    <tr align="center">
                                                        <td><asp:LinkButton ID="btn_Limpiar" runat="server" onclick="btn_Limpiar_Click"><i id='i_Editar' class='fa fa-eraser fa-lg' runat='server'></i></asp:LinkButton></td>
                                                        <td></td>
                                                        <td><asp:TextBox ID="TextBox1" Width="180px" CssClass="form-control" runat="server" MaxLength="45"></asp:TextBox></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- GRID -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="WordWrap">
                                                <asp:GridView Width="260px" ID="gv_Datos" EmptyDataText="DATOS NO ENCONTRADOS" runat="server" 
                                                    ondatabound="gv_Datos_DataBound" onrowcreated="gv_Datos_RowCreated" 
                                                    onselectedindexchanged="gv_Datos_SelectedIndexChanged" ShowHeader="False"
                                                    CssClass="table table-bordered table-condensed table-hover" AutoGenerateSelectButton="True"
                                                    AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="MYSQL_Datos" >
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btn_Editar" runat="server" CommandName="Select"><i id='i_Editar' class='fa fa-edit fa-lg' runat='server'></i></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" Visible="false"
                                                            SortExpression="Id">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="nombre" HeaderText="nombre" 
                                                            SortExpression="nombre">
                                                            <ItemStyle Width="200px"/>
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="MYSQL_Datos" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:open_hackConnectionString %>" 
                                                    ProviderName="<%$ ConnectionStrings:open_hackConnectionString.ProviderName %>" 
                                                    SelectCommand="wCAT_obtEmpresasF" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="p_txt0" 
                                                            PropertyName="Text" Type="String" />
                                                        <asp:ControlParameter ControlID="lbl_NumPagina" DefaultValue="1" 
                                                            Name="p_pagina" PropertyName="Text" Type="Int16" />
                                                        <asp:ControlParameter ControlID="hd_todos" DefaultValue="1" 
                                                            Name="p_todos" PropertyName="Value" Type="Int16" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                        
                                    </div>
                                </asp:Panel>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:LinkButton ID="btn_Primero" runat="server" onclick="btn_Primero_Click"><i class="fa fa-angle-double-left fa-2x" ></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_Anterior" runat="server" onclick="btn_Anterior_Click"><i class="fa fa-angle-left fa-2x"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_Siguiente" runat="server" onclick="btn_Siguiente_Click"><i class="fa fa-angle-right fa-2x"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btn_Ultimo" runat="server" onclick="btn_Ultimo_Click"><i class="fa fa-angle-double-right fa-2x"></i></asp:LinkButton>
                                        &nbsp;
                                        &nbsp
                                        <label>Mostrando Página</label>
                                        <asp:Label ID="lbl_NumPagina" runat="server" Text="1" ForeColor="#438AC9" Font-Bold="True"></asp:Label>
                                        <label>De</label>
                                        <asp:Label ID="lbl_TotalPaginas" runat="server" Text="1" ForeColor="#438AC9" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>

            </ContentTemplate>
            <Triggers>

            </Triggers>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="up_Modal" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <!-- MODAL -->
                    <div id="div_Modal" class="row">
                         <!-- MODAL EDITAR -->
                        <div class="modal fade" id="myModalGeneral" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title" id="myModalLabel">AUXILIAR</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div id="loadImg"><div><asp:Image ID="img_Loading" runat="server" Height="20px" Width="20px" ImageUrl="~/Images/loading.gif" /></div></div>
                                        <iframe runat="server" id="frm_Visor" width="100%" height="600px" src="" scrolling="auto" frameborder="0"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="gv_Datos" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="btn_Nuevo" EventName="Click" />
                </Triggers>
        </asp:UpdatePanel>

    </div>

    <!-- SCRIPTS -->
    <script type="text/javascript" language="javascript">

        function openModal() {
            $('#myModalGeneral').modal('show');
            $('#myModalGeneral').on('hidden.bs.modal', function (e) {
                document.getElementById('<%= btn_Refresh.ClientID %>').click();
                // do something...
            })
        }
    </script>

</asp:Content>
