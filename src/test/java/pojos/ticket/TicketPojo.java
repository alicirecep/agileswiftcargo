package pojos.ticket;

import java.io.Serializable;

public class TicketPojo implements Serializable {
	private int id;
	private int userId;
	private int departmentId;
	private String service;
	private String priority;
	private String subject;
	private String description;
	private String date;
	private Object attachedFile;
	private int status;
	private String createdAt;
	private String updatedAt;

	public void setId(int id){
		this.id = id;
	}

	public int getId(){
		return id;
	}

	public void setUserId(int userId){
		this.userId = userId;
	}

	public int getUserId(){
		return userId;
	}

	public void setDepartmentId(int departmentId){
		this.departmentId = departmentId;
	}

	public int getDepartmentId(){
		return departmentId;
	}

	public void setService(String service){
		this.service = service;
	}

	public String getService(){
		return service;
	}

	public void setPriority(String priority){
		this.priority = priority;
	}

	public String getPriority(){
		return priority;
	}

	public void setSubject(String subject){
		this.subject = subject;
	}

	public String getSubject(){
		return subject;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return description;
	}

	public void setDate(String date){
		this.date = date;
	}

	public String getDate(){
		return date;
	}

	public void setAttachedFile(Object attachedFile){
		this.attachedFile = attachedFile;
	}

	public Object getAttachedFile(){
		return attachedFile;
	}

	public void setStatus(int status){
		this.status = status;
	}

	public int getStatus(){
		return status;
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
			"TicketPojo{" + 
			"id = '" + id + '\'' + 
			",user_id = '" + userId + '\'' + 
			",department_id = '" + departmentId + '\'' + 
			",service = '" + service + '\'' + 
			",priority = '" + priority + '\'' + 
			",subject = '" + subject + '\'' + 
			",description = '" + description + '\'' + 
			",date = '" + date + '\'' + 
			",attached_file = '" + attachedFile + '\'' + 
			",status = '" + status + '\'' + 
			",created_at = '" + createdAt + '\'' + 
			",updated_at = '" + updatedAt + '\'' + 
			"}";
		}

	public TicketPojo() {
	}

	public TicketPojo(int id, int userId, int departmentId, String service, String priority, String subject, String description, String date, Object attachedFile, int status, String createdAt, String updatedAt) {
		this.id = id;
		this.userId = userId;
		this.departmentId = departmentId;
		this.service = service;
		this.priority = priority;
		this.subject = subject;
		this.description = description;
		this.date = date;
		this.attachedFile = attachedFile;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
}