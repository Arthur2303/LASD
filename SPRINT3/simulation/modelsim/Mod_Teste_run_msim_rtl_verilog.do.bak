transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3 {C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3/LCD_TEST2.v}
vlog -vlog01compat -work work +incdir+C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3 {C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3/LCD_Controller.v}
vlog -sv -work work +incdir+C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3 {C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3/RegisterFile.sv}
vlog -sv -work work +incdir+C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3 {C:/Users/arthu/OneDrive/Documentos/Graduação/P6/LASD/SPRINT3/Mod_Teste.sv}

