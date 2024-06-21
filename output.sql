/*
Generated From: 
https://SpaceDataStandards.org 
version: NO_VERSION_SPECIFIED
*/
create table `LCC` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `OWNER` float,
 primary key (
 `database_id`));


create index `lcc_file_id_index` on `LCC` (
 `file_id`);


create index `lcc_database_id_index` on `LCC` (
 `database_id`);


create table `MPE` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ENTITY_ID` text,
 `EPOCH` float,
 `MEAN_MOTION` float,
 `ECCENTRICITY` float,
 `INCLINATION` float,
 `RA_OF_ASC_NODE` float,
 `ARG_OF_PERICENTER` float,
 `MEAN_ANOMALY` float,
 `BSTAR` float,
 `MEAN_ELEMENT_THEORY` float,
 primary key (
 `database_id`));


create index `mpe_file_id_index` on `MPE` (
 `file_id`);


create index `mpe_database_id_index` on `MPE` (
 `database_id`);


create table `OMM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CCSDS_OMM_VERS` float,
 `CREATION_DATE` text,
 `ORIGINATOR` text,
 `OBJECT_NAME` text,
 `OBJECT_ID` text,
 `CENTER_NAME` text,
 `REFERENCE_FRAME` float,
 `REFERENCE_FRAME_EPOCH` text,
 `TIME_SYSTEM` float,
 `MEAN_ELEMENT_THEORY` float,
 `COMMENT` text,
 `EPOCH` text,
 `SEMI_MAJOR_AXIS` float,
 `MEAN_MOTION` float,
 `ECCENTRICITY` float,
 `INCLINATION` float,
 `RA_OF_ASC_NODE` float,
 `ARG_OF_PERICENTER` float,
 `MEAN_ANOMALY` float,
 `GM` float,
 `MASS` float,
 `SOLAR_RAD_AREA` float,
 `SOLAR_RAD_COEFF` float,
 `DRAG_AREA` float,
 `DRAG_COEFF` float,
 `EPHEMERIS_TYPE` float,
 `CLASSIFICATION_TYPE` text,
 `NORAD_CAT_ID` integer,
 `ELEMENT_SET_NO` integer,
 `REV_AT_EPOCH` float,
 `BSTAR` float,
 `MEAN_MOTION_DOT` float,
 `MEAN_MOTION_DDOT` float,
 `COV_REFERENCE_FRAME` float,
 `CX_X` float,
 `CY_X` float,
 `CY_Y` float,
 `CZ_X` float,
 `CZ_Y` float,
 `CZ_Z` float,
 `CX_DOT_X` float,
 `CX_DOT_Y` float,
 `CX_DOT_Z` float,
 `CX_DOT_X_DOT` float,
 `CY_DOT_X` float,
 `CY_DOT_Y` float,
 `CY_DOT_Z` float,
 `CY_DOT_X_DOT` float,
 `CY_DOT_Y_DOT` float,
 `CZ_DOT_X` float,
 `CZ_DOT_Y` float,
 `CZ_DOT_Z` float,
 `CZ_DOT_X_DOT` float,
 `CZ_DOT_Y_DOT` float,
 `CZ_DOT_Z_DOT` float,
 `USER_DEFINED_BIP_0044_TYPE` integer,
 `USER_DEFINED_OBJECT_DESIGNATOR` text,
 `USER_DEFINED_EARTH_MODEL` text,
 `USER_DEFINED_EPOCH_TIMESTAMP` float,
 `USER_DEFINED_MICROSECONDS` float,
 primary key (
 `database_id`));


create index `omm_file_id_index` on `OMM` (
 `file_id`);


create index `omm_database_id_index` on `OMM` (
 `database_id`);


create table `PLD` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CAT_id` integer,
 `PAYLOAD_DURATION` text,
 `MASS_AT_LAUNCH` float,
 `DIMENSIONS` text,
 `SOLAR_ARRAY_AREA` float,
 `SOLAR_ARRAY_DIMENSIONS` text,
 `NOMINAL_OPERATIONAL_LIFETIME` text,
 foreign key(
 `CAT_id`) references `CAT`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `pld_file_id_index` on `PLD` (
 `file_id`);


create index `pld_database_id_index` on `PLD` (
 `database_id`);


create index `pld_cat_id_index` on `PLD` (
 `CAT_id`);


