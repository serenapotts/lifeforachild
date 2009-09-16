package org.lifeforachild.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * A user of the LifeForAChild database
 * @author hburgh
 *
 */
@Entity
@RooEntity
@RooJavaBean
@RooToString
public class User {

    String name;
}
