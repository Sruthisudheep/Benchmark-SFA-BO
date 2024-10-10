using Newtonsoft.Json;
using QuestPDF.Elements.Table;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using SalesForceAutomation.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Web.ModelBinding;

namespace SalesForceAutomation
{
	public class RouteSummaryController : ApiController
	{
		GeneralFunctions objFunc = new GeneralFunctions();
		RouteInfo route = new RouteInfo();
		UpdInfo ui = new UpdInfo();

		[HttpPost]
		public SummaryResponse Generate(UpdInfo udp)
		{
			SummaryResponse sp = new SummaryResponse();
			string response = "Success";
			try
			{
				ui = udp;
				DataTable dt = objFunc.loadList("SelRouteInfo", "sp_CashRouteReport", udp.udpID);
				foreach(DataRow dr in dt.Rows)
				{
					route.Date = dr["CreatedOn"].ToString();
					route.RouteCode = dr["rot_Code"].ToString();
					route.RouteName = dr["usr_Name"].ToString();
					route.ArabicRouteName = dr["usr_ArabicName"].ToString();
				}

				QuestPDF.Settings.License = LicenseType.Community;
				var doc = Document.Create(container => container.Page(page =>
				{
					page.Size(PageSizes.A4);
					page.Margin(float.Parse("0.52"), Unit.Centimetre);
					page.DefaultTextStyle(x => x.FontSize(12));
					page.Header().Element(ComposeHeader );
					page.Content().Element(ComposeContent);
					page.Footer().Element(ComposeFooter);

				}));

				
				string fileInfoPaths = "API/Files/Downloads/";

				string logFolderPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, fileInfoPaths);
				doc.GeneratePdf(logFolderPath + udp.udpID +  ".pdf");

				sp.messageCode = "200";
				sp.Message = "Success";
				sp.OutPutURL ="../../"+ fileInfoPaths + udp.udpID+".pdf";
				

			}
			catch (Exception ex)
			{
				sp.messageCode = "500";
				sp.Message = ex.Message.ToString();
				UICommon.LogException(ex, "UDP-Detail-RouteSummary");
				String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
				objFunc.LogMessageToFile(UICommon.GetLogFileName(), "UDP-Detail-RouteSummary", "Error : " + ex.Message.ToString() + " - " + innerMessage);


			}


			return sp ;
		}

		public class UpdInfo
		{
			public string udpID { get; set; }
		}

		public class RouteInfo
		{
			public string RouteCode { get; set; }
			public string RouteName { get; set; }
			public string ArabicRouteName { get; set; }
			public string Date { get; set; }
		}

		public class SummaryResponse
		{
			public string messageCode { get; set; }
			public string Message { get; set; }
			public string OutPutURL { get; set; }
		}

		void ComposeHeader(IContainer container  )
		{

			var titleStyle = TextStyle.Default.FontSize(20).SemiBold().FontColor(Colors.Blue.Medium);

			container.Column(column =>
			{
				column.Item().PaddingTop(3).PaddingLeft(12).PaddingRight(12).Element(CompanyInfo);
				column.Item().PaddingTop(-20).PaddingLeft(12).PaddingRight(12).PaddingBottom(10).Element(DateInfo);
				column.Item().Border(1).PaddingLeft(12).PaddingRight(12).PaddingTop(3).PaddingBottom(3).PaddingVertical(2).Element(DelegateInfo);
			});
		}

		void ComposeContent(IContainer container)
		{
			var titleStyle = TextStyle.Default.FontSize(20).SemiBold().FontColor(Colors.Blue.Medium);

			container.Column(column =>
			{
				column.Item().PaddingVertical(5).Element(TableInfo);

				column.Item().ShowOnce().PaddingVertical(5).Element(SummaryInfo);
			});
		}



