
self = {
    tab = {},
    window = {},
    tabpanel = {},
    gridlist = {}
}



	

        self.window[1] = guiCreateWindow(434, 125, 393, 770, "Oscuri Roleplay İnterior İd", false)
        guiWindowSetSizable(self.window[1], false)
		guiSetVisible(self.window[1], false)

        self.tabpanel[1] = guiCreateTabPanel(9, 24, 374, 700, false, self.window[1])
		test = guiCreateLabel  ( 0.02,0.96,0.94,0.92, "Arayüzü kapatmak için tekrardan /interiors yazabilirsin.", true, self.window[1])
		guiLabelSetHorizontalAlign(test,"center")
        self.tab[1] = guiCreateTab("İşlemler", self.tabpanel[1])
        self.tab[2] = guiCreateTab("Diğer", self.tabpanel[1])
		guiSetEnabled(self.tab[2], false)

        self.gridlist[1] = guiCreateGridList(8, 8, 356, 650, false, self.tab[1])

        guiGridListAddColumn(self.gridlist[1], "İnteriorlar", 0.9)
        for i = 1, 30 do
            guiGridListAddRow(self.gridlist[1])
        end
        guiGridListSetItemText(self.gridlist[1], 0, 1, "", false, false)
        guiGridListSetItemText(self.gridlist[1], 1, 1, "İd 75 : Güzel 2 Katlı Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 2, 1, "İd 76 : Sade Tek Katlı Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 3, 1, "İd 78 : Tek Katlı Güzel Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 4, 1, "İd 80 : 2 Katlı Lüks Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 5, 1, "İd 81 : Tek Katlı Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 6, 1, "İd 84 : Devasa Malikane", false, false)
        guiGridListSetItemText(self.gridlist[1], 7, 1, "İd 85 : Yatak Odası", false, false)
        guiGridListSetItemText(self.gridlist[1], 8, 1, "İd 86 : Cj Evi", false, false)
        guiGridListSetItemText(self.gridlist[1], 9, 1, "İd 88 : Normal Ev ", false, false)
        guiGridListSetItemText(self.gridlist[1], 10, 1, "İd 90 : Minik Pavyon", false, false)
        guiGridListSetItemText(self.gridlist[1], 11, 1, "İd 91 : Cj Evi 2", false, false)
        guiGridListSetItemText(self.gridlist[1], 12, 1, "İd 92 : 2 Katlı Lüks Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 13, 1, "İd 93 : 2 Katlı Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 14, 1, "İd 94 : Tek Katlı Hoj Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 15, 1, "İd 95 : 2 Katlı Lüks Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 16, 1, "İd 96 : 2 Katlı Lüks Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 17, 1, "İd 97 : 2 Katlı Lüks Ev", false, false)
        guiGridListSetItemText(self.gridlist[1], 18, 1, "İd 98 : Tek Katlı Ev.", false, false)
        guiGridListSetItemText(self.gridlist[1], 19, 1, "İd 99 : İşkence Odası", false, false)
       guiGridListSetItemText(self.gridlist[1], 20, 1, "İd 100 : Tek Katlı Normal Ev", false, false)
       guiGridListSetItemText(self.gridlist[1], 21, 1, "İd 112 : Karavan" false, false)
       guiGridListSetItemText(self.gridlist[1], 22, 1, "İd 9: Garaj", false, false)
       guiGridListSetItemText(self.gridlist[1], 23, 1, "İd 10 : Garaj", false, false)
      guiGridListSetItemText(self.gridlist[1], 24, 1, "İd 163: Garaj", false, false)
      guiGridListSetItemText(self.gridlist[1], 25, 1, "İd 147 : Garaj", false, false)
       guiGridListSetItemText(self.gridlist[1], 26, 1, "İd 156 : Garaj", false, false)
      guiGridListSetItemText(self.gridlist[1], 27, 1, "İd 165: Ofis", false, false)
      guiGridListSetItemText(self.gridlist[1], 28, 1, "İd 159 : Galeri", false, false)
      guiGridListSetItemText(self.gridlist[1], 29, 1, "İd 158 : Depo", false, false)

		exports.orp_global:centerWindow(self.window[1])

addCommandHandler("interiors", function()
			guiSetVisible(self.window[1], not guiGetVisible(self.window[1]))
			showCursor(guiGetVisible(self.window[1]))
	if guiGetVisible(self.window[1]) then
			guiSetInputMode("no_binds_when_editing")
		end	

end)