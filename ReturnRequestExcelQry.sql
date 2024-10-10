 Begin
	   select rrh_RequestNumber [Request Number], E.rot_Code [Route Code] ,E.rot_Name [Route],cus_Code [Customer Code],cus_Name [Customer],
	   case when rrh_ReturnType = 'GR' then 'Good Return' when rrh_ReturnType = 'BR' then 'Bad Return' end [Type],
	   format(R.CreatedDate,'dd-MMM-yyyy| HH:mm') [Created Date],prd_Code [Product Code],prd_Name[[Product],C.uom_Name [HUOM],L.uom_Name [LUOM],
	   rrd_HQty [HQty],rrd_Lqty [LQTY],rrd_HigherPrice [Higher Price],rrd_LowerPrice [Lower Price],rrd_LineTotal [Line Total], rrd_Vat [VAT],
	   rrd_GrandTotal [Grand Total]
	   
	   from  [tb_ReturnRequestDetail] A 
	   inner join tb_ReturnRequestHeader R on R.rrh_ID=A.rrd_rrh_ID
	   inner join tb_Customer D ON D. cus_ID = R.rrh_cus_ID
	  inner join tb_Products B ON B.prd_ID = A.rrd_prd_ID
	  left outer join [dbo].[tb_UOM] C ON C.uom_ID = A.rrd_HUOM
	  left outer join [dbo].[tb_UOM] L on L.uom_ID=A.rrd_LUOM
	  left outer join tb_Reason M on M.rsn_ID=A.ReasonCode
	  left outer join tb_Route E ON E.rot_ID = R.rrh_rot_ID

	  where  rrh_rot_ID in (rrh_rot_ID) and  (cast(A.CreatedDate as date) between cast('20240701' as date) and cast('20240731' as date)) 
	and isnull(A.Status,'P') in ('P', 'AT', 'A', 'R') 
	  end

