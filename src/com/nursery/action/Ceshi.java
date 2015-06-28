package com.nursery.action;

import java.io.IOException;
import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nursery.util.CardOperation;

@Scope("prototype")
@Controller
public class Ceshi extends DefaultAction{
	//保存
		public static void main(String[] args) throws Exception{
				
			CardOperation.close_Machine();
				//this.currentCard.setUser(getUser());
				//this.currentCard.setSendDate(new Date());
				//生成股金帐号格式 为：年月日时分秒
				//String stockNumber = new DateUtil("yyyyMMddHHmmss").getFormatedDateString(new Date());
				//StringBuffer temp = new StringBuffer();
				//股金 账号： 分社编号 业务员（员工编号） 年月日时分秒
				//temp.append(getBranch().getId()).append(getEmployee().getId()).append(stockNumber);
				//currentCard.setStockNumber(temp.toString());
				//currentCard.setPassword(WebUtils.encrypt(currentCard.getPassword()));addCurrentStockUI
				
				//装载磁卡读写机的本地动态链接库
				try {
					System.loadLibrary("HCE300_API");
					//打开磁卡读写机
					cardWriteStatus= CardOperation.open_Machine(12);
					System.out.println(cardWriteStatus);
					//打开 磁卡读写机时出错
		            if(cardWriteStatus<0){
		            	System.out.println("打开 磁卡读写机时出错!");
						//this.sr.setMessage(branchBrushStockCard(cardWriteStatus));
						//cardWriteStatus = CardOperation.close_Machine();
						//return this.SUCCESS;
					}
					//磁道，内容 
		            do{
		            	cardWriteStatus =CardOperation.write_Machine(2, "123456");
		            	System.out.println(cardWriteStatus);
		            }while(cardWriteStatus == -1);
		            //定数据库时出错
		            if(cardWriteStatus<0){
		            	System.out.println("定数据库时出错!");
						//this.sr.setMessage(branchBrushStockCard(cardWriteStatus));
						//return this.SUCCESS;
					}
					//关闭磁卡读写机
					CardOperation.close_Machine();
					//关闭磁卡机出错
					if(cardWriteStatus<0){
						System.out.println("关闭磁卡机出错!");
						//this.sr.setMessage(branchBrushStockCard(cardWriteStatus));
						//return this.SUCCESS;
					}
		        } catch (UnsatisfiedLinkError e) { 
		        	e.printStackTrace();
		        	//异常
		        	if(cardWriteStatus<0){
		        		System.out.println("异常");
						/*this.sr.setMessage(branchBrushStockCard(cardWriteStatus));
						return this.SUCCESS;*/
					}
		        }
				/*this.currentStockService.addCurrentCard(currentCard);
				this.session.put("curentCard", currentCard);
				this.sr.setCallbackType("forward");
				this.sr.setForwardUrl("currentStock_printCurrentCardUI");
				
				return this.SUCCESS;*/
	    }  
		
		/*try{
				if(accountService.checkUserName(account.getUsername())){
					Account accdata = accountService.getAccountById(account.getId());
					accdata.setUsername(account.getUsername());
					accdata.setPassword(account.getPassword());
					accdata.setPower(1);
					adminService.update(accdata);
					jsonBack(SUCCESS);
				}else{
					jsonBack(ERROR_2);
				}
				
			}catch(Exception e){
				System.out.println(e);
				e.printStackTrace();
				jsonBack(ERROR_1);
			}
			
		}*/
		//股金 证
		private static String stockNumber;
		//磁卡写入状态
		private static int cardWriteStatus;
		public int getCardWriteStatus() {
			return cardWriteStatus;
		}
		public void setCardWriteStatus(int cardWriteStatus) {
			this.cardWriteStatus = cardWriteStatus;
		}
		public static String getStockNumber() {
			return stockNumber;
		}
		public static void setStockNumber(String stockNumber) {
			Ceshi.stockNumber = stockNumber;
		}
		
}
