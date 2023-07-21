-- Create text_pattern_ops index
CREATE EXTENSION IF NOT EXISTS citext;
CREATE INDEX idx_surfaceads_events_topic ON surfaceads_events USING btree (topic text_pattern_ops);


-- Create Campaigns Table
DROP TABLE IF EXISTS campaigns;
CREATE TABLE IF NOT EXISTS campaigns
(
    originator_id  uuid not null,
    profileid      int,
    campaignid     int,
    name           text,
    status         text,
    startdate      date,
    enddate        date,
    defaultbudget  float,
    baselinebudget float,
    created_on     timestamp,
    modified_on    timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_campaigns_profileid ON campaigns USING btree (profileid);
CREATE INDEX idx_campaigns_campaignid ON campaigns USING btree (campaignid);
CREATE INDEX idx_campaigns_name ON campaigns USING btree (name text_pattern_ops);
CREATE INDEX idx_campaigns_status ON campaigns USING btree (status);
CREATE INDEX idx_campaigns_startdate ON campaigns USING btree (startdate);
CREATE INDEX idx_campaigns_enddate ON campaigns USING btree (enddate);
CREATE INDEX idx_campaigns_defaultbudget ON campaigns USING btree (defaultbudget);
CREATE INDEX idx_campaigns_baselinebudget ON campaigns USING btree (baselinebudget);
CREATE INDEX idx_campaigns_created_on ON campaigns USING btree (created_on);
CREATE INDEX idx_campaigns_modified_on ON campaigns USING btree (modified_on);

-- Create Adgroups Table
DROP TABLE IF EXISTS adgroups;
create table if not exists adgroups
(
    originator_id uuid not null,
    profileid     int,
    campaignid    int,
    adgroupid     int,
    name          text,
    status        text,
    defaultbid    float,
    baselinebid   float,
    created_on    timestamp,
    modified_on   timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_adgroups_profileid ON adgroups USING btree (profileid);
CREATE INDEX idx_adgroups_campaignid ON adgroups USING btree (campaignid);
CREATE INDEX idx_adgroups_adgroupid ON adgroups USING btree (adgroupid);
CREATE INDEX idx_adgroups_name ON adgroups USING btree (name text_pattern_ops);
CREATE INDEX idx_adgroups_status ON adgroups USING btree (status);
CREATE INDEX idx_adgroups_defaultbid ON adgroups USING btree (defaultbid);
CREATE INDEX idx_adgroups_baselinebid ON adgroups USING btree (baselinebid);
CREATE INDEX idx_adgroups_created_on ON adgroups USING btree (created_on);
CREATE INDEX idx_adgroups_modified_on ON adgroups USING btree (modified_on);

-- Create Productads Table
drop table if exists productads;
create table productads
(
    originator_id      uuid   not null,
    profileid          int,
    campaignid         int,
    adgroupid          int,
    productadid        int,
    status             text,
    defaultbid         float,
    baselinebid        float,
    sku                text,
    asin               text,
    created_on         timestamp,
    modified_on        timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_productads_profileid ON productads USING btree (profileid);
CREATE INDEX idx_productads_campaignid ON productads USING btree (campaignid);
CREATE INDEX idx_productads_adgroupid ON productads USING btree (adgroupid);
CREATE INDEX idx_productads_productadid ON productads USING btree (productadid);
CREATE INDEX idx_productads_status ON productads USING btree (status);
CREATE INDEX idx_productads_defaultbid ON productads USING btree (defaultbid);
CREATE INDEX idx_productads_baselinebid ON productads USING btree (baselinebid);
CREATE INDEX idx_productads_sku ON productads USING btree (sku);
CREATE INDEX idx_productads_asin ON productads USING btree (asin);
CREATE INDEX idx_productads_created_on ON productads USING btree (created_on);
CREATE INDEX idx_productads_modified_on ON productads USING btree (modified_on);

-- Create Keywords Table
DROP TABLE IF EXISTS keywords;
create table if not exists keywords
(
    originator_id uuid not null,
    profileid     int,
    campaignid    int,
    adgroupid     int,
    keywordid     int,
    status        text,
    defaultbid    float,
    baselinebid   float,
    keywordtext   text,
    matchtype     text,
    created_on    timestamp,
    modified_on   timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_keywords_profileid ON keywords USING btree (profileid);
CREATE INDEX idx_keywords_campaignid ON keywords USING btree (campaignid);
CREATE INDEX idx_keywords_adgroupid ON keywords USING btree (adgroupid);
CREATE INDEX idx_keywords_keywordid ON keywords USING btree (keywordid);
CREATE INDEX idx_keywords_status ON keywords USING btree (status);
CREATE INDEX idx_keywords_defaultbid ON keywords USING btree (defaultbid);
CREATE INDEX idx_keywords_baselinebid ON keywords USING btree (baselinebid);
CREATE INDEX idx_keywords_keywordtext ON keywords USING btree (keywordtext text_pattern_ops);
CREATE INDEX idx_keywords_matchtype ON keywords USING btree (matchtype);
CREATE INDEX idx_keywords_created_on ON keywords USING btree (created_on);
CREATE INDEX idx_keywords_modified_on ON keywords USING btree (modified_on);

-- Create Targets Table
DROP TABLE IF EXISTS targets;
create table if not exists targets
(
    originator_id uuid not null,
    profileid     int,
    campaignid    int,
    adgroupid     int,
    targetid      int,
    status        text,
    defaultbid    float,
    baselinebid   float,
    expr_type     text,
    created_on    timestamp,
    modified_on   timestamp,
    primary key (originator_id)
);

CREATE INDEX idx_targets_profileid ON targets USING btree (profileid);
CREATE INDEX idx_targets_campaignid ON targets USING btree (campaignid);
CREATE INDEX idx_targets_adgroupid ON targets USING btree (adgroupid);
CREATE INDEX idx_targets_keywordid ON targets USING btree (targetid);
CREATE INDEX idx_targets_status ON targets USING btree (status);
CREATE INDEX idx_targets_defaultbid ON targets USING btree (defaultbid);
CREATE INDEX idx_targets_baselinebid ON targets USING btree (baselinebid);
CREATE INDEX idx_targets_keywordtext ON targets USING btree (expr_type);
CREATE INDEX idx_targets_created_on ON targets USING btree (created_on);
CREATE INDEX idx_targets_modified_on ON targets USING btree (modified_on);
