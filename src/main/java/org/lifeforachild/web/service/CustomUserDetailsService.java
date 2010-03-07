package org.lifeforachild.web.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService{

	private BasicDataSource  dataSource;

	private static String USER_BY_USERNAME_QUERY = "select * from User where username = ?";
	private static String GROUP_AUTHORITIES_BY_USERNAME_QUERY = "SELECT u.username, g.group_name, p.name from user u inner join user_group g on (g.id = u.user_group) inner join user_group_permissions gp on (gp.user_group = u.user_group) inner join permissions p on (p.id = gp.permissions) where u.username=?";
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {	 
		List<User> users = loadUser(username);
		if (users.size() == 0) {
            throw new UsernameNotFoundException("User not found");
        }
		User user = users.get(0);
		List<GrantedAuthority> authorities = loadGroupAuthorities(username);
		return new User(user.getUsername(), user.getPassword(), user.isEnabled(), user.isAccountNonExpired(),
				user.isCredentialsNonExpired(), user.isAccountNonLocked(), authorities);
	}
	
	
    private List<GrantedAuthority> loadGroupAuthorities(String username) {
    	JdbcTemplate jt = new JdbcTemplate(dataSource);
        return jt.query(GROUP_AUTHORITIES_BY_USERNAME_QUERY, new String[] {username}, new RowMapper<GrantedAuthority>() {
            public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
                 String roleName = rs.getString("name");
                 GrantedAuthorityImpl authority = new GrantedAuthorityImpl(roleName);
                 return authority;
            }
        });
    }
			
    private List<User> loadUser(String username) {
    	JdbcTemplate jt = new JdbcTemplate(dataSource);
        return jt.query(USER_BY_USERNAME_QUERY, new String[] {username}, new RowMapper<User>() {
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            	String username = rs.getString("username");
    			String password = rs.getString("password");
    			boolean enabled = rs.getBoolean("enabled");
                return new User(username, password, enabled, true, true, true, AuthorityUtils.NO_AUTHORITIES);
            }
        });
    }  

	public void setDataSource(BasicDataSource dataSource) {
		this.dataSource = dataSource;
	}
    
    

}