create table `IDM` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `SIT_id` integer,
 `ID` text,
 `NAME` text,
 `DATA_MODE` float,
 `POLARIZATION_TYPE` float,
 `SIMPLE_POLARIZATION` float,
 `POWER_REQUIRED` float,
 `POWER_TYPE` text,
 `TRANSMIT` boolean,
 `RECEIVE` boolean,
 `SENSOR_TYPE` float,
 `SOURCE` text,
 `LAST_OB_TIME` text,
 `LOWER_LEFT_ELEVATION_LIMIT` float,
 `UPPER_LEFT_AZIMUTH_LIMIT` float,
 `LOWER_RIGHT_ELEVATION_LIMIT` float,
 `LOWER_LEFT_AZIMUTH_LIMIT` float,
 `UPPER_RIGHT_ELEVATION_LIMIT` float,
 `UPPER_RIGHT_AZIMUTH_LIMIT` float,
 `LOWER_RIGHT_AZIMUTH_LIMIT` float,
 `UPPER_LEFT_ELEVATION_LIMIT` float,
 `RIGHT_GEO_BELT_LIMIT` float,
 `LEFT_GEO_BELT_LIMIT` float,
 `MAGNITUDE_LIMIT` float,
 `TASKABLE` boolean,
 `UPLINK` integer,
 `DOWNLINK` integer,
 `BEACON` integer,
 `STOKES_PARAMETERS` integer,
 foreign key(
 `SIT_id`) references `SIT`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `idm_database_id_index` on `IDM` (
 `database_id`);


create index `idm_sit_id_index` on `IDM` (
 `SIT_id`);


create index `idm_uplink_index` on `IDM` (
 `UPLINK`);


create index `idm_downlink_index` on `IDM` (
 `DOWNLINK`);


create index `idm_beacon_index` on `IDM` (
 `BEACON`);


create index `idm_stokes_parameters_index` on `IDM` (
 `STOKES_PARAMETERS`);


create table `FrequencyRange` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `Band_id` integer,
 `LOWER` float,
 `UPPER` float,
 foreign key(
 `Band_id`) references `Band`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `frequencyrange_database_id_index` on `FrequencyRange` (
 `database_id`);


create index `frequencyrange_band_id_index` on `FrequencyRange` (
 `Band_id`);


create table `Band` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `IDM_id` integer,
 `NAME` text,
 `FREQUENCY_RANGE` integer,
 foreign key(
 `IDM_id`) references `IDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `band_database_id_index` on `Band` (
 `database_id`);


create index `band_idm_id_index` on `Band` (
 `IDM_id`);


create index `band_frequency_range_index` on `Band` (
 `FREQUENCY_RANGE`);


create table `StokesParameters` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `IDM_id` integer,
 `I` float,
 `Q` float,
 `U` float,
 `V` float,
 foreign key(
 `IDM_id`) references `IDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `stokesparameters_database_id_index` on `StokesParameters` (
 `database_id`);


create index `stokesparameters_idm_id_index` on `StokesParameters` (
 `IDM_id`);


create table `RFM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `REFERENCE_FRAME` float,
 primary key (
 `database_id`));


create index `rfm_file_id_index` on `RFM` (
 `file_id`);


create index `rfm_database_id_index` on `RFM` (
 `database_id`);


create table `CSM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `DSE_1` float,
 `DSE_2` float,
 `TCA` float,
 `TCA_RANGE` float,
 `TCA_RELATIVE_SPEED` float,
 `MAX_PROB` float,
 `DILUTION` float,
 primary key (
 `database_id`));


create index `csm_file_id_index` on `CSM` (
 `file_id`);


create index `csm_database_id_index` on `CSM` (
 `database_id`);


create table `CAT` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CDMObject_id` integer,
 `OBJECT_NAME` text,
 `OBJECT_ID` text,
 `NORAD_CAT_ID` integer,
 `OBJECT_TYPE` float,
 `OPS_STATUS_CODE` float,
 `OWNER` float,
 `LAUNCH_DATE` text,
 `LAUNCH_SITE` text,
 `DECAY_DATE` text,
 `PERIOD` float,
 `INCLINATION` float,
 `APOGEE` float,
 `PERIGEE` float,
 `RCS` float,
 `DATA_STATUS_CODE` float,
 `ORBIT_CENTER` text,
 `ORBIT_TYPE` float,
 `DEPLOYMENT_DATE` text,
 `MANEUVERABLE` boolean,
 `SIZE` float,
 `MASS` float,
 `MASS_TYPE` float,
 foreign key(
 `CDMObject_id`) references `CDMObject`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `cat_database_id_index` on `CAT` (
 `database_id`);


create index `cat_cdmobject_id_index` on `CAT` (
 `CDMObject_id`);


create table `OSM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `IS_STABLE` boolean,
 `NUM_OBS` integer,
 `OBJECT_ID` text,
 `ID_SENSOR` text,
 `PASS_START` text,
 `PASS_DURATION` integer,
 primary key (
 `database_id`));


create index `osm_file_id_index` on `OSM` (
 `file_id`);


create index `osm_database_id_index` on `OSM` (
 `database_id`);


