VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True

Sub stocks1():

Dim ticker As String
Dim ticker_close As Double
Dim ticker_open As Double
Dim price_change As Double
Dim total As LongLong
Dim p As Long
Dim vol As LongLong
Dim i As Long
Dim percent_change As Double

 'lastrow = ActiveSheet.Cells(ActiveSheet.Rows.Count, 1).End(xlUp).Row

total = 0
p = 2
ticker_open = Cells(2, 3).Value
percent_change = Cells(2, 10).Value

For i = 2 To 93000
    ticker = Cells(i, 1).Value
    vol = Cells(i, 7).Value
    
         
     If (Cells(i + 1, 1).Value <> ticker) Then
        total = total + vol
        
        'Took prof help from Monday(4/29) class...
        
        ticker_close = Cells(i, 6).Value
        price_change = ticker_close - ticker_open
        percent_change = price_change / ticker_open
        
        Cells(p, 9).Value = ticker
        Cells(p, 12).Value = total
        Cells(p, 10).Value = price_change
        Cells(p, 11).Value = percent_change
            
                     
        total = 0
        p = p + 1
        ticker_open = Cells(i + 1, 3).Value
    Else
        total = total + vol
        
    
    End If
Next i

End Sub
        
        
             
Sub stock_increase1():

Dim rng As Range
Dim highest, Valuetemp  As Double
Dim lowest As Double
Dim total_vol, Valuetemp1 As LongLong
Dim i As Long
Dim HighestTicker, LowestTicker, HighestVolticker As String



Set rng = Range("K2:K1500")
Set rang = Range("L2:L1500")

'Took Xpert learning Assistance help.....

highest = Application.WorksheetFunction.Max(rng)
lowest = Application.WorksheetFunction.Min(rng)
total_vol = Application.WorksheetFunction.Max(rang)
    
     Cells(2, 16).Value = highest
     Cells(3, 16).Value = lowest
     Cells(4, 16).Value = total_vol
     
   'Took help from class room excercises.....
   
For i = 2 To 1500
    
    Valuetemp = Cells(i, 11).Value
    Valuetemp1 = Cells(i, 12).Value
    
         
     If (Valuetemp >= highest) Then
        HighestTicker = Cells(i, 9).Value
     End If
        
     If (Valuetemp <= lowest) Then
    LowestTicker = Cells(i, 9).Value
     End If
     
     If (Valuetemp1 >= total_vol) Then
        HighestVolticker = Cells(i, 9).Value
     End If
        
       
Next i

Cells(2, 15).Value = HighestTicker
Cells(3, 15).Value = LowestTicker
Cells(4, 15).Value = HighestVolticker
    
End Sub
     
    
    





