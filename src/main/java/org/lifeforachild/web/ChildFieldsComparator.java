package org.lifeforachild.web;

import java.util.Comparator;

import org.lifeforachild.web.report.enums.ChildFields;

public class ChildFieldsComparator implements Comparator<ChildFields> {

	@Override
	public int compare(ChildFields o1, ChildFields o2) {
		// TODO Auto-generated method stub
		return o1.getLabel().compareTo(o2.getLabel());
	}

}
