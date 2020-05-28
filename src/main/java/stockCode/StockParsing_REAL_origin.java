package stockCode;
//package stockCode;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//
//import com.bitcamp.project.vo.Info;
//
//public class StockParsing_REAL {
//	public Info parse(String code) {
////	public static void main(String[] args) {
//		
//		//long beforeTime = System.currentTimeMillis(); //코드 실행 전에 시간 받아오기
//
//	
//		
//		Map<String, Info> info = new HashMap<String, Info>();
//		String stockName = null;		// 종목명
//		String currentPrice = null;		// 현재가
//		String before = null;			// 전일비
//		String upDown = null;			// 상승률
//		String maximum = null;			// 상한가
//		String minimum = null; 			// 하한가
//		int[] priceList = new int[20];  // 호가 +-
//		int[] up = new int[10];   // 호가 +
//		int[] down = new int[10]; // 호가 -
//		
//		try {
//			String url = "https://finance.naver.com/item/main.nhn?code=" + code;
////			String url = "https://finance.naver.com/item/main.nhn?code=" + "005930";
//			Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
//			doc = Jsoup.connect(url).get();
//			Elements viewLists = doc.select("#middle");
//			
//			String kospidaq_ = doc.select(".description").html();
//			boolean kospidaq = kospidaq_.contains("alt=\"코스피\"");
//			
//			
//
//			for (Element viewList : viewLists) {
//				stockName = viewList.selectFirst("strong").text();
//				String currentPrice_ = viewList.select(".no_today").text();
//				String before_ = viewList.select(".no_exday").text();
//				maximum = viewList.select(".no_info tbody tr .no_cha .blind").text();
//				minimum = viewList.select(".no_info tbody tr:nth-child(2) .no_cha").text();
//				String up_c = viewList.select("#tab_con2 .f_down").text();
//				String down_c = viewList.select("#tab_con2 .f_up").text();
//				
//			////////////////////////////////////////
////				System.out.println(maximum);
////				System.out.println(minimum);
//			////////////////////////////////////////
//				
//				
//				
//
//				// 
//				String[] bFUD = before_.split(" ");
//				String[] cPrice = currentPrice_.split(" ");String[] up_ = up_c.split(" ");
//				String[] down_ = down_c.split(" ");
//				
//				
//				
//				currentPrice = cPrice[0].replace(",", "");
//				System.out.println("1 "+currentPrice);
////				currentPrice = cPrice[0].replace(",", "");
//				
//				
//				upDown = bFUD[6] + "%";
//				
//				if(bFUD[1].equals("상승")) {
//
//					before = "+" + bFUD[2];
//				}
//				else if(bFUD[1].equals("하락")) {
//					before = "-" + bFUD[2];
//				}
//				else if(bFUD[1].equals("보합")) {
//					before = bFUD[2];
//					upDown = bFUD[5] + "%";
//				}
//				
//				System.out.println(Arrays.toString(up_));
//				
//				
//				int kospiTable[] = new int[10000];
//				int kosdaqTable[] = new int[10000];
//
//				int k=1;
//				int j=1;
//				for (int i = 0; i < 10000; i++) {
//					kospiTable[i] = k;
//					kosdaqTable[i] = j;
//					if(k<1000) {
//						k++;
//						j++;
//					}
//					else if(k<5000){
//						k+=5;
//						j+=5;
//					}
//					else if(k<10000){
//						k+=10;
//						j+=10;
//					}
//					else if(k<50000){
//						k+=50;
//						j+=50;
//					}
//					else if(k<100000){
//						k+=100;
//						j+=100;
//					}
//					else if(k<500000){
//						k+=500;
//						j+=100;
//					}
//					else {
//						k+=1000;
//						j+=100;
//					}
//				}
//				
//				for (int i = 0; i < kospiTable.length; i++) {
//					if(currentPrice.equals(kosdaqTable[i])) {
//						k = i;
//						
//						break;
//						
//					}
//				}
//				
//				
//				int front = k + 10;
//				int back  = k - 10;
//				int l = 0;
//				
//				for (int i = 0; i < 20; i++) {
//					
//					if(back > front) {
//						break;
//					}
//					if(currentPrice.equals(kospiTable[back])) {
//						System.out.println(currentPrice);
//						back++;
//						i--;
//						continue;
//					}
//					if(back < k) {
//						up[i] = kospiTable[back];
//						back++;
//					}
//					else {
//						down[l] = kospiTable[back];
//						back++;
//						l++;
//					}
//				}
//				
//				System.out.println(Arrays.toString(up));
//				System.out.println(Arrays.toString(down));
//				
//				
//				
////				// 호가 파싱
////				int n = 0;
////				int n1 = 5;
////					for (int i = 0; i < up_.length; i++) {
////						
////						if(i % 2 != 0) {
////							up[n] = up_[i];
////							n++;
////						}
//////						if(i % 2 == 0) {
//////							down[n] = down_[i];
////////							n1--;
//////						}
////				}
//				
////				System.out.println(Arrays.toString(up));
////				System.out.println(Arrays.toString(down));
//				
//				
//			}
//			
//			Info inf = new Info();
//			inf.setStockName(stockName);
//			inf.setCurrentPrice(currentPrice);
//			inf.setBefore(before);
//			inf.setUpDown(upDown);
//			inf.setMaximum(maximum);
//			inf.setMinimum(minimum);
//			inf.setUp(up);
//			inf.setDown(down);
//
////			System.out.println(inf);
////			long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
////			long secDiffTime = (afterTime - beforeTime)/1000; //두 시간에 차 계산
////			System.out.println("시간차이(m) : "+secDiffTime);
//			
//			return inf;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		 return null;
//	}
//}