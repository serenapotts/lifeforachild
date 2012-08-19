package org.lifeforachild.web;

import java.util.Comparator;

import org.lifeforachild.web.Report.enums.ClinicalRecordFields;

public class ClinicalRecordFieldsComparator implements Comparator<ClinicalRecordFields> {

	@Override
	public int compare(ClinicalRecordFields o1, ClinicalRecordFields o2) {
		// TODO Auto-generated method stub
		return o1.getLabel().compareTo(o2.getLabel());
	}

}
