package com.hq.cloud.generator.entity;

import java.util.List;

/**
 * Created by Administrator on 7/1/2017.
 */
public class TableRelation {

    private String type;

    private boolean isBoth = false;

    private List<RelationFields> relationFields;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<RelationFields> getRelationFields() {
        return relationFields;
    }

    public void setRelationFields(List<RelationFields> relationFields) {
        this.relationFields = relationFields;
    }

    public boolean isBoth() {
        return isBoth;
    }

    public void setBoth(boolean both) {
        isBoth = both;
    }
}
