package com.hq.cloud.generator.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 7/2/2017.
 */
public class Table {

    private String name;

    private String alias;

    private List<TableRelation> relations = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<TableRelation> getRelations() {
        return relations;
    }

    public void setRelations(List<TableRelation> relations) {
        this.relations = relations;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }
}
