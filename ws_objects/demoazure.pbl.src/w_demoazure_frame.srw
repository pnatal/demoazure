$PBExportHeader$w_demoazure_frame.srw
$PBExportComments$Generated MDI Frame
forward
global type w_demoazure_frame from window
end type
type mdi_1 from mdiclient within w_demoazure_frame
end type
end forward

global type w_demoazure_frame from window
integer x = 256
integer y = 132
integer width = 2409
integer height = 1572
boolean titlebar = true
string title = "Frame"
string menuname = "m_demoazure_frame"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 79416533
event type integer ue_new ( readonly string as_sheetname )
event type integer ue_open ( )
event ue_postopen ( )
event type integer ue_close ( )
event type integer ue_print ( )
event type integer ue_print_query ( )
mdi_1 mdi_1
end type
global w_demoazure_frame w_demoazure_frame

type variables
n_demoazure_sheetmanager inv_sheetmgt
end variables

forward prototypes
public function long of_getsheetcount ()
public function integer of_sheetisclosing (readonly w_demoazure_basesheet aw_sheet)
public function long of_classcount (readonly w_demoazure_basesheet aw_sheet)
public function integer of_adjustmenu (ref m_demoazure_frame am_menu)
end prototypes

event ue_new;//*-----------------------------------------------------------------*/
//*    ue_new:   Open a new instance of a specified sheet
//*-----------------------------------------------------------------*/
/*  Open an instance of passed sheet  */
Return inv_sheetmgt.of_OpenSheet ( as_sheetname )
end event

event ue_open;//*-----------------------------------------------------------------*/
//*    ue_open:  Open <something>
//							 Add code here for any documents, etc you want
//							 to open.  When the code is successful,
//							 Return 1 from the event
//*-----------------------------------------------------------------*/
Return -1
end event

event ue_postopen();//*-----------------------------------------------------------------*/
//*    ue_postopen:  Register the sheets
//*-----------------------------------------------------------------*/

/*  Define sheet windows and their display names */
string ls_sheets[]  = { "w_demoazure_sheet1", "w_demoazure_sheet2", "w_demoazure_sheet3" }
string ls_display[]  = { "Untitled for Sheet 1", "Untitled for Sheet 2", "Untitled for Sheet 3" }

/*  Register sheet windows with sheet manager  */
inv_sheetmgt.of_RegisterSheets ( ls_sheets, ls_display )
end event

event ue_close;//*-----------------------------------------------------------------*/
//*    ue_close:   Close the Active Sheet
//*-----------------------------------------------------------------*/
window	lw_sheet

lw_sheet = this.GetActiveSheet ( )

If IsValid ( lw_sheet ) Then 
	Return Close ( lw_sheet )
Else
	Return -1
End If
end event

event ue_print;//*-----------------------------------------------------------------*/
//*    ue_print:   Print the Active Sheet
//*-----------------------------------------------------------------*/
long ll_job
w_demoazure_basesheet lw_sheet

lw_sheet = this.GetActiveSheet ( )

If IsValid ( lw_sheet ) Then
	this.SetMicroHelp ( "Printing active sheet..." )
	ll_job = PrintOpen ( )
	lw_sheet.Print ( ll_job, 1, 1 )
	PrintClose ( ll_job )
	this.SetMicroHelp ( "" )
End If

Return 1
end event

event type integer ue_print_query();//*-----------------------------------------------------------------*/
//*    ue_print:   Print the Active Sheet and show Print Dialog to set print info before job started.
//*-----------------------------------------------------------------*/
long ll_job
w_demoazure_basesheet lw_sheet

lw_sheet = this.GetActiveSheet ( )

If IsValid ( lw_sheet ) Then
	this.SetMicroHelp ( "Printing active sheet..." )
	ll_job = PrintOpen ("", true)
	if ll_job <> -1 and not IsNull(ll_job) then
		lw_sheet.Print ( ll_job, 1, 1 )
		PrintClose ( ll_job )
	end if
	this.SetMicroHelp ( "" )
End If

Return 1
end event

public function long of_getsheetcount ();//*-----------------------------------------------------------------*/
//*    of_GetSheetCount:  Obtain the number of open sheets
//*-----------------------------------------------------------------*/
Return inv_sheetmgt.of_SheetCount ( )
end function

public function integer of_sheetisclosing (readonly w_demoazure_basesheet aw_sheet);//*-----------------------------------------------------------------*/
//*    of_SheetIsClosing:  Remove the sheet from the array
//*-----------------------------------------------------------------*/
Return inv_sheetmgt.of_SheetIsClosing ( aw_sheet )
end function

public function long of_classcount (readonly w_demoazure_basesheet aw_sheet);//*-----------------------------------------------------------------*/
//*    of_ClassCount:  Obtain the number of open sheets
//*							 for the specified class
//*-----------------------------------------------------------------*/
Return inv_sheetmgt.of_ClassCount ( aw_sheet )
end function

public function integer of_adjustmenu (ref m_demoazure_frame am_menu);//*-----------------------------------------------------------------*/
//*    of_AdjustMenu:  Add Sheet names to the menu
//*-----------------------------------------------------------------*/
Return inv_sheetmgt.of_AdjustMenu ( am_menu )
end function

event open;//*-----------------------------------------------------------------*/
//*    open:  Create sheet manager and post event
//*-----------------------------------------------------------------*/
string ls_sheets[]

/*  Create an instance of the sheet manager  */
inv_sheetmgt = Create n_demoazure_sheetmanager

this.Post Event ue_postopen ( )
end event

on w_demoazure_frame.create
if this.MenuName = "m_demoazure_frame" then this.MenuID = create m_demoazure_frame
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_demoazure_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_demoazure_frame
long BackColor=275287458
end type

