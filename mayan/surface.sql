-- Create text_pattern_ops index
CREATE EXTENSION IF NOT EXISTS citext;
CREATE INDEX idx_surfaceads_events_topic ON public.surfaceads_events USING btree (topic text_pattern_ops);


-- Create Campaigns Table
DROP TABLE IF EXISTS public.surfaceads_campaigns;
CREATE TABLE IF NOT EXISTS public.surfaceads_campaigns
(
    originator_id  uuid not null,
    profileid      bigint,
    campaignid     bigint,
    name           text,
    status         text,
    startdate      date,
    enddate        date,
    defaultbudget  double precision,
    baselinebudget double precision,
    created_on     timestamp,
    modified_on    timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_surfaceads_campaigns_profileid ON public.surfaceads_campaigns USING btree (profileid);
CREATE INDEX idx_surfaceads_campaigns_campaignid ON public.surfaceads_campaigns USING btree (campaignid);
CREATE INDEX idx_surfaceads_campaigns_name ON public.surfaceads_campaigns USING btree (name text_pattern_ops);
CREATE INDEX idx_surfaceads_campaigns_status ON public.surfaceads_campaigns USING btree (status);
CREATE INDEX idx_surfaceads_campaigns_startdate ON public.surfaceads_campaigns USING btree (startdate);
CREATE INDEX idx_surfaceads_campaigns_enddate ON public.surfaceads_campaigns USING btree (enddate);
CREATE INDEX idx_surfaceads_campaigns_defaultbudget ON public.surfaceads_campaigns USING btree (defaultbudget);
CREATE INDEX idx_surfaceads_campaigns_baselinebudget ON public.surfaceads_campaigns USING btree (baselinebudget);
CREATE INDEX idx_surfaceads_campaigns_created_on ON public.surfaceads_campaigns USING btree (created_on);
CREATE INDEX idx_surfaceads_campaigns_modified_on ON public.surfaceads_campaigns USING btree (modified_on);

-- Create Adgroups Table
DROP TABLE IF EXISTS public.surfaceads_adgroups;
create table if not exists public.surfaceads_adgroups
(
    originator_id uuid not null,
    profileid     bigint,
    campaignid    bigint,
    adgroupid     bigint,
    name          text,
    status        text,
    defaultbid    float,
    baselinebid   float,
    created_on    timestamp,
    modified_on   timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_surfaceads_adgroups_profileid ON public.surfaceads_adgroups USING btree (profileid);
CREATE INDEX idx_surfaceads_adgroups_campaignid ON public.surfaceads_adgroups USING btree (campaignid);
CREATE INDEX idx_surfaceads_adgroups_adgroupid ON public.surfaceads_adgroups USING btree (adgroupid);
CREATE INDEX idx_surfaceads_adgroups_name ON public.surfaceads_adgroups USING btree (name text_pattern_ops);
CREATE INDEX idx_surfaceads_adgroups_status ON public.surfaceads_adgroups USING btree (status);
CREATE INDEX idx_surfaceads_adgroups_defaultbid ON public.surfaceads_adgroups USING btree (defaultbid);
CREATE INDEX idx_surfaceads_adgroups_baselinebid ON public.surfaceads_adgroups USING btree (baselinebid);
CREATE INDEX idx_surfaceads_adgroups_created_on ON public.surfaceads_adgroups USING btree (created_on);
CREATE INDEX idx_surfaceads_adgroups_modified_on ON public.surfaceads_adgroups USING btree (modified_on);

-- Create Productads Table
drop table if exists public.surfaceads_productads;
create table public.surfaceads_productads
(
    originator_id      uuid   not null,
    profileid          bigint,
    campaignid         bigint,
    adgroupid          bigint,
    productadid        bigint,
    status             text,
    defaultbid         float,
    baselinebid        float,
    sku                text,
    asin               text,
    created_on         timestamp,
    modified_on        timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_surfaceads_productads_profileid ON public.surfaceads_productads USING btree (profileid);
CREATE INDEX idx_surfaceads_productads_campaignid ON public.surfaceads_productads USING btree (campaignid);
CREATE INDEX idx_surfaceads_productads_adgroupid ON public.surfaceads_productads USING btree (adgroupid);
CREATE INDEX idx_surfaceads_productads_productadid ON public.surfaceads_productads USING btree (productadid);
CREATE INDEX idx_surfaceads_productads_status ON public.surfaceads_productads USING btree (status);
CREATE INDEX idx_surfaceads_productads_defaultbid ON public.surfaceads_productads USING btree (defaultbid);
CREATE INDEX idx_surfaceads_productads_baselinebid ON public.surfaceads_productads USING btree (baselinebid);
CREATE INDEX idx_surfaceads_productads_sku ON public.surfaceads_productads USING btree (sku);
CREATE INDEX idx_surfaceads_productads_asin ON public.surfaceads_productads USING btree (asin);
CREATE INDEX idx_surfaceads_productads_created_on ON public.surfaceads_productads USING btree (created_on);
CREATE INDEX idx_surfaceads_productads_modified_on ON public.surfaceads_productads USING btree (modified_on);

-- Create Keywords Table
DROP TABLE IF EXISTS public.surfaceads_keywords;
create table if not exists public.surfaceads_keywords
(
    originator_id uuid not null,
    profileid     bigint,
    campaignid    bigint,
    adgroupid     bigint,
    keywordid     bigint,
    status        text,
    defaultbid    float,
    baselinebid   float,
    keywordtext   text,
    matchtype     text,
    created_on    timestamp,
    modified_on   timestamp,
    primary key (originator_id)
);
CREATE INDEX idx_surfaceads_keywords_profileid ON public.surfaceads_keywords USING btree (profileid);
CREATE INDEX idx_surfaceads_keywords_campaignid ON public.surfaceads_keywords USING btree (campaignid);
CREATE INDEX idx_surfaceads_keywords_adgroupid ON public.surfaceads_keywords USING btree (adgroupid);
CREATE INDEX idx_surfaceads_keywords_keywordid ON public.surfaceads_keywords USING btree (keywordid);
CREATE INDEX idx_surfaceads_keywords_status ON public.surfaceads_keywords USING btree (status);
CREATE INDEX idx_surfaceads_keywords_defaultbid ON public.surfaceads_keywords USING btree (defaultbid);
CREATE INDEX idx_surfaceads_keywords_baselinebid ON public.surfaceads_keywords USING btree (baselinebid);
CREATE INDEX idx_surfaceads_keywords_keywordtext ON public.surfaceads_keywords USING btree (keywordtext text_pattern_ops);
CREATE INDEX idx_surfaceads_keywords_matchtype ON public.surfaceads_keywords USING btree (matchtype);
CREATE INDEX idx_surfaceads_keywords_created_on ON public.surfaceads_keywords USING btree (created_on);
CREATE INDEX idx_surfaceads_keywords_modified_on ON public.surfaceads_keywords USING btree (modified_on);

-- Create Targets Table
DROP TABLE IF EXISTS public.surfaceads_targets;
create table if not exists public.surfaceads_targets
(
    originator_id uuid not null,
    profileid     bigint,
    campaignid    bigint,
    adgroupid     bigint,
    targetid      bigint,
    status        text,
    defaultbid    float,
    baselinebid   float,
    expr_type     text,
    created_on    timestamp,
    modified_on   timestamp,
    primary key (originator_id)
);

CREATE INDEX idx_surfaceads_targets_profileid ON public.surfaceads_targets USING btree (profileid);
CREATE INDEX idx_surfaceads_targets_campaignid ON public.surfaceads_targets USING btree (campaignid);
CREATE INDEX idx_surfaceads_targets_adgroupid ON public.surfaceads_targets USING btree (adgroupid);
CREATE INDEX idx_surfaceads_targets_keywordid ON public.surfaceads_targets USING btree (targetid);
CREATE INDEX idx_surfaceads_targets_status ON public.surfaceads_targets USING btree (status);
CREATE INDEX idx_surfaceads_targets_defaultbid ON public.surfaceads_targets USING btree (defaultbid);
CREATE INDEX idx_surfaceads_targets_baselinebid ON public.surfaceads_targets USING btree (baselinebid);
CREATE INDEX idx_surfaceads_targets_keywordtext ON public.surfaceads_targets USING btree (expr_type);
CREATE INDEX idx_surfaceads_targets_created_on ON public.surfaceads_targets USING btree (created_on);
CREATE INDEX idx_surfaceads_targets_modified_on ON public.surfaceads_targets USING btree (modified_on);


-- Migrate Surface Campaigns
insert into public.surfaceads_campaigns(originator_id, profileid, campaignid, status, name, startdate, enddate, defaultbudget, baselinebudget, created_on, modified_on)
select
    originator_id,
    profileid,
    campaignid,
    status,
    name,
    startdate,
    enddate,
    defaultbudget,
    baselinebudget,
    created_on,
    modified_on
from (
    select
        originator_id,
        public.profile_id(state)  as profileid,
        cast(public.campaign_id(state) as bigint) as campaignid
    from public.surfaceads_events
    where topic ilike '%campaign%'
      and originator_version = 1
      and public.campaign_id(state) is not null
) filtered left join lateral (
    select
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'status') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'status' is not null then 0 else 1 end,
                originator_version desc
        ) as status,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'name') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'name' is not null then 0 else 1 end,
                originator_version desc
        ) as name,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'startdate') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'startdate' is not null then 0 else 1 end,
                    originator_version desc
            )
            as date
        ) as startdate,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'enddate') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'enddate' is not null then 0 else 1 end,
                    originator_version desc
            )
            as date
        ) as enddate,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbudget') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbudget' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as defaultbudget,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebudget') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebudget' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as baselinebudget,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version
            )
            as timestamp
        ) as created_on,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version desc
            )
            as timestamp
        ) as modified_on
    from public.surfaceads_events e
    where e.originator_id = filtered.originator_id
    limit 1
) e2 on true;


