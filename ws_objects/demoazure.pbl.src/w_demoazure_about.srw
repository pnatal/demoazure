$PBExportHeader$w_demoazure_about.srw
$PBExportComments$Generated MDI About Box
forward
global type w_demoazure_about from window
end type
type cb_ok from commandbutton within w_demoazure_about
end type
type st_copyright from statictext within w_demoazure_about
end type
end forward

global type w_demoazure_about from window
integer x = 873
integer y = 428
integer width = 1166
integer height = 568
boolean titlebar = true
string title = "Dora Sistemas Brasil"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79416533
boolean center = true
cb_ok cb_ok
st_copyright st_copyright
end type
global w_demoazure_about w_demoazure_about

on w_demoazure_about.create
this.cb_ok=create cb_ok
this.st_copyright=create st_copyright
this.Control[]={this.cb_ok,&
this.st_copyright}
end on

on w_demoazure_about.destroy
destroy(this.cb_ok)
destroy(this.st_copyright)
end on

type cb_ok from commandbutton within w_demoazure_about
integer x = 407
integer y = 348
integer width = 334
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean default = true
end type

event clicked;//*-----------------------------------------------------------------*/
//*    clicked:  Close "About" window
//*-----------------------------------------------------------------*/
Close ( Parent )
end event

type st_copyright from statictext within w_demoazure_about
integer x = 27
integer y = 20
integer width = 1097
integer height = 276
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 79416533
boolean enabled = false
string text = "Apresentaçao em Jenkins"
alignment alignment = center!
boolean focusrectangle = false
end type

