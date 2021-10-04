$PBExportHeader$w_demoazure_toolbars.srw
$PBExportComments$Generated MDI Toolbar Configuration
forward
global type w_demoazure_toolbars from window
end type
type rb_floating from radiobutton within w_demoazure_toolbars
end type
type rb_bottom from radiobutton within w_demoazure_toolbars
end type
type rb_right from radiobutton within w_demoazure_toolbars
end type
type rb_top from radiobutton within w_demoazure_toolbars
end type
type rb_left from radiobutton within w_demoazure_toolbars
end type
type cb_done from commandbutton within w_demoazure_toolbars
end type
type cb_visible from commandbutton within w_demoazure_toolbars
end type
type cbx_showtips from checkbox within w_demoazure_toolbars
end type
type cbx_showtext from checkbox within w_demoazure_toolbars
end type
type gb_options from groupbox within w_demoazure_toolbars
end type
end forward

global type w_demoazure_toolbars from window
integer x = 850
integer y = 468
integer width = 1157
integer height = 856
boolean titlebar = true
string title = "Toolbars"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79416533
boolean center = true
rb_floating rb_floating
rb_bottom rb_bottom
rb_right rb_right
rb_top rb_top
rb_left rb_left
cb_done cb_done
cb_visible cb_visible
cbx_showtips cbx_showtips
cbx_showtext cbx_showtext
gb_options gb_options
end type
global w_demoazure_toolbars w_demoazure_toolbars

type variables
/*  Parent window reference */
window		iw_window
end variables

event open;//*-----------------------------------------------------------------*/
//*    open:  Initialize display
//*-----------------------------------------------------------------*/

/*  Parent window is passed as reference  */
iw_window = message.powerobjectparm

/*  Set toolbar alignment status  */
Choose Case iw_window.ToolbarAlignment
		
	Case AlignAtBottom! 
		rb_bottom.Checked = True
		
	Case AlignAtLeft!
		rb_left.Checked = True
		
	Case AlignAtRight! 
		rb_right.Checked = True
		
	Case AlignAtTop! 
		rb_top.Checked = True
		
	Case Floating!
		rb_floating.Checked = True
		
End Choose

/*  Set toolbar visible status  */
If iw_window.ToolbarVisible Then
	cb_visible.Text = "&Hide"
Else
	cb_visible.Text = "&Show"
End If

/*  Set toolbar text mode status  */
cbx_showtext.Checked = GetApplication ( ).ToolbarText 

/*  Set toolbar tips mode status  */
cbx_showtips.Checked = GetApplication ( ).ToolbarTips 
end event

on w_demoazure_toolbars.create
this.rb_floating=create rb_floating
this.rb_bottom=create rb_bottom
this.rb_right=create rb_right
this.rb_top=create rb_top
this.rb_left=create rb_left
this.cb_done=create cb_done
this.cb_visible=create cb_visible
this.cbx_showtips=create cbx_showtips
this.cbx_showtext=create cbx_showtext
this.gb_options=create gb_options
this.Control[]={this.rb_floating,&
this.rb_bottom,&
this.rb_right,&
this.rb_top,&
this.rb_left,&
this.cb_done,&
this.cb_visible,&
this.cbx_showtips,&
this.cbx_showtext,&
this.gb_options}
end on

on w_demoazure_toolbars.destroy
destroy(this.rb_floating)
destroy(this.rb_bottom)
destroy(this.rb_right)
destroy(this.rb_top)
destroy(this.rb_left)
destroy(this.cb_done)
destroy(this.cb_visible)
destroy(this.cbx_showtips)
destroy(this.cbx_showtext)
destroy(this.gb_options)
end on

type rb_floating from radiobutton within w_demoazure_toolbars
integer x = 119
integer y = 420
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "&Floating"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Make toolbar floating
//*-----------------------------------------------------------------*/
iw_window.ToolbarAlignment = Floating!
end event

type rb_bottom from radiobutton within w_demoazure_toolbars
integer x = 119
integer y = 344
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "&Bottom"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Align toolbar at bottom
//*-----------------------------------------------------------------*/
iw_window.ToolbarAlignment = AlignAtBottom!
end event

type rb_right from radiobutton within w_demoazure_toolbars
integer x = 119
integer y = 268
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "&Right"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Align toolbar at right
//*-----------------------------------------------------------------*/
iw_window.ToolbarAlignment = AlignAtRight!
end event

type rb_top from radiobutton within w_demoazure_toolbars
integer x = 119
integer y = 192
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "&Top"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Align toolbar on top
//*-----------------------------------------------------------------*/
iw_window.ToolbarAlignment = AlignAtTop!
end event

type rb_left from radiobutton within w_demoazure_toolbars
integer x = 119
integer y = 116
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "&Left"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Align toolbar on left
//*-----------------------------------------------------------------*/
iw_window.ToolbarAlignment = AlignAtLeft!
end event

type cb_done from commandbutton within w_demoazure_toolbars
integer x = 750
integer y = 148
integer width = 334
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Done"
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Close "Toolbar" Window
//*-----------------------------------------------------------------*/
Close ( Parent )
end event

type cb_visible from commandbutton within w_demoazure_toolbars
integer x = 750
integer y = 48
integer width = 334
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Hide"
boolean default = true
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Indicate opposite toolbar visible status
//*-----------------------------------------------------------------*/
If this.Text = "&Hide" Then
	iw_window.ToolbarVisible = False
	this.Text = "&Show"
Else
	iw_window.ToolbarVisible = True
	this.Text = "&Hide"
End If
end event

type cbx_showtips from checkbox within w_demoazure_toolbars
integer x = 119
integer y = 656
integer width = 462
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "Show &PowerTips"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Set toolbar tips mode
//*-----------------------------------------------------------------*/
GetApplication ( ).ToolbarTips = this.Checked 
end event

type cbx_showtext from checkbox within w_demoazure_toolbars
integer x = 119
integer y = 568
integer width = 457
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "Show Te&xt"
borderstyle borderstyle = stylelowered!
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Set toolbar text mode
//*-----------------------------------------------------------------*/
GetApplication ( ).ToolbarText = this.Checked 
end event

type gb_options from groupbox within w_demoazure_toolbars
integer x = 46
integer y = 24
integer width = 658
integer height = 512
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79416533
string text = "Move"
borderstyle borderstyle = stylelowered!
end type

