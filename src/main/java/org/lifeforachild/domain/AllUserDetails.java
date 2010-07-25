package org.lifeforachild.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class AllUserDetails extends User {

	long id;
	String firstName;
	String lastName;	
	String userGroup;
	int country;
	int centre;	
	
	public AllUserDetails(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked, Collection<GrantedAuthority> authorities,
			String firstName, String lastName, String userGroup, int county, int centre, long id) {
		super(username, password, enabled, accountNonExpired, 
				credentialsNonExpired, accountNonLocked, authorities);
		this.firstName = firstName;
		this.lastName = lastName;
		this.userGroup = userGroup;
		this.country = county;
		this.centre = centre;
		this.id = id;
	}

	public String getFirstName() {
		 
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getUserGroup() {
		return userGroup;
	}

	public int getCountry() {
		return country;
	}

	public int getCentre() {
		return centre;
	}
	
	public long getId()
	{
		return id;
	}

}