create table `CRM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ID` text,
 `CLASSIFICATION` text,
 `TYPE` text,
 `ID_PLAN` text,
 `PLAN_INDEX` integer,
 `TASK_ID` text,
 `DWELL_ID` text,
 `EXTERNAL_ID` text,
 `ID_SENSOR` text,
 `ORIG_SENSOR_ID` text,
 `OB_TYPE` text,
 `PRIORITY` text,
 `TASK_CATEGORY` integer,
 `SUFFIX` text,
 `UCT_FOLLOW_UP` boolean,
 `START_TIME` text,
 `END_TIME` text,
 `NORAD_CAT_ID` integer,
 `ORIG_OBJECT_ID` text,
 `TASK_GROUP` text,
 `IRON` integer,
 `ORBIT_REGIME` text,
 `TARGET_SIZE` float,
 `RCS_MIN` float,
 `RCS` float,
 `RCS_MAX` float,
 `FREQ_MIN` float,
 `FREQ` float,
 `FREQ_MAX` float,
 `POLARIZATION` text,
 `VIS_MAG_MIN` float,
 `VIS_MAG` float,
 `VIS_MAG_MAX` float,
 `SPECTRAL_MODEL` text,
 `REFLECTANCE` float,
 `IRRADIANCE` float,
 `NUM_FRAMES` integer,
 `FRAME_RATE` float,
 `INTEGRATION_TIME` float,
 `NUM_TRACKS` integer,
 `NUM_OBS` integer,
 `DURATION` integer,
 `SRCH_PATTERN` text,
 `SCENARIO` text,
 `ID_ELSET` text,
 `ID_MANIFOLD` text,
 `ID_STATE_VECTOR` text,
 `ES_ID` text,
 `EPOCH` text,
 `SEMI_MAJOR_AXIS` float,
 `ECCENTRICITY` float,
 `INCLINATION` float,
 `RAAN` float,
 `ARG_OF_PERIGEE` float,
 `MEAN_ANOMALY` float,
 `RA` float,
 `DEC` float,
 `AZ` float,
 `EL` float,
 `RANGE` float,
 `EXTENT_AZ` float,
 `EXTENT_EL` float,
 `EXTENT_RANGE` float,
 `LAT` float,
 `LON` float,
 `ALT` float,
 `STOP_LAT` float,
 `STOP_LON` float,
 `STOP_ALT` float,
 `SRCH_INC` float,
 `X_ANGLE` float,
 `Y_ANGLE` float,
 `ORIENT_ANGLE` float,
 `CUSTOMER` text,
 `NOTES` text,
 `SOURCE` text,
 `ORIGIN` text,
 `DATA_MODE` text,
 primary key (
 `database_id`));


create index `crm_file_id_index` on `CRM` (
 `file_id`);


create index `crm_database_id_index` on `CRM` (
 `database_id`);


create table `SCM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `version` text,
 primary key (
 `database_id`));


create index `scm_file_id_index` on `SCM` (
 `file_id`);


create index `scm_database_id_index` on `SCM` (
 `database_id`);


create table `SCHEMA_STANDARD` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `SCM_id` integer,
 `key` text,
 `idl` text,
 `files` text,
 foreign key(
 `SCM_id`) references `SCM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `schema_standard_database_id_index` on `SCHEMA_STANDARD` (
 `database_id`);


create index `schema_standard_scm_id_index` on `SCHEMA_STANDARD` (
 `SCM_id`);


create table `TDM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `OBSERVER_ID` text,
 `OBSERVER_X` float,
 `OBSERVER_Y` float,
 `OBSERVER_Z` float,
 `OBSERVER_VX` float,
 `OBSERVER_VY` float,
 `OBSERVER_VZ` float,
 `OBSERVER_POSITION_REFERENCE_FRAME` float,
 `OBS_REFERENCE_FRAME` float,
 `EPOCH` text,
 `CCSDS_TDM_VERS` text,
 `COMMENT` text,
 `CREATION_DATE` text,
 `ORIGINATOR` text,
 `META_START` text,
 `TIME_SYSTEM` text,
 `START_TIME` text,
 `STOP_TIME` text,
 `PARTICIPANT_1` text,
 `PARTICIPANT_2` text,
 `PARTICIPANT_3` text,
 `PARTICIPANT_4` text,
 `PARTICIPANT_5` text,
 `MODE` text,
 `PATH_1` integer,
 `PATH_2` integer,
 `TRANSMIT_BAND` text,
 `RECEIVE_BAND` text,
 `INTEGRATION_INTERVAL` float,
 `INTEGRATION_REF` text,
 `RECEIVE_DELAY_2` float,
 `RECEIVE_DELAY_3` float,
 `DATA_QUALITY` text,
 `META_STOP` text,
 `DATA_START` text,
 `TRANSMIT_FREQ_1` float,
 `RECEIVE_FREQ` float,
 `DATA_STOP` text,
 `TIMETAG_REF` text,
 `ANGLE_TYPE` text,
 `ANGLE_1` float,
 `ANGLE_2` float,
 `ANGLE_UNCERTAINTY_1` float,
 `ANGLE_UNCERTAINTY_2` float,
 `RANGE_RATE` float,
 `RANGE_UNCERTAINTY` float,
 `RANGE_MODE` text,
 `RANGE_MODULUS` float,
 `CORRECTION_ANGLE_1` float,
 `CORRECTION_ANGLE_2` float,
 `CORRECTIONS_APPLIED` text,
 `TROPO_DRY` float,
 `TROPO_WET` float,
 `STEC` float,
 `PRESSURE` float,
 `RHUMIDITY` float,
 `TEMPERATURE` float,
 `CLOCK_BIAS` float,
 `CLOCK_DRIFT` float,
 primary key (
 `database_id`));


create index `tdm_file_id_index` on `TDM` (
 `file_id`);


create index `tdm_database_id_index` on `TDM` (
 `database_id`);


create table `MET` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `MEAN_ELEMENT_THEORY` float,
 primary key (
 `database_id`));


create index `met_file_id_index` on `MET` (
 `file_id`);


create index `met_database_id_index` on `MET` (
 `database_id`);


create table `ROC` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `LDM_id` integer,
 `NAME` text,
 `FAMILY` text,
 `VARIANT` text,
 foreign key(
 `LDM_id`) references `LDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `roc_file_id_index` on `ROC` (
 `file_id`);