-- Migrate Surface Adgroups
insert into public.surfaceads_adgroups(originator_id, profileid, campaignid, adgroupid, name, status, defaultbid, baselinebid, created_on, modified_on)
select
    originator_id,
    profileid,
    campaignid,
    adgroupid,
    status,
    name,
    defaultbid,
    baselinebid,
    created_on,
    modified_on
from (
    select
        originator_id,
        public.profile_id(state)  as profileid,
        cast(public.campaign_id(state) as bigint) as campaignid,
        cast(public.adgroup_id(state) as bigint) as adgroupid
    from public.surfaceads_events
    where topic ilike '%adgroup%'
      and originator_version = 1
      and public.adgroup_id(state) is not null
) filtered left join lateral (
    select
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'status') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'status' is not null then 0 else 1 end,
                originator_version desc
        ) as status,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'name') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'name' is not null then 0 else 1 end,
                originator_version desc
        ) as name,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as defaultbid,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as baselinebid,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version
            )
            as timestamp
        ) as created_on,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version desc
            )
            as timestamp
        ) as modified_on
    from public.surfaceads_events e
    where e.originator_id = filtered.originator_id
    limit 1
) e2 on true;

-- Migrate Surface Productads
insert into public.surfaceads_productads(originator_id, profileid, campaignid, adgroupid, productadid, status, defaultbid, baselinebid, sku, asin, created_on, modified_on)
select
    originator_id,
    profileid,
    campaignid,
    adgroupid,
    productadid,
    status,
    defaultbid,
    baselinebid,
    sku,
    asin,
    created_on,
    modified_on
