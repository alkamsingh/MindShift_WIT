<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MindshiftAdmin.aspx.cs" Inherits="MindShift.MindshiftAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mindshift Admin</title>

    <script>
     function js()
     {
         window.open('notification.html');
     }

 </script>
        <style> 

            .buttonChange{
color: #fff;
    background-color: #6c757d;
    border-color: #6c757d;
width: 145px;
height: 37px;
text-align: center;
vertical-align:middle;
line-height: 0.6;

}
            * { 
                box-sizing: border-box; 
            } 
              iframe {
    height: 300px !important;
                    }

             #HtmlEditorExtender1_ExtenderContentEditable 
             {
                 background-color:white;
                
                 width:100%;
             }
             #HtmlEditorExtenderBehavior_ExtenderButtonContainer
             {
                   width:500px;

             }
            /* CSS property for header section */ 
            .header { 
                
                background-color:#17a2b8;
               
 
                   padding: 5px; 
                text-align: center; 
            } 
              
            /* CSS property for nevigation menu */ 
            .nav_menu { 
                overflow: hidden; 
                background-color: #333; 
            } 
         
            .nav_menu a:hover { 
                background-color: white; 
                color: mediumblue; 
            } 
              
            /* CSS property for content section */
            .columnA {
                float: left;
                width: 31%;
                padding: 10px;
                
                height:auto;
               
                
            }
            .columnB {
                float: left;
                width: 31%;
                padding: 10px;
               
                
                
            }
                .columnC { 
                float: right; 
                width: 31%; 
                padding: 10px; 
              
                
               
            } 
            h2 { 
                margin-top:0px;
                margin-bottom:6px;
                color:black; 
                text-align:left; 
                font-size:medium;
            } 
            
          
  .container {
      margin-top:21px;
      align-content:center;
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 17px;
  color:black;
  padding:4px 5px 2px 40px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
   
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #cccccc;
  border-color:#6c757d;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

.dropbtn {
  background-image: linear-gradient(to right top, #0c0537, #162b63, #1c5190, #1a7abe, #12a6eb);
 
  color: white;
  width:350px;
 
  padding: 10px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  align-content:center;
}

.dropdown {
    padding-top:18px;
  position: relative;
  display: inline-block;
  align-content:center;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 150px;
  box-shadow: 0px 8px 8px 0px rgba(0,0,0,0.2);
  z-index: 1;
  align-content:center;
}

.dropdown-content a {
  color: black;
  padding: 10px 12px;
  text-decoration: none;
  display: block;
  align-content:center;
}

.dropdown-content a:hover {background-color: cornflowerblue}

.dropdown:hover .dropdown-content {
  display: block;
  align-content:center;
}

.dropdown:hover .dropbtn {
  background-color: cornflowerblue;
  align-content:center;
}

* {
  box-sizing: border-box;
}
.body1 {
 height: 100%;
background-color:cornflowerblue;
}

.align {
  align-items: center;
  display: flex;
  flex-direction: row;

}

.register {
 
  text-align: left;
  padding: 8rem 3rem;

  input {
    border: 10px solid #242c37;
    border-radius: 2100px;
    background-color: transparent;
    text-align: center;

  }

}

@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.btn {
  display: inline-block;
  *display: inline;
  *zoom: 1;
  padding: 10px 20px 4px;
  margin-bottom: 0;
  font-size: 13px; 
  line-height: 18px; 
  color: #333333;
  text-align:center;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); 
  vertical-align: middle; 
  background-color: #f5f5f5; 
  background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
  background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
  background-image: linear-gradient(top, #ffffff, #e6e6e6); 
  background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); 
  border: 1px solid #e6e6e6;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px; 
  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
  -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer;
  *margin-left: .3em; 
}
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { 
  background-color: #e6e6e6;
}
.btn-large {
  padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; 
}
.btn:hover { 
  color: #333333;
  text-decoration: none; 
  background-color: #e6e6e6;
  background-position: 0 -15px;
  -webkit-transition: background-position 0.1s linear; 
  -moz-transition: background-position 0.1s linear; 
  -ms-transition: background-position 0.1s linear;
  -o-transition: background-position 0.1s linear;
  transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { 
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); 
  color: #ffffff;
}
.btn-primary.active {
  color: rgba(255, 255, 255, 0.75);
}
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

html { width: 100%; height:100%; overflow:hidden; }

body { 
    width: 100%;
    height:100%;
    font-family: 'Open Sans', sans-serif;
    
    background-color:rgba(255, 255, 255, .2);
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background-color:lightblue;
     background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
  background-color:lightblue;
   
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
.login { 
    position: fixed;
    top: 50%;
    left: 15%;
    margin: -150px 0px 0px -150px;
    width:300px;
    
    
}
.login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

input { 
    width: 100%; 
    margin-bottom: 10px; 
    
    border: none;
    outline: none;
    padding: 15px;
    font-size: 13px;
    color: black;
   
    border: 1px solid rgba(0,0,0,0.3);
    border-radius: 5px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
}



 </style> 
 </head> 
      
    <body style="background-color:#f2f2f2"> 
          <form id="form1" runat="server">
        <!-- header of website layout -->
        <div class = "header"> 
            <h1 style = "color:white;font-size:120%"> 
                ADMIN PAGE 
            </h1> 
        </div> 
          
          
        <!-- Content section of website layout -->
        <div class = "row"> 
              
           <div class = "columnA"> 
                <h2>Create New Section</h2>
                
                 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

                <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="btnCreate" eventname="Click"  />
        </Triggers>
            <ContentTemplate>
           <asp:Label ID="lblMsg" runat="server" visible="false" ForeColor="Green" ></asp:Label>
  

                
<input type="text" name="Header" placeholder="Enter Header for new Section" id="txtHeader" runat="server"  />
                <br />
    <asp:TextBox ID="txtEditor" runat="server" Height="450px" Width="100%" BackColor="White" />

    <asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" TargetControlID="txtEditor" EnableSanitization="false">
    </asp:HtmlEditorExtender>
    <br />
  <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click"  CssClass="buttonChange"/>
    </ContentTemplate>
        </asp:UpdatePanel>

                </div>
 </div>  
              
            <div class = "columnB"> 
             <h2>Number of Question to Display</h2> 
                <div class="dropdown">
                    <div class="dropdown-content"></div>
                       <asp:UpdatePanel runat="server" id="UpdatePanel2" updatemode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="btnSaveQues" eventname="Click"/>
        </Triggers>
            <ContentTemplate>
               <asp:DropDownList ID="ddlDisplayQuiz" runat="server" Width="145px" Height="25px">
                         <asp:ListItem >2</asp:ListItem>
                         <asp:ListItem >3</asp:ListItem>
                         <asp:ListItem >4</asp:ListItem>
                         <asp:ListItem >5</asp:ListItem>
                                </asp:DropDownList>
                    <br /> <br />
                    <asp:Button ID="btnSaveQues" runat="server" Text="Save" OnClick="btnSaveQues_Click"  CssClass="buttonChange" />
                </ContentTemplate></asp:UpdatePanel>
                    </div>

                <br /><br />

                 <h2>Notification interval</h2> 
                 <div class="dropdown">
                 <div class="dropdown-content"></div>
                   <asp:DropDownList ID="ddlTime" runat="server"  Width="145px" Height="25px">
                         <asp:ListItem >30 mins</asp:ListItem>
                         <asp:ListItem >60 mins</asp:ListItem>
                         <asp:ListItem >90 mins</asp:ListItem>
                         <asp:ListItem >120 mins</asp:ListItem>
                                </asp:DropDownList>
                    <br /> <br />
                
                    <asp:Button ID="clickme" runat="server" Text="Save" OnClientClick="js();"  CssClass="buttonChange"/>
                 
</div> </div>
              
       <div class = "columnC"> 
                <h2>Activities</h2> 
             <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="btnSave" eventname="Click" />
        </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlSections" runat="server" Height="550px" BorderWidth="1px" ScrollBars="Auto">
           <asp:Label ID="lblMsgPanel" runat="server" Visible="false" ForeColor="Green" ></asp:Label>
                  <asp:DataList id="ddlPanels" runat="server" OnItemDataBound="ddlPanels_ItemDataBound">
               <ItemTemplate>
                   
<label class="container"><%# Eval("Header") %>
    <asp:CheckBox ID="chkPanel" runat="server" />
            <asp:Label ID="lblID" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
            <asp:Label ID="lblEnable" runat="server" Visible="false" Text='<%# Eval("Enable") %>'></asp:Label>
            <span class="checkmark"></span>
           </label>

               </ItemTemplate>

           </asp:DataList>
                     </asp:Panel>
                <br />
           <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  CssClass="buttonChange"/>
                   
                </ContentTemplate>
        </asp:UpdatePanel>
            </div> 
         
              </form>
    </body> 
</html>  



