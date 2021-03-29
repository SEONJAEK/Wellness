package com.project.wellness.program.vo;

public class ProgramVO {

	private String programId;
	private String programTime;
	private String programName;
	private String userId;
	
	public ProgramVO() {}
	
	public ProgramVO(String programId, String programTime, String programName, String userId) {
		this.programId = programId;
		this.programTime = programTime;
		this.programName = programName;
		this.userId = userId;
	}

	public String getProgramId() {
		return programId;
	}

	public void setProgramId(String programId) {
		this.programId = programId;
	}

	public String getProgramTime() {
		return programTime;
	}

	public void setProgramTime(String programTime) {
		this.programTime = programTime;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}