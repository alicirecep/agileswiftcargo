package pojos.shop;

import java.io.Serializable;

public class ShopPojo implements Serializable {
	private int id;
	private int merchantId;
	private String name;
	private String contactNo;
	private String address;
	private int status;
	private int defaultShop;
	private String createdAt;
	private String updatedAt;

	public void setId(int id){
		this.id = id;
	}

	public int getId(){
		return id;
	}

	public void setMerchantId(int merchantId){
		this.merchantId = merchantId;
	}

	public int getMerchantId(){
		return merchantId;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setContactNo(String contactNo){
		this.contactNo = contactNo;
	}

	public String getContactNo(){
		return contactNo;
	}

	public void setAddress(String address){
		this.address = address;
	}

	public String getAddress(){
		return address;
	}

	public void setStatus(int status){
		this.status = status;
	}

	public int getStatus(){
		return status;
	}

	public void setDefaultShop(int defaultShop){
		this.defaultShop = defaultShop;
	}

	public int getDefaultShop(){
		return defaultShop;
	}

	public void setCreatedAt(String createdAt){
		this.createdAt = createdAt;
	}

	public String getCreatedAt(){
		return createdAt;
	}

	public void setUpdatedAt(String updatedAt){
		this.updatedAt = updatedAt;
	}

	public String getUpdatedAt(){
		return updatedAt;
	}

	@Override
 	public String toString(){
		return 
			"ShopPojo{" + 
			"id = '" + id + '\'' + 
			",merchant_id = '" + merchantId + '\'' + 
			",name = '" + name + '\'' + 
			",contact_no = '" + contactNo + '\'' + 
			",address = '" + address + '\'' + 
			",status = '" + status + '\'' + 
			",default_shop = '" + defaultShop + '\'' + 
			",created_at = '" + createdAt + '\'' + 
			",updated_at = '" + updatedAt + '\'' + 
			"}";
		}

	public ShopPojo() {
	}

	public ShopPojo(int id, int merchantId, String name, String contactNo, String address, int status, int defaultShop, String createdAt, String updatedAt) {
		this.id = id;
		this.merchantId = merchantId;
		this.name = name;
		this.contactNo = contactNo;
		this.address = address;
		this.status = status;
		this.defaultShop = defaultShop;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
}