package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Iterator;

import userbean.Userbean;

public class RegistrationDao {

	public static void insert(Userbean user) {

		try {
			String username=user.getUsername();
			String email=user.getEmail();
			String webmail=user.getWebmail();
			
			
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt1 =conn.prepareStatement("select * from registrationtable");
			ResultSet rs = pstmt1.executeQuery();
			HashSet<String> hs = new HashSet<>();
			while (rs.next()) {
				hs.add(rs.getString("username"));
			}
			if(hs.contains(username)) {
				user.setValid(false);
			}else {
				user.setValid(true);
				PreparedStatement pstmt2 =conn.prepareStatement("select * from registrationtable");
				ResultSet rs1 = pstmt2.executeQuery();
				HashSet<String> hs1= new HashSet<>();
				while(rs1.next())
				{
					hs1.add(rs1.getString("email"));
				}
				/*Iterator<String> itr=hs1.iterator();  
				  while(itr.hasNext()){  
				   System.out.println(itr.next()); */
			if(hs1.contains(email)) 
			{
				user.setValid1(false);
			}else {
				user.setValid1(true);
				PreparedStatement pstmt3 =conn.prepareStatement("select * from registrationtable");
				ResultSet rs2 = pstmt3.executeQuery();
				HashSet<String> hs2= new HashSet<>();
				while(rs2.next())
				{
					hs2.add(rs2.getString("webmail"));
				}
				
			if(hs2.contains(webmail)) 
			{
				user.setValid2(false);
			}else {
				user.setValid2(true);
				PreparedStatement pstmt = conn.prepareStatement("insert into registrationtable(name,empid,domain,username,password,confirmpassword,email,webmail,mobile,designation,photo) values(?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getEmpid());
				pstmt.setString(3,user.getDomain());
				pstmt.setString(4,user.getUsername());
				pstmt.setString(5,user.getPassword());
				pstmt.setString(6,user.getConfirmpassword());
				pstmt.setString(7,user.getEmail());
				pstmt.setString(8,user.getWebmail());
				pstmt.setLong(9,user.getMobile());
				pstmt.setString(10,user.getDesignation());
				pstmt.setString(11, user.getPhoto());
				int i =pstmt.executeUpdate();
				if(i==1)
				{
					System.out.println("success");
					user.setValid2(true);
			


				}
				else
				{
					System.out.println("not success");
					user.setValid2(false);
				}
			}
			}
		
		} }catch (Exception e) {
			e.printStackTrace();
		}



	}

}