create index `roc_database_id_index` on `ROC` (
 `database_id`);


create index `roc_ldm_id_index` on `ROC` (
 `LDM_id`);


create table `STAGE` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ROC_id` integer,
 `STAGE_NUMBER` integer,
 `FUEL_TYPE` text,
 `THRUST` float,
 `BURN_DURATION` float,
 foreign key(
 `ROC_id`) references `ROC`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `stage_database_id_index` on `STAGE` (
 `database_id`);


create index `stage_roc_id_index` on `STAGE` (
 `ROC_id`);


create table `ENGINE` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `STAGE_id` integer,
 `ENGINE_NAME` text,
 `TYPE` float,
 `THRUST` float,
 foreign key(
 `STAGE_id`) references `STAGE`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `engine_database_id_index` on `ENGINE` (
 `database_id`);


create index `engine_stage_id_index` on `ENGINE` (
 `STAGE_id`);


create table `SUSTAINER` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ROC_id` integer,
 `SUSTAINER_NAME` text,
 `THRUST` float,
 `BURN_DURATION` float,
 foreign key(
 `ROC_id`) references `ROC`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `sustainer_database_id_index` on `SUSTAINER` (
 `database_id`);


create index `sustainer_roc_id_index` on `SUSTAINER` (
 `ROC_id`);


