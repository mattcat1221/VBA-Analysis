Sub stock_script():

    Dim ws As Worksheet
    
    For Each ws In ThisWorkbook.Worksheets

        ws.[I1] = "Ticker"
        ws.[J1] = "Yearly Change"
        ws.[K1] = "Percentage Change"
        ws.[L1] = "Total Stock Volume"
        ws.[O2] = "Greatest % Increase"
        ws.[O3] = "Greatest % Decrease"
        ws.[O4] = "Greatest Total Volume"
        ws.[P1] = "Ticker"
        ws.[Q1] = "Value"
        
        ws.Range("C:G").Columns.NumberFormat = "$#,###.##"
        ws.Range("L:L").Columns.NumberFormat = "$#,###.##"
        ws.Range("Q4").Columns.NumberFormat = "$#,###.##"
        
        ws.Range("Q2:Q3").Columns.NumberFormat = "##.##%"
        ws.Range("K:K").Columns.NumberFormat = "##.##%"

        si = 2 'Initiating summary index
        Total = 0
        open_value = 0
        greatest_inc = 0
        greatest_dec = 0
        greatest_total = 0
        lastRow = ws.Cells(Rows.Count, "A").End(xlUp).Row
        
        For i = 2 To lastRow
        
            Total = Total + ws.Cells(i, "G")
        
            If open_value = 0 Then
                open_value = ws.Cells(i, "C").Value
            End If
        
            'last row of the ticker'
            If ws.Cells(i, "A") <> ws.Cells(i + 1, "A") Then
                ws.Cells(si, "I") = ws.Cells(i, "A")
                
                yearlyCh = ws.Cells(i, "F") - open_value
                
                If yearlyCh > 0 Then
                    ws.Cells(si, "J").Interior.ColorIndex = 4
                Else
                    ws.Cells(si, "J").Interior.ColorIndex = 3
                End If
                
                ws.Cells(si, "J") = yearlyCh
                
               Percentage_ch = yearlyCh / open_value
                
                ws.Cells(si, "K") = Percentage_ch
                
                'total stock volume'
                ws.Cells(si, "L") = Total

                'greatest increase'
                If Percentage_ch > greatest_inc Then
                    greatest_inc = Percentage_ch
                    ws.Range("P2") = ws.Cells(i, "A")
                    ws.Range("Q2") = greatest_inc
                End If
                
                'greatest decrease'
                If Percentage_ch < greatest_dec Then
                    greatest_dec = Percentage_ch
                    ws.Range("P3") = ws.Cells(i, "A")
                    ws.Range("Q3") = greatest_dec
                End If
                
                'greatest total volume
                If Total > greatest_total Then
                    ws.Range("P4") = ws.Cells(i, "A")
                    greatest_total = Total
                    ws.Range("Q4") = Total
                
                End If
                
                'reset area
                si = si + 1
                open_value = 0
                
                Total = 0
            End If
        Next i
        
        ws.Range("A:Z").Columns.AutoFit
    Next ws

End Sub