from (
    select
        originator_id,
        public.profile_id(state)  as profileid,
        cast(public.campaign_id(state) as bigint) as campaignid,
        cast(public.adgroup_id(state) as bigint) as adgroupid,
        cast(public.productad_id(state) as bigint) as productadid
    from public.surfaceads_events
    where topic ilike '%productad%'
      and originator_version = 1
      and public.productad_id(state) is not null
) filtered left join lateral (
    select
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'status') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'status' is not null then 0 else 1 end,
                originator_version desc
        ) as status,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as defaultbid,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as baselinebid,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'sku') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'sku' is not null then 0 else 1 end,
                originator_version desc
        ) as sku,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'asin') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'asin' is not null then 0 else 1 end,
                originator_version desc
        ) as asin,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version
            )
            as timestamp
        ) as created_on,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version desc
            )
            as timestamp
        ) as modified_on
    from public.surfaceads_events e
    where e.originator_id = filtered.originator_id
    limit 1
) e2 on true;


-- Migrate Surface Keywords
insert into public.surfaceads_keywords(originator_id, profileid, campaignid, adgroupid, keywordid, status, defaultbid, baselinebid, keywordtext, matchtype, created_on, modified_on)
select
    originator_id,
    profileid,
    campaignid,
    adgroupid,
    keywordid,
    status,
    defaultbid,
    baselinebid,
    keywordtext,
    matchtype,
    created_on,
    modified_on