create table `BOV` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `LDM_id` integer,
 `E_COORDINATE` float,
 `F_COORDINATE` float,
 `G_COORDINATE` float,
 `E_DOT` float,
 `F_DOT` float,
 `G_DOT` float,
 `EPOCH` text,
 `TIME_FROM_LAUNCH` float,
 foreign key(
 `LDM_id`) references `LDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `bov_file_id_index` on `BOV` (
 `file_id`);


create index `bov_database_id_index` on `BOV` (
 `database_id`);


create index `bov_ldm_id_index` on `BOV` (
 `LDM_id`);


create table `EOP` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `DATE` text,
 `MJD` integer,
 `X_POLE_WANDER_RADIANS` float,
 `Y_POLE_WANDER_RADIANS` float,
 `X_CELESTIAL_POLE_OFFSET_RADIANS` float,
 `Y_CELESTIAL_POLE_OFFSET_RADIANS` float,
 `UT1_MINUS_UTC_SECONDS` float,
 `TAI_MINUS_UTC_SECONDS` integer,
 `LENGTH_OF_DAY_CORRECTION_SECONDS` float,
 `DATA_TYPE` float,
 primary key (
 `database_id`));


create index `eop_file_id_index` on `EOP` (
 `file_id`);


create index `eop_database_id_index` on `EOP` (
 `database_id`);


create table `EOO` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `EOBSERVATION_ID` text,
 `CLASSIFICATION` text,
 `OB_TIME` text,
 `CORR_QUALITY` float,
 `ID_ON_ORBIT` text,
 `SENSOR_ID` text,
 `COLLECT_METHOD` text,
 `NORAD_CAT_ID` integer,
 `TASK_ID` text,
 `TRANSACTION_ID` text,
 `TRACK_ID` text,
 `OB_POSITION` text,
 `ORIG_OBJECT_ID` text,
 `ORIG_SENSOR_ID` text,
 `UCT` boolean,
 `AZIMUTH` float,
 `AZIMUTH_UNC` float,
 `AZIMUTH_BIAS` float,
 `AZIMUTH_RATE` float,
 `ELEVATION` float,
 `ELEVATION_UNC` float,
 `ELEVATION_BIAS` float,
 `ELEVATION_RATE` float,
 `RANGE` float,
 `RANGE_UNC` float,
 `RANGE_BIAS` float,
 `RANGE_RATE` float,
 `RANGE_RATE_UNC` float,
 `RA` float,
 `RA_RATE` float,
 `RA_UNC` float,
 `RA_BIAS` float,
 `DECLINATION` float,
 `DECLINATION_RATE` float,
 `DECLINATION_UNC` float,
 `DECLINATION_BIAS` float,
 `LOSX` float,
 `LOSY` float,
 `LOSZ` float,
 `LOS_UNC` float,
 `LOSXVEL` float,
 `LOSYVEL` float,
 `LOSZVEL` float,
 `SENLAT` float,
 `SENLON` float,
 `SENALT` float,
 `SENX` float,
 `SENY` float,
 `SENZ` float,
 `FOV_COUNT` integer,
 `EXP_DURATION` float,
 `ZEROPTD` float,
 `NET_OBJ_SIG` float,
 `NET_OBJ_SIG_UNC` float,
 `MAG` float,
 `MAG_UNC` float,
 `MAG_NORM_RANGE` float,
 `GEOLAT` float,
 `GEOLON` float,
 `GEOALT` float,
 `GEORANGE` float,
 `SKY_BKGRND` float,
 `PRIMARY_EXTINCTION` float,
 `PRIMARY_EXTINCTION_UNC` float,
 `SOLAR_PHASE_ANGLE` float,
 `SOLAR_EQ_PHASE_ANGLE` float,
 `SOLAR_DEC_ANGLE` float,
 `SHUTTER_DELAY` float,
 `TIMING_BIAS` float,
 `RAW_FILE_URI` text,
 `INTENSITY` float,
 `BG_INTENSITY` float,
 `DESCRIPTOR` text,
 `SOURCE` text,
 `ORIGIN` text,
 `DATA_MODE` text,
 `CREATED_AT` text,
 `CREATED_BY` text,
 `REFERENCE_FRAME` float,
 `SEN_REFERENCE_FRAME` text,
 `UMBRA` boolean,
 `PENUMBRA` boolean,
 `ORIG_NETWORK` text,
 `SOURCE_DL` text,
 `TYPE` text,
 primary key (
 `database_id`));


create index `eoo_file_id_index` on `EOO` (
 `file_id`);


create index `eoo_database_id_index` on `EOO` (
 `database_id`);


create table `EME` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ENCRYPTED_BLOB` tinyint,
 `EPHEMERAL_PUBLIC_KEY` text,
 `MAC` text,
 `NONCE` text,
 `TAG` text,
 `IV` text,
 `PUBLIC_KEY_IDENTIFIER` text,
 `CIPHER_SUITE` text,
 `KDF_PARAMETERS` text,
 `ENCRYPTION_ALGORITHM_PARAMETERS` text,
 primary key (
 `database_id`));


create index `eme_file_id_index` on `EME` (
 `file_id`);


create index `eme_database_id_index` on `EME` (
 `database_id`);


create table `LDM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `AZIMUTH` float,
 `REFERENCES` text,
 `AGENCY_NAME` text,
 `NET` text,
 `MISSION_NAME` text,
 `MISSION_DESCRIPTION` text,
 `MISSION_TYPE` text,
 `ORBIT_TYPE` text,
 `WEATHER_CONDITIONS` text,
 `LAUNCH_STATUS` text,
 `WEBCAST_URL` text,
 `MEDIA_LINKS` text,
 `EARLIEST_LAUNCH_TIMES` text,
 `LATEST_LAUNCH_TIMES` text,
 `LCOLA_WINDOW_CLOSURES` text,
 `TRACKING_REQUIREMENTS` text,
 `COLA_SCREEN_DURATION` text,
 `PROBABILITY_OF_COLLISION_THRESHOLD` text,
 `COLA_RUNS_REQUIRED` text,
 `ORBITAL_PARAMETERS` text,
 `SITE` integer,
 `ROCKET_CONFIGURATION` integer,
 primary key (
 `database_id`));


create index `ldm_file_id_index` on `LDM` (
 `file_id`);


create index `ldm_database_id_index` on `LDM` (
 `database_id`);


create index `ldm_site_index` on `LDM` (
 `SITE`);


create index `ldm_rocket_configuration_index` on `LDM` (
 `ROCKET_CONFIGURATION`);


create table `SIT` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `LDM_id` integer,
 `ID` text,
 `NAME` text,
 `ABBREVIATION` text,
 `SITE_TYPE` float,
 `CATCODE` text,
 `NETWORK` text,
 `LATITUDE` float,
 `LONGITUDE` float,
 `ALTITUDE` float,
 `CENTER_POINT_GEOMETRY` float,
 `CLASSIFICATION` text,
 `CTR_ID` text,
 `CREATED_BY` text,
 `DESCRIPTION` text,
 `MODEL_URL` text,
 `SOURCE` text,
 `TASKABLE` boolean,
 `OPERATIONAL_STATUS` text,
 `ESTABLISHMENT_DATE` text,
 `CONTACT_INFO` text,
 `ENVIRONMENTAL_IMPACT` text,
 `ACCESSIBILITY_INFRA` text,
 `GEOMETRY` integer,
 foreign key(
 `LDM_id`) references `LDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `sit_database_id_index` on `SIT` (
 `database_id`);


