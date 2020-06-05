<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MindshiftEmployee.aspx.cs" Inherits="MindShift.MindshiftEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta http-equiv="Access-Control-Allow-Origin" content="*"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mindshift</title>
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto:400,500|Open+Sans" rel="stylesheet"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>




</head>
<body >
     <form id="form1" runat="server">
<div class="card">
<div class="card-header" id="headingOne" role="tab">
			
        <h5 class="mb-0">
          Feeling Stressed? No worries, have a moment of relax time as per your interest. Lets share a happy time together.<i class="fas fa-angle-down rotate-icon"></i>
        </h5>
      
                
</div>
 <div class="row">
<div class="col-md-4">
<div class="card-body row">

    
                <div class="card" style="width:100%;">
				       <div class="card-header bg-info text-white" style="height:62px;">Test your Knowledge on Covid-19</div>
				       <div class="card-body container">
					      <asp:Label ID="lblPercent" runat="server" Visible="false" ForeColor="Green" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:DataList ID="ddlQuiz" runat="server" RepeatDirection="Vertical" OnItemDataBound="ddlQuiz_ItemDataBound">
                            <ItemTemplate>
                                 <span><b><asp:Label ID="lbltext" runat="server" Text='<%# Eval("ques") %>'></asp:Label></b></span>
						<div class="checkbox">
                            <asp:Label ID="lblOptions" runat="server" Text='<%# Eval("options") %>' Visible="false"></asp:Label>
                               <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                <asp:RadioButtonList ID="rdbQuiz" runat="server" RepeatDirection="Vertical" ></asp:RadioButtonList>
                            <b><asp:Label ID="lblcorrect" runat="server" Visible="false" ForeColor="Red"> 

                               </asp:Label>   <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("answer") %>' Visible="false"></asp:Label></b>
                        </div>
                       
                            </ItemTemplate>

                        </asp:DataList>
					   	
                               

                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-secondary" /></button>
					   
					   
					   </div>
				  
				  </div>    
        

                  
				  
</div>
</div>

<div class="col-md-8">
<div class="card-body row" >	
     
     <asp:DataList ID="ddlPanels" runat="server" RepeatDirection="Horizontal"  RepeatColumns="3"  ItemStyle-VerticalAlign="Top">
                    <ItemTemplate >   
                        <table  style="width:100%"  class="card">
                            <tr style="width: 320px!important;display: block;">
                                <td>
                                     <div class="card-header bg-info text-white" style="width:320px;"><asp:Label ID="lblHeader" runat="server" Text='<%# Eval("header") %>' class="btn text-white" ></asp:Label></div>
                                </td>
                            </tr>
                             <tr style="width: 320px!important;height: 420px!important;display: block;">
                                <td>
                                     <div  id="div" runat="server"  class="card-body container" style="width:320px">
                            <asp:Label ID="lbltext" runat="server" Text='<%# Eval("text") %>'></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:Label>
                        </div>
                                </td>
                            </tr>
                        </table>
					 
                    </ItemTemplate>
     </asp:DataList>	
            </div>				
</div>
</div>
</div>


    </form>
    <script>
    window.watsonAssistantChatOptions = {
        integrationID: "b86337ed-1c2b-4f9d-b42c-70c9f92ec19d", // The ID of this integration.
        region: "eu-gb", // The region your integration is hosted in.
        serviceInstanceID: "fed9ce16-66cb-4f94-9c27-84ca8ebb2465", // The ID of your service instance.
        onLoad: function(instance) { instance.render(); }
      };
    setTimeout(function(){
      const t=document.createElement('script');
      t.src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js";
      document.head.appendChild(t);
    });
  </script>
</body>










