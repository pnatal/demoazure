$PBExportHeader$n_demoazure_sheetmanager.sru
$PBExportComments$Generated MDI Sheet Management
forward
global type n_demoazure_sheetmanager from nonvisualobject
end type
end forward

global type n_demoazure_sheetmanager from nonvisualobject
end type
global n_demoazure_sheetmanager n_demoazure_sheetmanager

type variables
string is_sheets[], is_display[]
w_demoazure_basesheet iw_opensheets[]
menu im_items[]
end variables

forward prototypes
public function integer of_unregistersheet (readonly string as_sheet)
public function long of_sheetcount ()
public function integer of_opensheet (readonly string as_sheetname)
public function long of_sheetisclosing (readonly w_demoazure_basesheet aw_sheet)
public function long of_classcount (readonly w_demoazure_basesheet aw_sheet)
public function integer of_openallsheets ()
public function integer of_adjustmenu (ref m_demoazure_frame am_menu)
public function integer of_resetmenu ()
public function integer of_registersheets (readonly string as_sheets[], readonly string as_displays[])
public function integer of_addtomenu (readonly string as_sheet, readonly string as_display)
public function integer of_registersheet (readonly string as_sheet, readonly string as_display)
end prototypes

public function integer of_unregistersheet (readonly string as_sheet);//*-----------------------------------------------------------------*/
//*    of_UnRegisterSheet:  Remove a sheet from the sheet manager
//*-----------------------------------------------------------------*/
long ll_s, ll_sheets, ll_new
string ls_sheets[], ls_display[], ls_init[]

ll_sheets = UpperBound ( is_sheets ) 

/*  Find Sheet Index  */
For ll_s = 1 to ll_sheets
	If Lower ( as_sheet ) = is_sheets[ll_s] Then
		Continue
	Else
		ll_new++
		ls_sheets[ll_new] = is_sheets[ll_s]
		ls_display[ll_new] = is_display[ll_s]
	End If
Next

is_sheets = ls_init
is_display = ls_init

is_sheets = ls_sheets
is_display = ls_display

Return 1
end function

public function long of_sheetcount ();//*-----------------------------------------------------------------*/
//*    of_SheetCount:  Return the count of open sheets
//*-----------------------------------------------------------------*/
Return UpperBound ( iw_opensheets )
end function

public function integer of_opensheet (readonly string as_sheetname);//*-----------------------------------------------------------------*/
//*    of_OpenSheet:  Open an instance of a sheet
//*-----------------------------------------------------------------*/
int li_rc
w_demoazure_basesheet lw_sheet

/*  Open an instance of the specified sheet  */
li_rc = OpenSheet ( lw_sheet, as_sheetname, w_demoazure_frame, 0, Cascaded! ) 

If li_rc = 1 Then
	/*  Add the sheet reference to the open sheet array  */
	iw_opensheets[UpperBound(iw_opensheets)+1] = lw_sheet 
End If

Return li_rc
end function

public function long of_sheetisclosing (readonly w_demoazure_basesheet aw_sheet);//*-----------------------------------------------------------------*/
//*    of_SheetIsClosing:  Remove sheet from the array
//*-----------------------------------------------------------------*/
long ll_s, ll_sheets, ll_newsheets
w_demoazure_basesheet lw_sheets[], lw_init[]

/*  Add the sheet reference to the open sheet array  */
ll_sheets = UpperBound (  iw_opensheets )
For ll_s = 1 to ll_sheets
	If aw_sheet = iw_opensheets[ll_s] Then
		Continue
	Else
		ll_newsheets++
		lw_sheets[ll_newsheets] = iw_opensheets[ll_s]
	End If
Next

iw_opensheets = lw_init
iw_opensheets = lw_sheets

Return ll_newsheets
end function

public function long of_classcount (readonly w_demoazure_basesheet aw_sheet);//*-----------------------------------------------------------------*/
//*    of_ClassCount:  Return the count of open sheets for this class
//*-----------------------------------------------------------------*/
long ll_s, ll_sheets, ll_instcount

ll_sheets = UpperBound (iw_opensheets ) 

For ll_s = 1 to ll_sheets
	If aw_sheet.ClassName ( ) = iw_opensheets[ll_s].ClassName ( ) Then
		ll_instcount++
	End If
Next

Return ll_instcount
end function

public function integer of_openallsheets ();//*-----------------------------------------------------------------*/
//*    of_OpenAllSheets:  Open an instance of every registered sheet
//*-----------------------------------------------------------------*/
int li_rc, li_return=1
long ll_s, ll_sheets