create index `sit_ldm_id_index` on `SIT` (
 `LDM_id`);


create index `sit_geometry_index` on `SIT` (
 `GEOMETRY`);


create table `Geometry` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `SIT_id` integer,
 `GEOMETRY_TYPE` text,
 `COORDINATES` float,
 foreign key(
 `SIT_id`) references `SIT`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `geometry_database_id_index` on `Geometry` (
 `database_id`);


create index `geometry_sit_id_index` on `Geometry` (
 `SIT_id`);


create table `EPM` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CDMObject_id` integer,
 `DN` text,
 `LEGAL_NAME` text,
 `FAMILY_NAME` text,
 `GIVEN_NAME` text,
 `ADDITIONAL_NAME` text,
 `HONORIFIC_PREFIX` text,
 `HONORIFIC_SUFFIX` text,
 `JOB_TITLE` text,
 `OCCUPATION` text,
 `ALTERNATE_NAMES` text,
 `EMAIL` text,
 `TELEPHONE` text,
 `MULTIFORMAT_ADDRESS` text,
 `ADDRESS` integer,
 foreign key(
 `CDMObject_id`) references `CDMObject`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `epm_database_id_index` on `EPM` (
 `database_id`);


create index `epm_cdmobject_id_index` on `EPM` (
 `CDMObject_id`);


create index `epm_address_index` on `EPM` (
 `ADDRESS`);


create table `Address` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `EPM_id` integer,
 `COUNTRY` text,
 `REGION` text,
 `LOCALITY` text,
 `POSTAL_CODE` text,
 `STREET` text,
 `POST_OFFICE_BOX_NUMBER` text,
 foreign key(
 `EPM_id`) references `EPM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `address_database_id_index` on `Address` (
 `database_id`);


create index `address_epm_id_index` on `Address` (
 `EPM_id`);


create table `CryptoKey` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `EPM_id` integer,
 `PUBLIC_KEY` text,
 `XPUB` text,
 `PRIVATE_KEY` text,
 `XPRIV` text,
 `KEY_ADDRESS` text,
 `ADDRESS_TYPE` text,
 `KEY_TYPE` float,
 foreign key(
 `EPM_id`) references `EPM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `cryptokey_database_id_index` on `CryptoKey` (
 `database_id`);


create index `cryptokey_epm_id_index` on `CryptoKey` (
 `EPM_id`);


create table `PNM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CDM_id` integer,
 `MULTIFORMAT_ADDRESS` text,
 `PUBLISH_TIMESTAMP` text,
 `CID` text,
 `FILE_NAME` text,
 `FILE_ID` text,
 `SIGNATURE` text,
 `TIMESTAMP_SIGNATURE` text,
 `SIGNATURE_TYPE` text,
 `TIMESTAMP_SIGNATURE_TYPE` text,
 foreign key(
 `CDM_id`) references `CDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `pnm_file_id_index` on `PNM` (
 `file_id`);


create index `pnm_database_id_index` on `PNM` (
 `database_id`);


create index `pnm_cdm_id_index` on `PNM` (
 `CDM_id`);


create table `HYP` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CAT_IDS` text,
 `SIT_IDS` text,
 `NAME` text,
 `CATEGORY` text,
 `ROW_INDICATORS` text,
 `COL_INDICATORS` text,
 `MATRIX` boolean,
 `ANALYSIS_METHOD` text,
 `EVENT_START_TIME` text,
 `EVENT_END_TIME` text,
 primary key (
 `database_id`));


create index `hyp_file_id_index` on `HYP` (
 `file_id`);


create index `hyp_database_id_index` on `HYP` (
 `database_id`);


create table `Score` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `HYP_id` integer,
 `NORAD_CAT_ID` text,
 `TYPE` float,
 `TAG` text,
 `SCORE` float,
 foreign key(
 `HYP_id`) references `HYP`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `score_database_id_index` on `Score` (
 `database_id`);


create index `score_hyp_id_index` on `Score` (
 `HYP_id`);


create table `CTR` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ID` text,
 `NAME` text,
 `GENC_CODE` text,
 `ALPHA_2_CODE` text,
 `ALPHA_3_CODE` text,
 `STANAG_CODE` text,
 `INTERNET_CCTLD` text,
 `COMMENT` text,
 primary key (
 `database_id`));


create index `ctr_file_id_index` on `CTR` (
 `file_id`);


create index `ctr_database_id_index` on `CTR` (
 `database_id`);


