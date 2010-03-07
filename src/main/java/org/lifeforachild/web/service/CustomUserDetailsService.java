package org.lifeforachild.web.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.lifeforachild.domain.AllUserDetails;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService{

	private BasicDataSource  dataSource;

	private static String USER_BY_USERNAME_QUERY = "select * from User where username = ?";
	private static String GROUP_AUTHORITIES_BY_USERNAME_QUERY = "SELECT u.username, g.group_name, p.name from user u inner join user_group g on (g.id = u.user_group) inner join user_group_permissions gp on (gp.user_group = u.user_group) inner join permissions p on (p.id = gp.permissions) where u.username=?";
	private static String USER_GROUP_BY_USERNAME_QUERY = "SELECT g.group_name from user u inner join user_group g on (g.id = u.user_group) where u.username=?";
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {	 
		List<AllUserDetails> users = loadUser(username);
		if (users.size() == 0) {
            throw new UsernameNotFoundException("User not found");
        }		
		return loadGroupAuthorities(users.get(0));
	}
	
	
    private AllUserDetails loadGroupAuthorities(AllUserDetails user) {
    	JdbcTemplate jt = new JdbcTemplate(dataSource);
    	Object[] params = new String[] {user.getUsername()};
    	List<GrantedAuthority> authorities = jt.query(GROUP_AUTHORITIES_BY_USERNAME_QUERY, params, new RowMapper<GrantedAuthority>() {
            public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
                 String roleName = rs.getString("name");
                 GrantedAuthorityImpl authority = new GrantedAuthorityImpl(roleName);
                 return authority;
            }
        });
    	String userGroup = jt.queryForObject(USER_GROUP_BY_USERNAME_QUERY, params, String.class);
    	return new AllUserDetails(user.getUsername(), user.getPassword(), user.isEnabled(), user.isAccountNonExpired(),
				user.isCredentialsNonExpired(), user.isAccountNonLocked(), authorities, user.getFirstName(),
				user.getLastName(), userGroup, user.getCountry(), user.getCentre());
    }
			
    private List<AllUserDetails> loadUser(String username) {
    	JdbcTemplate jt = new JdbcTemplate(dataSource);
        return jt.query(USER_BY_USERNAME_QUERY, new String[] {username}, new RowMapper<AllUserDetails>() {
            public AllUserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
            	String username = rs.getString("username");
    			String password = rs.getString("password");
    			boolean enabled = rs.getBoolean("enabled");
    			String firstName = rs.getString("first_name");
    			String lastName = rs.getString("last_name");
    			int country = rs.getInt("country");
    			int centre = rs.getInt("centre");
                return new AllUserDetails(username, password, enabled, true, true, true, 
                		AuthorityUtils.NO_AUTHORITIES, firstName, lastName, null, country, centre);
            }
        });
    }  

	public void setDataSource(BasicDataSource dataSource) {
		this.dataSource = dataSource;
	}
    
    

}