ll_sheets = UpperBound (  is_sheets )

For ll_s = 1 to ll_sheets
	
	of_OpenSheet ( is_sheets[ll_s] )

	If li_rc <> 1 Then
		/*  Save error return code  */
		li_return = li_rc
	End If
	
Next

Return li_return
end function

public function integer of_adjustmenu (ref m_demoazure_frame am_menu);//*-----------------------------------------------------------------*/
//*    of_AdjustMenu:  Add the sheet name to the frame menu
//*-----------------------------------------------------------------*/
long ll_i, ll_items

ll_items = UpperBound ( im_items ) 

For ll_i = 1 to ll_items
	am_menu.m_file.m_new.Item[ll_i].Text = im_items[ll_i].Text
	am_menu.m_file.m_new.Item[ll_i].Tag = im_items[ll_i].Tag
	am_menu.m_file.m_new.Item[ll_i].Visible = im_items[ll_i].Visible
Next

Return 1
end function

public function integer of_resetmenu ();//*-----------------------------------------------------------------*/
//*    of_ResetMenu:  Reset the sheet items
//*-----------------------------------------------------------------*/
m_demoazure_frame lm_menu
int li_i, li_max

lm_menu = w_demoazure_frame.MenuId

/*  Get References to all the items under opensheet */
im_items = lm_menu.m_file.m_new.item

li_max = UpperBound ( im_items ) 
For li_i = 1 to li_max
	im_items[li_i].Text = "<sheet" + String ( li_i ) + ">"
	im_items[li_i].Tag = "<sheet" + String ( li_i ) + ">"
	im_items[li_i].Visible = True
Next

Return 1
end function

public function integer of_registersheets (readonly string as_sheets[], readonly string as_displays[]);//*-----------------------------------------------------------------*/
//*    of_RegisterSheets:  Clear the sheet array and replace
//*								  with a new array of sheets
//*-----------------------------------------------------------------*/
string ls_init[]
long ll_s, ll_sheets

/*  Reset the sheet array  */
is_sheets = ls_init
is_display = ls_init

is_sheets = as_sheets
is_display = as_displays

of_ResetMenu ( )

ll_sheets = UpperBound ( is_sheets ) 
For ll_s = 1 to ll_sheets
	of_AddToMenu ( is_sheets[ll_s], is_display[ll_s] )
Next 

Return 1
end function

public function integer of_addtomenu (readonly string as_sheet, readonly string as_display);//*-----------------------------------------------------------------*/
//*    of_AddToMenu:  Add the sheet name to the frame menu
//*-----------------------------------------------------------------*/
m_demoazure_frame lm_menu
int li_i, li_max, li_j

lm_menu = w_demoazure_frame.MenuId

/*  Get References to all the items under opensheet */
im_items = lm_menu.m_file.m_new.item

li_max = UpperBound ( im_items ) 
For li_i = 1 to li_max
	If Left ( im_items[li_i].Tag, 1 ) = "<" Then
		/*  Is UnAssigned  */
		im_items[li_i].Tag = as_sheet
		im_items[li_i].Text = as_display
		im_items[li_i].Visible = True
		Exit
	End If
Next

li_i++
For li_j = li_i to li_max
	im_items[li_j].Visible = False
Next

Return 1
end function

public function integer of_registersheet (readonly string as_sheet, readonly string as_display);//*-----------------------------------------------------------------*/
//*    of_RegisterSheet:  Add a new sheet to the sheet array
//*-----------------------------------------------------------------*/
long ll_s, ll_sheets

/*  These references to the mdi sheets provide the ability to
      build an executable that includes these objects.   Without
	 these references, these objects ( previously referenced only
	 in strings ) would not otherwise be included.
	 If you choose to use a PBR file or dynamic libraries, these
	 references can be removed  */
w_demoazure_sheet1	lw_sheet1
w_demoazure_sheet2	lw_sheet2
w_demoazure_sheet3	lw_sheet3

ll_sheets = UpperBound ( is_sheets ) 

/*  Make sure sheet is not already registered  */
For ll_s = 1 to ll_sheets
	If Lower ( as_sheet ) = is_sheets[ll_s] Then Return -1
Next

is_sheets[ll_sheets+1] = Lower ( as_sheet )
is_display[ll_sheets+1] = as_display

of_AddToMenu ( as_sheet, as_display )

Return 1
end function

on n_demoazure_sheetmanager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_demoazure_sheetmanager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