from (
    select
        originator_id,
        public.profile_id(state)  as profileid,
        cast(public.campaign_id(state) as bigint) as campaignid,
        cast(public.adgroup_id(state) as bigint) as adgroupid,
        cast(public.keyword_id(state) as bigint) as keywordid
    from public.surfaceads_events
    where topic ilike '%keyword%'
      and originator_version = 1
      and public.keyword_id(state) is not null
) filtered left join lateral (
    select
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'status') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'status' is not null then 0 else 1 end,
                originator_version desc
        ) as status,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as defaultbid,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as baselinebid,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'keywordtext') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'keywordtext' is not null then 0 else 1 end,
                originator_version desc
        ) as keywordtext,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'matchtype') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'matchtype' is not null then 0 else 1 end,
                originator_version desc
        ) as matchtype,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version
            )
            as timestamp
        ) as created_on,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version desc
            )
            as timestamp
        ) as modified_on
    from public.surfaceads_events e
    where e.originator_id = filtered.originator_id
    limit 1
) e2 on true;


-- Migrate Surface Targets
insert into public.surfaceads_targets(originator_id, profileid, campaignid, adgroupid, targetid, status, defaultbid, baselinebid, expr_type, created_on, modified_on)
select
    originator_id,
    profileid,
    campaignid,
    adgroupid,
    targetid,
    status,
    defaultbid,
    baselinebid,
    expr_type,
    created_on,
    modified_on
from (
    select
        originator_id,
        public.profile_id(state)  as profileid,
        cast(public.campaign_id(state) as bigint) as campaignid,
        cast(public.adgroup_id(state) as bigint) as adgroupid,
        cast(public.target_id(state) as bigint) as targetid
    from public.surfaceads_events
    where topic ilike '%target%'
      and originator_version = 1
      and public.target_id(state) is not null
) filtered left join lateral (
    select
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'status') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'status' is not null then 0 else 1 end,
                originator_version desc
        ) as status,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'defaultbid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as defaultbid,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid') over (
                order by
                    case when convert_from(e.state, 'utf-8')::jsonb ->> 'baselinebid' is not null then 0 else 1 end,
                    originator_version desc
            )
            as double precision
        ) as baselinebid,
        first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'expr_type') over (
            order by
                case when convert_from(e.state, 'utf-8')::jsonb ->> 'expr_type' is not null then 0 else 1 end,
                originator_version desc
        ) as expr_type,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version
            )
            as timestamp
        ) as created_on,
        cast(
            first_value(convert_from(e.state, 'utf-8')::jsonb ->> 'timestamp') over (
                order by originator_version desc
            )
            as timestamp
        ) as modified_on
    from public.surfaceads_events e
    where e.originator_id = filtered.originator_id
    limit 1
) e2 on true;
