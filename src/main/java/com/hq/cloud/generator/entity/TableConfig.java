package com.hq.cloud.generator.entity;

import java.util.List;

/**
 * Created by Administrator on 2015/10/5 0005.
 */
public class TableConfig {

    private String tablePrefix;

    private List<Table> tables;

    private List<String> excludedFields;

    public List<Table> getTables() {
        return tables;
    }

    public void setTables(List<Table> tables) {
        this.tables = tables;
    }

    public String getTablePrefix() {
        return tablePrefix;
    }

    public void setTablePrefix(String tablePrefix) {
        this.tablePrefix = tablePrefix;
    }

    public List<String> getExcludedFields() {
        return excludedFields;
    }

    public void setExcludedFields(List<String> excludedFields) {
        this.excludedFields = excludedFields;
    }
}