		void TableInfo(IContainer container)
		{
			container
		.MinimalBox()
		.Table(table =>
		{
			IContainer DefaultCellStyle(IContainer cntr, string backgroundColor)
			{
				return cntr
					.AlignCenter()
					.AlignMiddle();

			}


			table.ColumnsDefinition(columns =>
			{

				columns.ConstantColumn(65);
				columns.ConstantColumn(65);
				columns.ConstantColumn(50);
				columns.ConstantColumn(50);
				columns.ConstantColumn(140);
				columns.ConstantColumn(140);
				columns.ConstantColumn(55);
			});

			table.Header(header =>
			{
				// please be sure to call the 'header' handler!

				header.Cell().BorderBottom(1).BorderTop(1).BorderLeft(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("المبلغ النهائية").Fallback().FontFamily(Fonts.Arial).FontSize(10);
					txt.EmptyLine();
					txt.Span("Final Amount").FontSize(8).FontFamily(Fonts.Arial);
				});
				header.Cell().BorderBottom(1).BorderTop(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("الكمية النهائية").Fallback().FontFamily(Fonts.Arial).FontSize(10);
					txt.EmptyLine();
					txt.Span("Final Quantity").FontSize(8).FontFamily(Fonts.Arial);
				});
				header.Cell().BorderBottom(1).BorderTop(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("السعر").Fallback().FontFamily(Fonts.Arial).FontSize(10);
					txt.EmptyLine();
					txt.Span("Price").FontSize(8).FontFamily(Fonts.Arial);
				});
				header.Cell().BorderBottom(1).BorderTop(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("الوحدة").Fallback().FontFamily(Fonts.Arial).FontSize(10);
					txt.EmptyLine();
					txt.Span("Unit").FontSize(8).FontFamily(Fonts.Arial);
				});
				header.Cell().BorderBottom(1).BorderTop(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("Product Name").Fallback().FontFamily(Fonts.Arial).FontSize(10);
				});
				header.Cell().BorderBottom(1).BorderTop(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("إسم الصنف").Fallback().FontFamily(Fonts.Arial).FontSize(10);
				});
				header.Cell().BorderBottom(1).BorderTop(1).BorderRight(1).Element(CellStyle).Padding(2).AlignCenter().Text(txt =>
				{
					txt.Span("كود الصنف").Fallback().FontFamily(Fonts.Arial).FontSize(10);
					txt.EmptyLine();
					txt.Span("Product Code").FontSize(8).FontFamily(Fonts.Arial);
				});

				// you can extend existing styles by creating additional methods
				IContainer CellStyle(IContainer cntr) => DefaultCellStyle(cntr, Colors.Grey.Lighten3);

			});

			TableDetails(table);
			
		});

		}


		void SummaryInfo(IContainer container)
		{
			container
				.MinimalBox().PaddingHorizontal(50).PaddingVertical(50)
				.Table(table =>
				{
					table.ColumnsDefinition(columns =>
					{
						columns.ConstantColumn(80);
						columns.ConstantColumn(80);
						columns.ConstantColumn(80);
						columns.ConstantColumn(80);
						columns.ConstantColumn(80);
					});

					

					SummaryDetails(table);



				});
		}


		void ComposeFooter(IContainer container)
		{
			container.PaddingTop(0).Border(float.Parse("0.5")).Row(row =>
			{
				
				row.RelativeItem().Padding(10).AlignRight().AlignBottom().Text(txt =>
				{
					txt.Span("Pages: ").FontSize(9);
					txt.CurrentPageNumber().FontSize(9);
					txt.Span("/").FontSize(9);
					txt.TotalPages().FontSize(9);
				});
			});
		}

		void SummaryDetails(TableDescriptor table)
		{


			table.Cell().Border(1).AlignCenter().Text(txt =>
			{
				txt.Span(" الصافي").FontSize(12).Fallback().FontFamily(Fonts.Arial).FontSize(10);
				txt.EmptyLine();
				txt.Span("Net Total").FontSize(12).FontFamily(Fonts.Arial);
			});
			table.Cell().Border(1).AlignCenter().Text(txt =>
			{
				txt.Span("مجموع المرتجع").FontSize(12).Fallback().FontFamily(Fonts.Arial).FontSize(10);
				txt.EmptyLine();
				txt.Span("Total Returned").FontSize(12).FontFamily(Fonts.Arial);
			});
			table.Cell().Border(1).AlignCenter().Text(txt =>
			{
				txt.Span("مجموع المجاني").FontSize(12).Fallback().FontFamily(Fonts.Arial).FontSize(10);
				txt.EmptyLine();
				txt.Span("Total Free").FontSize(12).FontFamily(Fonts.Arial);
			});
			table.Cell().Border(1).AlignCenter().Text(txt =>
			{
				txt.Span("مجموع البيع").FontSize(12).Fallback().FontFamily(Fonts.Arial).FontSize(10);
				txt.EmptyLine();
				txt.Span("Sale Total").FontSize(12).FontFamily(Fonts.Arial);
			});
			table.Cell().RowSpan(2).Border(1).AlignCenter().Text(txt =>
			{
				txt.Span("الملخص").FontSize(12).Fallback().FontFamily(Fonts.Arial).FontSize(10);
				txt.EmptyLine();
				txt.Span("Summary").FontSize(12).FontFamily(Fonts.Arial);
			});

			System.Data.DataTable dt = objFunc.loadList("SelSummary", "sp_CashRouteReport", ui.udpID.ToString());
			foreach (DataRow dr in dt.Rows)
			{

				table.Cell().Border(float.Parse("1")).AlignCenter().Text(txt => { txt.Span(dr["NetTotal"].ToString()).FontColor("#007bff").Bold().LineHeight(2).FontSize(10).FontFamily(Fonts.Arial); });

				table.Cell().Border(float.Parse("1")).AlignCenter().Text(txt => { txt.Span(dr["ReturnAmount"].ToString()).FontColor("#a73d51").Bold().LineHeight(2).FontSize(10).FontFamily(Fonts.Arial); });

				table.Cell().Border(float.Parse("1")).AlignCenter().Text(txt => { txt.Span(dr["FreeGoodAmount"].ToString()).FontColor("#51a651").Bold().LineHeight(2).FontSize(10).FontFamily(Fonts.Arial); });

				table.Cell().Border(float.Parse("1")).AlignCenter().Text(txt => { txt.Span(dr["TotalSales"].ToString()).FontSize(10).LineHeight(2).Bold().FontFamily(Fonts.Arial); });

			}
		}


		void TableDetails(TableDescriptor table)
		{
			System.Data.DataTable dt = objFunc.loadList("SelItemSummary", "sp_CashRouteReport", ui.udpID.ToString());
			foreach (DataRow dr in dt.Rows)
			{
				
				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["inv_GrandTotal"].ToString()).LineHeight(2).FontSize(8).FontFamily(Fonts.Arial); });

				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["Hqty"].ToString()).LineHeight(2).FontSize(8).FontFamily(Fonts.Arial); });

				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["ind_HigherPrice"].ToString()).LineHeight(2).FontSize(8).FontFamily(Fonts.Arial); });

				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["HUOM"].ToString()).FontSize(8).LineHeight(2).FontFamily(Fonts.Arial); });

				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["prd_Name"].ToString()).LineHeight(2).FontSize(8).FontFamily(Fonts.Arial); });

				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["prd_NameArabic"].ToString()).LineHeight(2).FontSize(8).FontFamily(Fonts.Arial); });

				table.Cell().Padding(5).BorderBottom(float.Parse(".5")).AlignCenter().Text(txt => { txt.Span(dr["prd_Code"].ToString()).LineHeight(2).FontSize(8).FontFamily(Fonts.Arial); });
			}
		}

		void DelegateInfo(IContainer container)
		{

			container.Column(column =>
			{
				column.Item().Row(row =>
				{
					row.ConstantItem(200).AlignLeft().Text(txt =>
					{
						txt.Span("Delegate Code: ").FontSize(10).Fallback().FontFamily(Fonts.Arial);
						txt.Span(route.RouteCode).FontSize(10).Fallback().FontFamily(Fonts.Arial);
					});
					row.RelativeItem().ContentFromRightToLeft().AlignRight().Text(txt =>
					{
						txt.Span("كود المندوب : ").FontSize(13).Fallback().FontFamily(Fonts.Arial);
						txt.Span(route.RouteCode).FontSize(10).Fallback().FontFamily(Fonts.Arial);
					});
				});

				column.Item().Row(row =>
				{
					row.ConstantItem(200).AlignLeft().Text(txt =>
					{
						txt.Span("Delegate Name: ").FontSize(10).Fallback().FontFamily(Fonts.Arial);
						txt.Span(route.RouteName).FontSize(10).Fallback().FontFamily(Fonts.Arial);
					});
					
					row.RelativeItem().ContentFromRightToLeft().AlignRight().Text(txt =>
					{
						txt.Span("إسم المندوب : ").FontSize(13).Fallback().FontFamily(Fonts.Arial);
						txt.Span(route.ArabicRouteName).FontSize(10).Fallback().FontFamily(Fonts.Arial);
					});
				});
			});
		}

		void CompanyInfo(IContainer container )
		{
			string logoPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "API\\Files\\Logos\\");
			container.Row(row =>
			{
				row.RelativeItem().PaddingBottom(0).Column(column =>
				{
					column.Item().Text(txt =>
					{
						txt.Span("Sales Invoice for the Representative").Bold().FontSize(16).FontFamily(Fonts.Arial);
						txt.EmptyLine();
					});
				});

				row.ConstantItem(100).PaddingBottom(0).AlignRight().Column(column =>
				{
					column.Item().Width(100).PaddingTop(-8).Image(logoPath + "logo.png");
				});

				row.RelativeItem().PaddingBottom(0).AlignRight().Column(column =>
				{
					column.Item().ContentFromRightToLeft().Text(txt =>
					{
						txt.Span("فاتورة البيع للمندوب").Bold().FontSize(20).Fallback().FontFamily(Fonts.Arial);
						txt.EmptyLine();
					});
				});
			});
		}

		void DateInfo(IContainer container)
		{
			string logoPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "API\\Files\\Logos\\");
			container.Row(row =>
			{
				row.RelativeItem().Column(column =>
				{
					column.Item().Text(txt =>
					{
						txt.Span("Date: ").FontSize(10).Fallback().FontFamily(Fonts.Arial);
						txt.Span(route.Date).FontSize(10).Fallback().FontFamily(Fonts.Arial);
					});
				});

			

				row.RelativeItem().AlignRight().Column(column =>
				{
					column.Item().ContentFromRightToLeft().Text(txt =>
					{
						
						txt.Span("التاريخ: ").FontSize(13).Fallback().FontFamily(Fonts.Arial);
						txt.Span(route.Date).FontSize(10).Fallback().FontFamily(Fonts.Arial);
					});
				});

			});
		}

	}
}