create table `CDM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CCSDS_CDM_VERS` float,
 `CREATION_DATE` text,
 `ORIGINATOR` text,
 `MESSAGE_FOR` text,
 `MESSAGE_ID` text,
 `TCA` text,
 `MISS_DISTANCE` float,
 `RELATIVE_SPEED` float,
 `RELATIVE_POSITION_R` float,
 `RELATIVE_POSITION_T` float,
 `RELATIVE_POSITION_N` float,
 `RELATIVE_VELOCITY_R` float,
 `RELATIVE_VELOCITY_T` float,
 `RELATIVE_VELOCITY_N` float,
 `START_SCREEN_PERIOD` text,
 `STOP_SCREEN_PERIOD` text,
 `SCREEN_VOLUME_FRAME` float,
 `SCREEN_VOLUME_SHAPE` float,
 `SCREEN_VOLUME_X` float,
 `SCREEN_VOLUME_Y` float,
 `SCREEN_VOLUME_Z` float,
 `SCREEN_ENTRY_TIME` text,
 `SCREEN_EXIT_TIME` text,
 `COLLISION_PROBABILITY` float,
 `COLLISION_PROBABILITY_METHOD` text,
 `OBJECT1` integer,
 `OBJECT2` integer,
 `OBJECT1_DATASOURCE` integer,
 `OBJECT2_DATASOURCE` integer,
 primary key (
 `database_id`));


create index `cdm_file_id_index` on `CDM` (
 `file_id`);


create index `cdm_database_id_index` on `CDM` (
 `database_id`);


create index `cdm_object1_index` on `CDM` (
 `OBJECT1`);


create index `cdm_object2_index` on `CDM` (
 `OBJECT2`);


create index `cdm_object1_datasource_index` on `CDM` (
 `OBJECT1_DATASOURCE`);


create index `cdm_object2_datasource_index` on `CDM` (
 `OBJECT2_DATASOURCE`);


create table `CDMObject` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CDM_id` integer,
 `COMMENT` text,
 `OPERATOR_CONTACT_POSITION` text,
 `OPERATOR_ORGANIZATION` text,
 `EPHEMERIS_NAME` text,
 `COVARIANCE_METHOD` float,
 `REFERENCE_FRAME` float,
 `GRAVITY_MODEL` text,
 `ATMOSPHERIC_MODEL` text,
 `N_BODY_PERTURBATIONS` text,
 `SOLAR_RAD_PRESSURE` boolean,
 `EARTH_TIDES` boolean,
 `INTRACK_THRUST` boolean,
 `TIME_LASTOB_START` text,
 `TIME_LASTOB_END` text,
 `RECOMMENDED_OD_SPAN` float,
 `ACTUAL_OD_SPAN` float,
 `OBS_AVAILABLE` integer,
 `OBS_USED` integer,
 `TRACKS_AVAILABLE` integer,
 `TRACKS_USED` integer,
 `RESIDUALS_ACCEPTED` float,
 `WEIGHTED_RMS` float,
 `AREA_PC` float,
 `AREA_DRG` float,
 `AREA_SRP` float,
 `CR_AREA_OVER_MASS` float,
 `THRUST_ACCELERATION` float,
 `SEDR` float,
 `X` float,
 `Y` float,
 `Z` float,
 `X_DOT` float,
 `Y_DOT` float,
 `Z_DOT` float,
 `CR_R` float,
 `CT_R` float,
 `CT_T` float,
 `CN_R` float,
 `CN_T` float,
 `CN_N` float,
 `CRDOT_R` float,
 `CRDOT_T` float,
 `CRDOT_N` float,
 `CRDOT_RDOT` float,
 `CTDOT_R` float,
 `CTDOT_T` float,
 `CTDOT_N` float,
 `CTDOT_RDOT` float,
 `CTDOT_TDOT` float,
 `CNDOT_R` float,
 `CNDOT_T` float,
 `CNDOT_N` float,
 `CNDOT_RDOT` float,
 `CNDOT_TDOT` float,
 `CNDOT_NDOT` float,
 `CDRG_R` float,
 `CDRG_T` float,
 `CDRG_N` float,
 `CDRG_RDOT` float,
 `CDRG_TDOT` float,
 `CDRG_NDOT` float,
 `CDRG_DRG` float,
 `CSRP_R` float,
 `CSRP_T` float,
 `CSRP_N` float,
 `CSRP_RDOT` float,
 `CSRP_TDOT` float,
 `CSRP_NDOT` float,
 `CSRP_DRG` float,
 `CSRP_SRP` float,
 `CTHR_R` float,
 `CTHR_T` float,
 `CTHR_N` float,
 `CTHR_RDOT` float,
 `CTHR_TDOT` float,
 `CTHR_NDOT` float,
 `CTHR_DRG` float,
 `CTHR_SRP` float,
 `CTHR_THR` float,
 foreign key(
 `CDM_id`) references `CDM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `cdmobject_database_id_index` on `CDMObject` (
 `database_id`);


create index `cdmobject_cdm_id_index` on `CDMObject` (
 `CDM_id`);


create table `REC` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `version` text,
 `standard` text,
 primary key (
 `database_id`));


create index `rec_file_id_index` on `REC` (
 `file_id`);


create index `rec_database_id_index` on `REC` (
 `database_id`);


create table `Record` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `REC_id` integer,
 `value_type` float,
 foreign key(
 `REC_id`) references `REC`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `record_database_id_index` on `Record` (
 `database_id`);


create index `record_rec_id_index` on `Record` (
 `REC_id`);


create table `OEM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `CCSDS_OEM_VERS` float,
 `CREATION_DATE` text,
 `ORIGINATOR` text,
 primary key (
 `database_id`));


create index `oem_file_id_index` on `OEM` (
 `file_id`);


create index `oem_database_id_index` on `OEM` (
 `database_id`);


create table `ephemerisDataBlock` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `OEM_id` integer,
 `COMMENT` text,
 `OBJECT_NAME` text,
 `OBJECT_ID` text,
 `CENTER_NAME` text,
 `REFERENCE_FRAME` float,
 `REFERENCE_FRAME_EPOCH` text,
 `TIME_SYSTEM` float,
 `START_TIME` text,
 `USEABLE_START_TIME` text,
 `USEABLE_STOP_TIME` text,
 `STOP_TIME` text,
 `INTERPOLATION` text,
 `INTERPOLATION_DEGREE` integer,
 foreign key(
 `OEM_id`) references `OEM`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `ephemerisdatablock_database_id_index` on `ephemerisDataBlock` (
 `database_id`);


create index `ephemerisdatablock_oem_id_index` on `ephemerisDataBlock` (
 `OEM_id`);


create table `ephemerisDataLine` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ephemerisDataBlock_id` integer,
 `EPOCH` text,
 `X` float,
 `Y` float,
 `Z` float,
 `X_DOT` float,
 `Y_DOT` float,
 `Z_DOT` float,
 `X_DDOT` float,
 `Y_DDOT` float,
 `Z_DDOT` float,
 foreign key(
 `ephemerisDataBlock_id`) references `ephemerisDataBlock`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `ephemerisdataline_database_id_index` on `ephemerisDataLine` (
 `database_id`);


create index `ephemerisdataline_ephemerisdatablock_id_index` on `ephemerisDataLine` (
 `ephemerisDataBlock_id`);


create table `covarianceMatrixLine` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `ephemerisDataBlock_id` integer,
 `EPOCH` text,
 `COV_REFERENCE_FRAME` float,
 `CX_X` float,
 `CY_X` float,
 `CY_Y` float,
 `CZ_X` float,
 `CZ_Y` float,
 `CZ_Z` float,
 `CX_DOT_X` float,
 `CX_DOT_Y` float,
 `CX_DOT_Z` float,
 `CX_DOT_X_DOT` float,
 `CY_DOT_X` float,
 `CY_DOT_Y` float,
 `CY_DOT_Z` float,
 `CY_DOT_X_DOT` float,
 `CY_DOT_Y_DOT` float,
 `CZ_DOT_X` float,
 `CZ_DOT_Y` float,
 `CZ_DOT_Z` float,
 `CZ_DOT_X_DOT` float,
 `CZ_DOT_Y_DOT` float,
 `CZ_DOT_Z_DOT` float,
 foreign key(
 `ephemerisDataBlock_id`) references `ephemerisDataBlock`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `covariancematrixline_database_id_index` on `covarianceMatrixLine` (
 `database_id`);


create index `covariancematrixline_ephemerisdatablock_id_index` on `covarianceMatrixLine` (
 `ephemerisDataBlock_id`);


create table `TIM` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `TIME_SYSTEM` float,
 primary key (
 `database_id`));


create index `tim_file_id_index` on `TIM` (
 `file_id`);


create index `tim_database_id_index` on `TIM` (
 `database_id`);


create table `PRG` (
 `file_id` varchar(
 255),
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `NAME` text,
 `HD_KEY_PATH` text,
 `MESSAGE_TYPES` text,
 primary key (
 `database_id`));


create index `prg_file_id_index` on `PRG` (
 `file_id`);


create index `prg_database_id_index` on `PRG` (
 `database_id`);


create table `USR` (
 `database_id` integer not null,
 `created_at` datetime not null default CURRENT_TIMESTAMP,
 `updated_at` datetime not null default CURRENT_TIMESTAMP,
 `PRG_id` integer,
 `ID` text,
 `MESSAGE_TYPES` text,
 foreign key(
 `PRG_id`) references `PRG`(
 `id`) on delete CASCADE,
 primary key (
 `database_id`));


create index `usr_database_id_index` on `USR` (
 `database_id`);


create index `usr_prg_id_index` on `USR` (
 `PRG_id`)