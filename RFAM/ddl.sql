create schema `Rfam`;
create table `Rfam`.`_annotated_file` (
  `rfam_acc` varchar(7) not null,
  `seed` blob not null,
  `cm` blob not null,
  `full` blob null
);
create table `Rfam`.`_family_file` (
  `rfam_acc` varchar(7) not null,
  `seed` blob not null,
  `cm` blob not null
);
create table `Rfam`.`_genome_data` (
  `data_file` text not null,
  `author` varchar(45) not null,
  `uuid` varchar(45) not null,
  `status` varchar(4) not null,
  `created` timestamp not null,
  `opened` timestamp null,
  `closed` timestamp null,
  `message` text null,
  `lsf_id` int unsigned null
);
create table `Rfam`.`_lock` (
  `locked` bit not null,
  `locker` varchar(10) not null,
  `allowCommits` bit not null,
  `alsoAllow` text null
);
create table `Rfam`.`_overlap` (
  `auto_overlap` int not null auto_increment,
  `id` varchar(40) null,
  `description` varchar(100) null,
  `author` text null,
  `comment` text null,
  constraint `PRIMARY`
    primary key (`auto_overlap`)
);
create table `Rfam`.`_overlap_membership` (
  `rfam_acc` varchar(7) not null,
  `auto_overlap` int not null
);
create table `Rfam`.`_post_process` (
  `rfam_acc` varchar(7) not null,
  `author` varchar(45) not null,
  `uuid` varchar(45) not null,
  `status` varchar(4) not null,
  `created` timestamp not null,
  `opened` timestamp null,
  `closed` timestamp null,
  `message` text null,
  `lsf_id` int unsigned null
);
create table `Rfam`.`alignment_and_tree` (
  `rfam_acc` varchar(7) not null,
  `type` varchar(9) not null,
  `alignment` blob null,
  `tree` blob null,
  `treemethod` text null,
  `average_length` double null,
  `percent_id` double null,
  `number_of_sequences` bigint null
);
create table `Rfam`.`author` (
  `author_id` int not null auto_increment,
  `name` varchar(20) not null,
  `last_name` varchar(50) null,
  `initials` varchar(4) null,
  `orcid` varchar(19) null,
  `synonyms` varchar(100) null,
  constraint `PRIMARY`
    primary key (`author_id`)
);
create table `Rfam`.`clan` (
  `clan_acc` varchar(7) not null,
  `id` varchar(40) null,
  `previous_id` text null,
  `description` varchar(100) null,
  `author` text null,
  `comment` text null,
  `created` timestamp not null,
  `updated` timestamp not null,
  constraint `PRIMARY`
    primary key (`clan_acc`)
);
create table `Rfam`.`clan_database_link` (
  `clan_acc` varchar(7) not null,
  `db_id` text not null,
  `comment` text null,
  `db_link` text not null,
  `other_params` text null
);
create table `Rfam`.`clan_literature_reference` (
  `clan_acc` varchar(7) not null,
  `pmid` int not null,
  `comment` text null,
  `order_added` tinyint null
);
create table `Rfam`.`clan_membership` (
  `clan_acc` varchar(7) not null,
  `rfam_acc` varchar(7) not null
);
create table `Rfam`.`database_link` (
  `rfam_acc` varchar(7) not null,
  `db_id` text not null,
  `comment` text null,
  `db_link` text not null,
  `other_params` text null
);
create table `Rfam`.`db_version` (
  `rfam_release` double not null,
  `rfam_release_date` timestamp not null,
  `number_families` int not null,
  `embl_release` text not null,
  `genome_collection_date` timestamp null,
  `refseq_version` int null,
  `pdb_date` timestamp null,
  `infernal_version` varchar(45) null,
  constraint `PRIMARY`
    primary key (`rfam_release`)
);
create table `Rfam`.`dead_clan` (
  `clan_acc` varchar(7) not null,
  `clan_id` varchar(40) not null,
  `comment` text null,
  `forward_to` varchar(7) null,
  `user` text not null
);
create table `Rfam`.`dead_family` (
  `rfam_acc` varchar(7) not null,
  `rfam_id` varchar(40) not null,
  `comment` text null,
  `forward_to` varchar(7) null,
  `title` varchar(150) null,
  `user` text not null
);
create table `Rfam`.`ensembl_names` (
  `insdc` varchar(50) not null,
  `ensembl` varchar(50) null,
  constraint `PRIMARY`
    primary key (`insdc`)
);
create table `Rfam`.`family` (
  `rfam_acc` varchar(7) not null,
  `rfam_id` varchar(40) not null,
  `auto_wiki` int unsigned not null,
  `description` varchar(75) null,
  `author` text null,
  `seed_source` text null,
  `gathering_cutoff` double null,
  `trusted_cutoff` double null,
  `noise_cutoff` double null,
  `comment` text null,
  `previous_id` text null,
  `cmbuild` text null,
  `cmcalibrate` text null,
  `cmsearch` text null,
  `num_seed` bigint null,
  `num_full` bigint null,
  `num_genome_seq` bigint null,
  `num_refseq` bigint null,
  `type` varchar(50) null,
  `structure_source` text null,
  `number_of_species` bigint null,
  `number_3d_structures` int null,
  `num_pseudonokts` int null,
  `tax_seed` text null,
  `ecmli_lambda` double null,
  `ecmli_mu` double null,
  `ecmli_cal_db` int null default 0,
  `ecmli_cal_hits` int null default 0,
  `maxl` int null default 0,
  `clen` int null default 0,
  `match_pair_node` bit null default false,
  `hmm_tau` double null,
  `hmm_lambda` double null,
  `created` timestamp not null,
  `updated` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`rfam_acc`)
);
create table `Rfam`.`family_author` (
  `rfam_acc` varchar(7) not null,
  `author_id` int not null,
  `desc_order` int not null
);
create table `Rfam`.`family_literature_reference` (
  `rfam_acc` varchar(7) not null,
  `pmid` int not null,
  `comment` text null,
  `order_added` tinyint null
);
create table `Rfam`.`family_long` (
  `rfam_acc` varchar(7) not null,
  `referenece_structure` text null,
  `reference_sequence` text null
);
create table `Rfam`.`family_ncbi` (
  `ncbi_id` int unsigned not null,
  `rfam_id` varchar(40) null,
  `rfam_acc` varchar(7) not null
);
create table `Rfam`.`features` (
  `rfamseq_acc` varchar(25) null,
  `database_id` varchar(50) not null,
  `primary_id` varchar(100) not null,
  `secondary_id` varchar(255) null,
  `feat_orient` tinyint not null default 0,
  `feat_start` bigint unsigned not null default 0,
  `feat_end` bigint unsigned not null default 0,
  `quaternary_id` varchar(150) null
);
create table `Rfam`.`full_region` (
  `rfam_acc` varchar(7) not null,
  `rfamseq_acc` varchar(25) not null,
  `seq_start` bigint unsigned not null default 0,
  `seq_end` bigint unsigned not null,
  `bit_score` double not null default 0.0,
  `evalue_score` varchar(15) not null default '0',
  `cm_start` int unsigned not null,
  `cm_end` int unsigned not null,
  `truncated` varchar(2) not null,
  `type` varchar(4) not null default 'full',
  `is_significant` tinyint unsigned not null
);
create table `Rfam`.`genome` (
  `upid` varchar(20) not null,
  `assembly_acc` varchar(20) null,
  `assembly_version` int unsigned null,
  `wgs_acc` varchar(20) null,
  `wgs_version` int unsigned null,
  `assembly_name` varchar(100) null,
  `assembly_level` varchar(15) null,
  `study_ref` varchar(20) null,
  `description` text null,
  `total_length` bigint null,
  `ungapped_length` bigint null,
  `circular` tinyint null,
  `ncbi_id` int unsigned not null,
  `scientific_name` varchar(300) null,
  `common_name` varchar(200) null,
  `kingdom` varchar(50) null,
  `num_rfam_regions` int null,
  `num_families` int null,
  `is_reference` bit not null default true,
  `is_representative` bit not null default false,
  `created` timestamp not null,
  `updated` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`upid`)
);
create table `Rfam`.`genome_temp` (
  `upid` varchar(20) not null,
  `assembly_acc` varchar(20) null,
  `assembly_version` int unsigned null,
  `wgs_acc` varchar(20) null,
  `wgs_version` int unsigned null,
  `assembly_name` varchar(100) null,
  `assembly_level` varchar(15) null,
  `study_ref` varchar(20) null,
  `description` text null,
  `total_length` bigint null,
  `ungapped_length` bigint null,
  `circular` tinyint null,
  `ncbi_id` int unsigned not null,
  `scientific_name` varchar(300) null,
  `common_name` varchar(200) null,
  `kingdom` varchar(50) null,
  `num_rfam_regions` int null,
  `num_families` int null,
  `is_reference` bit not null default true,
  `is_representative` bit not null default false,
  `created` timestamp not null,
  `updated` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`upid`)
);
create table `Rfam`.`genseq` (
  `upid` varchar(20) not null,
  `rfamseq_acc` varchar(25) null,
  `chromosome_name` varchar(100) null,
  `chromosome_type` varchar(100) null,
  `version` varchar(6) null
);
create table `Rfam`.`genseq_temp` (
  `upid` varchar(20) not null,
  `rfamseq_acc` varchar(25) null,
  `chromosome_name` varchar(100) null,
  `chromosome_type` varchar(100) null,
  `version` varchar(6) null
);
create table `Rfam`.`html_alignment` (
  `rfam_acc` varchar(7) not null,
  `type` varchar(16) not null,
  `html` blob null,
  `block` int not null,
  `html_alignmentscol` varchar(45) null
);
create table `Rfam`.`keywords` (
  `rfam_acc` varchar(7) not null,
  `rfam_id` varchar(40) null,
  `description` varchar(100) null default 'NULL',
  `rfam_general` text null,
  `literature` text null,
  `wiki` text null,
  `pdb_mappings` text null,
  `clan_info` text null,
  constraint `PRIMARY`
    primary key (`rfam_acc`)
);
create table `Rfam`.`literature_reference` (
  `pmid` int not null auto_increment,
  `title` text null,
  `author` text null,
  `journal` text null,
  constraint `PRIMARY`
    primary key (`pmid`)
);
create table `Rfam`.`matches_and_fasta` (
  `rfam_acc` varchar(7) not null,
  `match_list` blob null,
  `fasta` blob null,
  `type` varchar(7) not null
);
create table `Rfam`.`motif` (
  `motif_acc` varchar(7) not null,
  `motif_id` varchar(40) null,
  `description` varchar(75) null,
  `author` text null,
  `seed_source` text null,
  `gathering_cutoff` double null,
  `trusted_cutoff` double null,
  `noise_cutoff` double null,
  `cmbuild` text null,
  `cmcalibrate` text null,
  `type` varchar(50) null,
  `num_seed` bigint null,
  `average_id` double null,
  `average_sqlen` double null,
  `ecmli_lambda` double null,
  `ecmli_mu` double null,
  `ecmli_cal_db` int null default 0,
  `ecmli_cal_hits` int null default 0,
  `maxl` int null default 0,
  `clen` int null default 0,
  `match_pair_node` bit null default false,
  `hmm_tau` double null,
  `hmm_lambda` double null,
  `wiki` varchar(80) null,
  `created` timestamp not null,
  `updated` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`motif_acc`)
);
create table `Rfam`.`motif_database_link` (
  `motif_acc` varchar(7) not null,
  `db_id` text not null,
  `comment` text null,
  `db_link` text not null,
  `other_params` text null
);
create table `Rfam`.`motif_family_stats` (
  `rfam_acc` varchar(7) not null,
  `motif_acc` varchar(7) not null,
  `num_hits` int null,
  `frac_hits` decimal(4, 3) null,
  `sum_bits` decimal(12, 3) null,
  `avg_weight_bits` decimal(12, 3) null
);
create table `Rfam`.`motif_file` (
  `motif_acc` varchar(7) not null,
  `seed` blob not null,
  `cm` blob not null
);
create table `Rfam`.`motif_literature` (
  `motif_acc` varchar(7) not null,
  `pmid` int not null,
  `comment` text null,
  `order_added` tinyint null
);
create table `Rfam`.`motif_matches` (
  `motif_acc` varchar(7) not null,
  `rfam_acc` varchar(7) not null,
  `rfamseq_acc` varchar(25) null,
  `rfamseq_start` bigint null,
  `rfamseq_stop` bigint null,
  `query_start` int null,
  `query_stop` int null,
  `motif_start` int null,
  `motif_stop` int null,
  `e_value` varchar(15) null,
  `bit_score` double null
);
create table `Rfam`.`motif_old` (
  `motif_acc` varchar(7) not null,
  `motif_id` varchar(40) null,
  `description` varchar(75) null,
  `author` text null,
  `seed_source` text null,
  `gathering_cutoff` double null,
  `trusted_cutoff` double null,
  `noise_cutoff` double null,
  `cmbuild` text null,
  `cmcalibrate` text null,
  `type` varchar(50) null,
  `ecmli_lambda` double null,
  `ecmli_mu` double null,
  `ecmli_cal_db` int null default 0,
  `ecmli_cal_hits` int null default 0,
  `maxl` int null default 0,
  `clen` int null default 0,
  `match_pair_node` bit null default false,
  `hmm_tau` double null,
  `hmm_lambda` double null,
  `created` timestamp not null,
  `updated` timestamp not null default CURRENT_TIMESTAMP,
  constraint `PRIMARY`
    primary key (`motif_acc`)
);
create table `Rfam`.`motif_pdb` (
  `motif_acc` varchar(7) not null,
  `pdb_id` varchar(4) not null,
  `chain` varchar(4) null,
  `pdb_start` int null,
  `pdb_end` int null
);
create table `Rfam`.`motif_ss_image` (
  `rfam_acc` varchar(7) not null,
  `motif_acc` varchar(7) not null,
  `image` blob null
);
create table `Rfam`.`pdb` (
  `pdb_id` varchar(4) not null,
  `keywords` text null,
  `title` text null,
  `date` text null,
  `resolution` decimal(5, 2) null default 0.00,
  `method` text null,
  `author` text null,
  constraint `PRIMARY`
    primary key (`pdb_id`)
);
create table `Rfam`.`pdb_full_region` (
  `rfam_acc` varchar(7) not null,
  `pdb_id` varchar(4) not null,
  `chain` varchar(4) null,
  `pdb_start` int not null,
  `pdb_end` int not null,
  `bit_score` double not null default 0.0,
  `evalue_score` varchar(15) not null default '0',
  `cm_start` int not null,
  `cm_end` int not null,
  `hex_colour` varchar(6) null default 'NULL',
  `is_significant` bit not null default true
);
create table `Rfam`.`pdb_full_region_old` (
  `rfam_acc` varchar(7) not null,
  `pdb_id` varchar(4) not null,
  `chain` varchar(4) null,
  `pdb_start` int not null,
  `pdb_end` int not null,
  `bit_score` double not null default 0.0,
  `evalue_score` varchar(15) not null default '0',
  `cm_start` int not null,
  `cm_end` int not null,
  `hex_colour` varchar(6) null default 'NULL',
  `is_significant` bit not null default true
);
create table `Rfam`.`pdb_rfam_reg` (
  `auto_pdb_reg` int unsigned not null auto_increment,
  `rfam_acc` varchar(7) not null,
  `pdb_seq` varchar(6) not null,
  `pdb_id` varchar(4) not null,
  `chain` varchar(4) null default 'NULL',
  `pdb_res_start` int null,
  `pdb_res_end` int null,
  `rfamseq_acc` varchar(25) null,
  `seq_start` bigint unsigned null,
  `seq_end` bigint unsigned null,
  `hex_colour` varchar(6) null default 'NULL',
  constraint `PRIMARY`
    primary key (`auto_pdb_reg`)
);
create table `Rfam`.`pdb_sequence` (
  `pdb_seq` varchar(6) not null,
  `pdb_id` varchar(4) not null,
  `chain` varchar(1) null,
  constraint `PRIMARY`
    primary key (`pdb_seq`)
);
create table `Rfam`.`processed_data` (
  `rfam_acc` varchar(7) not null,
  `cm` blob null,
  `ss_stats_pbp` blob null,
  `ss_stats_seq` blob null,
  `ss_stats_fam` blob null,
  `scores_graph` blob null,
  `genome_full` text null,
  `genome_full_md5` varchar(32) null,
  `refseq_full` text null,
  `refseq_full_md5` varchar(32) null
);
create table `Rfam`.`pseudoknot` (
  `rfam_acc` varchar(7) not null,
  `pseudoknot_id` varchar(5) not null,
  `source` varchar(6) not null,
  `covariation` tinyint null default 0
);
create table `Rfam`.`refseq` (
  `refseq_acc` varchar(14) not null,
  `description` text null,
  `species` text null,
  `ncbi_taxid` int null,
  constraint `PRIMARY`
    primary key (`refseq_acc`)
);
create table `Rfam`.`refseq_full_region` (
  `rfam_acc` varchar(7) not null,
  `refseq_acc` varchar(14) not null,
  `seq_start` bigint unsigned not null default 0,
  `seq_end` bigint unsigned not null,
  `bit_score` double not null default 0.0,
  `evalue_score` varchar(15) not null default '0',
  `cm_start` int unsigned not null,
  `cm_end` int unsigned not null,
  `truncated` varchar(2) not null
);
create table `Rfam`.`rfamseq` (
  `rfamseq_acc` varchar(25) not null,
  `accession` varchar(25) not null,
  `version` int unsigned not null,
  `ncbi_id` int unsigned not null,
  `mol_type` varchar(15) not null,
  `length` int unsigned null default 0,
  `description` varchar(250) not null,
  `previous_acc` text null,
  `source` char(20) not null,
  constraint `PRIMARY`
    primary key (`rfamseq_acc`)
);
create table `Rfam`.`rfamseq_temp` (
  `rfamseq_acc` varchar(25) not null,
  `accession` varchar(25) not null,
  `version` int unsigned not null,
  `ncbi_id` int unsigned not null,
  `mol_type` varchar(15) not null,
  `length` int unsigned null default 0,
  `description` text null,
  `previous_acc` text null,
  `source` char(20) not null,
  constraint `PRIMARY`
    primary key (`rfamseq_acc`)
);
create table `Rfam`.`rnacentral_matches` (
  `rfamseq_acc` varchar(25) not null,
  `seq_start` bigint unsigned not null default 0,
  `seq_end` bigint unsigned not null,
  `md5` varchar(32) not null,
  `rnacentral_id` varchar(25) null,
  `type` varchar(4) null default 'full'
);
create table `Rfam`.`rscape_annotations` (
  `rfam_acc` varchar(10) not null,
  `F` float null,
  `sensitivity` float null,
  `ppv` float null,
  `true` int null,
  `found` int null,
  `tp` int null,
  `avgid` float null,
  `alen` int null,
  `nseq` int null,
  constraint `PRIMARY`
    primary key (`rfam_acc`)
);
create table `Rfam`.`secondary_structure_image` (
  `rfam_acc` varchar(7) not null,
  `type` varchar(10) null,
  `image` blob null
);
create table `Rfam`.`seed_region` (
  `rfam_acc` varchar(7) not null,
  `rfamseq_acc` varchar(25) null,
  `seq_start` bigint unsigned not null default 0,
  `seq_end` bigint unsigned not null,
  `md5` varchar(32) null
);
create table `Rfam`.`sunburst` (
  `rfam_acc` varchar(7) not null,
  `data` blob not null,
  `type` varchar(7) not null
);
create table `Rfam`.`taxonomic_tree` (
  `ncbi_code` int not null,
  `species` varchar(100) null,
  `taxonomy` text null,
  `lft` int null,
  `rgt` int null,
  `parent` varchar(100) null,
  `level` varchar(100) null,
  constraint `PRIMARY`
    primary key (`ncbi_code`)
);
create table `Rfam`.`taxonomy` (
  `ncbi_id` int unsigned not null default 0,
  `species` varchar(100) not null,
  `tax_string` text null,
  `tree_display_name` varchar(100) null,
  `align_display_name` varchar(112) null,
  constraint `PRIMARY`
    primary key (`ncbi_id`)
);
create table `Rfam`.`taxonomy_websearch` (
  `ncbi_id` int unsigned null default 0,
  `species` varchar(100) null,
  `rgt` int null,
  `taxonomy` text null,
  `lft` int null,
  `parent` int unsigned null,
  `level` varchar(200) null,
  `minimal` bit not null default false,
  `rank` varchar(100) null
);
create table `Rfam`.`version` (
  `rfam_release` double not null,
  `rfam_release_date` date not null,
  `number_families` int not null,
  `embl_release` text not null,
  constraint `PRIMARY`
    primary key (`rfam_release`)
);
create table `Rfam`.`wikitext` (
  `auto_wiki` int unsigned not null auto_increment,
  `title` varchar(150) not null,
  constraint `PRIMARY`
    primary key (`auto_wiki`)
);
alter table `Rfam`.`_family_file`
  add constraint `fk_table1_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`_overlap_membership`
  add constraint `fk_overlap_membership_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`_overlap_membership`
  add constraint `fk_overlap_membership_overlap1`
    foreign key (`auto_overlap`)
    references `Rfam`.`_overlap` (`auto_overlap`);
alter table `Rfam`.`_post_process`
  add constraint `fk_table1_family2`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`alignment_and_tree`
  add constraint `fk_alignments_and_trees_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`clan_database_link`
  add constraint `fk_clan_database_links_clan1`
    foreign key (`clan_acc`)
    references `Rfam`.`clan` (`clan_acc`);
alter table `Rfam`.`clan_literature_reference`
  add constraint `fk_clan_literature_references_clan1`
    foreign key (`clan_acc`)
    references `Rfam`.`clan` (`clan_acc`);
alter table `Rfam`.`clan_literature_reference`
  add constraint `fk_clan_literature_references_literature_reference1`
    foreign key (`pmid`)
    references `Rfam`.`literature_reference` (`pmid`);
alter table `Rfam`.`clan_membership`
  add constraint `fk_clan_membership_clan1`
    foreign key (`clan_acc`)
    references `Rfam`.`clan` (`clan_acc`);
alter table `Rfam`.`clan_membership`
  add constraint `fk_clan_membership_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`database_link`
  add constraint `fk_rfam_database_link_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`family`
  add constraint `fk_family_wikitext1`
    foreign key (`auto_wiki`)
    references `Rfam`.`wikitext` (`auto_wiki`);
alter table `Rfam`.`family_literature_reference`
  add constraint `fk_family_literature_reference_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`family_literature_reference`
  add constraint `fk_family_literature_reference_literature_reference1`
    foreign key (`pmid`)
    references `Rfam`.`literature_reference` (`pmid`);
alter table `Rfam`.`family_long`
  add constraint `fk_family_long_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`family_ncbi`
  add constraint `fk_family_ncbi_taxonomy1`
    foreign key (`ncbi_id`)
    references `Rfam`.`taxonomy` (`ncbi_id`);
alter table `Rfam`.`family_ncbi`
  add constraint `fk_rfam_ncbi_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`features`
  add constraint `fk_features_rfamseq1`
    foreign key (`rfamseq_acc`)
    references `Rfam`.`rfamseq` (`rfamseq_acc`);
alter table `Rfam`.`full_region`
  add constraint `fk_full_region_family_cascade`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`full_region`
  add constraint `fk_full_region_rfamseq1_cascase`
    foreign key (`rfamseq_acc`)
    references `Rfam`.`rfamseq` (`rfamseq_acc`);
alter table `Rfam`.`html_alignment`
  add constraint `fk_html_alignments_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`matches_and_fasta`
  add constraint `fk_matches_and_fasta_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`motif_database_link`
  add constraint `motif_database_link_ibfk_1`
    foreign key (`motif_acc`)
    references `Rfam`.`motif` (`motif_acc`);
alter table `Rfam`.`motif_family_stats`
  add constraint `motif_family_stats_motif_acc`
    foreign key (`motif_acc`)
    references `Rfam`.`motif_old` (`motif_acc`);
alter table `Rfam`.`motif_family_stats`
  add constraint `motif_family_stats_rfam_acc`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`motif_file`
  add constraint `fk_motif_file_motif`
    foreign key (`motif_acc`)
    references `Rfam`.`motif` (`motif_acc`);
alter table `Rfam`.`motif_literature`
  add constraint `motif_literature_motif_acc`
    foreign key (`motif_acc`)
    references `Rfam`.`motif_old` (`motif_acc`);
alter table `Rfam`.`motif_literature`
  add constraint `motif_literature_pmid`
    foreign key (`pmid`)
    references `Rfam`.`literature_reference` (`pmid`);
alter table `Rfam`.`motif_matches`
  add constraint `motif_match_motif_acc`
    foreign key (`motif_acc`)
    references `Rfam`.`motif_old` (`motif_acc`);
alter table `Rfam`.`motif_matches`
  add constraint `motif_match_rfam_acc`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`motif_matches`
  add constraint `motif_match_rfamseq_acc`
    foreign key (`rfamseq_acc`)
    references `Rfam`.`rfamseq` (`rfamseq_acc`);
alter table `Rfam`.`motif_pdb`
  add constraint `motif_pdb_motif_acc`
    foreign key (`motif_acc`)
    references `Rfam`.`motif_old` (`motif_acc`);
alter table `Rfam`.`motif_ss_image`
  add constraint `fk_motif_ss_images_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`motif_ss_image`
  add constraint `fk_motif_ss_images_motif1`
    foreign key (`motif_acc`)
    references `Rfam`.`motif_old` (`motif_acc`);
alter table `Rfam`.`pdb_rfam_reg`
  add constraint `fk_pdb_rfam_reg_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`pdb_rfam_reg`
  add constraint `fk_pdb_rfam_reg_pdb1`
    foreign key (`pdb_id`)
    references `Rfam`.`pdb` (`pdb_id`);
alter table `Rfam`.`pdb_rfam_reg`
  add constraint `fk_pdb_rfam_reg_pdb_sequence1`
    foreign key (`pdb_seq`)
    references `Rfam`.`pdb_sequence` (`pdb_seq`);
alter table `Rfam`.`pdb_rfam_reg`
  add constraint `fk_pdb_rfam_reg_rfamseq1`
    foreign key (`rfamseq_acc`)
    references `Rfam`.`rfamseq` (`rfamseq_acc`);
alter table `Rfam`.`pdb_sequence`
  add constraint `fk_pdb_sequence_pdb1`
    foreign key (`pdb_id`)
    references `Rfam`.`pdb` (`pdb_id`);
alter table `Rfam`.`processed_data`
  add constraint `fk_rfam_CM_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`pseudoknot`
  add constraint `fk_family_pseudoknot`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`refseq_full_region`
  add constraint `fk_full_region_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`refseq_full_region`
  add constraint `fk_refseq_full_region_refseq1`
    foreign key (`refseq_acc`)
    references `Rfam`.`refseq` (`refseq_acc`);
alter table `Rfam`.`rfamseq`
  add constraint `fk_rfamseq_taxonomy1`
    foreign key (`ncbi_id`)
    references `Rfam`.`taxonomy` (`ncbi_id`);
alter table `Rfam`.`secondary_structure_image`
  add constraint `fk_secondary_structure_images_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`seed_region`
  add constraint `fk_rfam_reg_seed_family1`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
alter table `Rfam`.`seed_region`
  add constraint `fk_rfam_reg_seed_rfamseq1`
    foreign key (`rfamseq_acc`)
    references `Rfam`.`rfamseq` (`rfamseq_acc`);
alter table `Rfam`.`sunburst`
  add constraint `fk_table1_family3`
    foreign key (`rfam_acc`)
    references `Rfam`.`family` (`rfam_acc`);
comment on column `Rfam`.`_lock`.`allowCommits` is 'Do you lock individual families? Do ever lock the whole database?';
comment on column `Rfam`.`dead_clan`.`clan_id` is 'Added. Add author?';
comment on column `Rfam`.`dead_family`.`rfam_acc` is 'record the author???';
comment on column `Rfam`.`dead_family`.`title` is 'wikipedia page title
';
comment on column `Rfam`.`family_ncbi`.`rfam_id` is 'Is this really needed?';
comment on column `Rfam`.`full_region`.`bit_score` is '99999.99 is the approx limit from Infernal.';
comment on column `Rfam`.`genome`.`upid` is 'This should be ';
comment on column `Rfam`.`genome_temp`.`upid` is 'This should be ';
comment on column `Rfam`.`genseq`.`upid` is 'This should be ';
comment on column `Rfam`.`genseq_temp`.`upid` is 'This should be ';
comment on column `Rfam`.`refseq_full_region`.`bit_score` is '99999.99 is the approx limit from Infernal.';
comment on column `Rfam`.`rfamseq`.`rfamseq_acc` is 'This should be ';
comment on column `Rfam`.`rfamseq_temp`.`rfamseq_acc` is 'This should be ';
create index `fk_annotated_file_rfam_acc_idx` on `Rfam`.`_annotated_file`(`rfam_acc` asc);
create unique index `unique_rfam_acc` on `Rfam`.`_annotated_file`(`rfam_acc` asc);
create index `fk_table1_family1_idx` on `Rfam`.`_family_file`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`_overlap`(`auto_overlap` asc);
create index `fk_overlap_membership_family1_idx` on `Rfam`.`_overlap_membership`(`rfam_acc` asc);
create index `fk_overlap_membership_overlap1_idx` on `Rfam`.`_overlap_membership`(`auto_overlap` asc);
create index `fk_table1_family2_idx` on `Rfam`.`_post_process`(`rfam_acc` asc);
create index `fk_alignments_and_trees_family1_idx` on `Rfam`.`alignment_and_tree`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`author`(`author_id` asc);
create unique index `author_id` on `Rfam`.`author`(`author_id` asc);
create unique index `PRIMARY` on `Rfam`.`clan`(`clan_acc` asc);
create unique index `clan_acc` on `Rfam`.`clan`(`clan_acc` asc);
create unique index `clan_acc_2` on `Rfam`.`clan`(`clan_acc` asc);
create index `fk_clan_database_links_clan1_idx` on `Rfam`.`clan_database_link`(`clan_acc` asc);
create index `fk_clan_literature_references_clan1_idx` on `Rfam`.`clan_literature_reference`(`clan_acc` asc);
create index `fk_clan_literature_references_literature_reference1_idx` on `Rfam`.`clan_literature_reference`(`pmid` asc);
create unique index `UniqueFamilyIdx` on `Rfam`.`clan_membership`(`rfam_acc` asc);
create index `fk_clan_membership_clan1_idx` on `Rfam`.`clan_membership`(`clan_acc` asc);
create index `fk_clan_membership_family1_idx` on `Rfam`.`clan_membership`(`rfam_acc` asc);
create index `fk_rfam_database_link_family1_idx` on `Rfam`.`database_link`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`db_version`(`rfam_release` asc);
create unique index `rfam_acc` on `Rfam`.`dead_clan`(`clan_acc` asc);
create unique index `rfam_acc` on `Rfam`.`dead_family`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`ensembl_names`(`insdc` asc);
create unique index `PRIMARY` on `Rfam`.`family`(`rfam_acc` asc);
create index `fk_family_wikitext1_idx` on `Rfam`.`family`(`auto_wiki` asc);
create unique index `rfam_acc` on `Rfam`.`family`(`rfam_acc` asc);
create index `rfam_id` on `Rfam`.`family`(`rfam_id` asc);
create index `fk_family_literature_reference_family1_idx` on `Rfam`.`family_literature_reference`(`rfam_acc` asc);
create index `fk_family_literature_reference_literature_reference1_idx` on `Rfam`.`family_literature_reference`(`pmid` asc);
create index `fk_family_long_family1_idx` on `Rfam`.`family_long`(`rfam_acc` asc);
create index `fk_family_ncbi_taxonomy1_idx` on `Rfam`.`family_ncbi`(`ncbi_id` asc);
create index `fk_rfam_ncbi_family1_idx` on `Rfam`.`family_ncbi`(`rfam_acc` asc);
create index `fk_features_rfamseq1_idx` on `Rfam`.`features`(`rfamseq_acc` asc);
create index `fk_full_region_rfamseq1_cascase` on `Rfam`.`full_region`(`rfamseq_acc` asc);
create index `full_region_acc_sign` on `Rfam`.`full_region`(
  `rfam_acc` asc,
  `is_significant` asc
);
create index `full_region_sign` on `Rfam`.`full_region`(`is_significant` asc);
create unique index `PRIMARY` on `Rfam`.`genome`(`upid` asc);
create index `ncbi_id` on `Rfam`.`genome`(`ncbi_id` asc);
create unique index `upid` on `Rfam`.`genome`(`upid` asc);
create unique index `PRIMARY` on `Rfam`.`genome_temp`(`upid` asc);
create index `ncbi_id` on `Rfam`.`genome_temp`(`ncbi_id` asc);
create unique index `upid` on `Rfam`.`genome_temp`(`upid` asc);
create index `rfamseq_acc` on `Rfam`.`genseq`(`rfamseq_acc` asc);
create index `upid` on `Rfam`.`genseq`(`upid` asc);
create index `rfamseq_acc` on `Rfam`.`genseq_temp`(`rfamseq_acc` asc);
create index `upid` on `Rfam`.`genseq_temp`(`upid` asc);
create index `fk_html_alignments_family1_idx` on `Rfam`.`html_alignment`(`rfam_acc` asc);
create index `htmlBlockIdx` on `Rfam`.`html_alignment`(`block` asc);
create index `htmlTypeIdx` on `Rfam`.`html_alignment`(`type` asc);
create unique index `PRIMARY` on `Rfam`.`keywords`(`rfam_acc` asc);
create index `rfam_kw_idx` on `Rfam`.`keywords`(
  `description` asc,
  `rfam_general` asc,
  `literature` asc,
  `wiki` asc,
  `pdb_mappings` asc,
  `clan_info` asc
);
create unique index `PRIMARY` on `Rfam`.`literature_reference`(`pmid` asc);
create index `fk_matches_and_fasta_family1_idx` on `Rfam`.`matches_and_fasta`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`motif`(`motif_acc` asc);
create index `motif_id` on `Rfam`.`motif`(`motif_id` asc);
create index `motif_acc` on `Rfam`.`motif_database_link`(`motif_acc` asc);
create index `motif_family_stats_motif_acc_idx` on `Rfam`.`motif_family_stats`(`motif_acc` asc);
create index `motif_family_stats_rfam_acc_idx` on `Rfam`.`motif_family_stats`(`rfam_acc` asc);
create index `fk_motif_file_motif_idx` on `Rfam`.`motif_file`(`motif_acc` asc);
create index `motif_literature_motif_acc` on `Rfam`.`motif_literature`(`motif_acc` asc);
create index `motif_literature_pmid_idx` on `Rfam`.`motif_literature`(`pmid` asc);
create index `motif_match_motif_acc_idx` on `Rfam`.`motif_matches`(`motif_acc` asc);
create index `motif_match_rfam_acc_idx` on `Rfam`.`motif_matches`(`rfam_acc` asc);
create index `motif_match_rfamseq_acc_idx` on `Rfam`.`motif_matches`(`rfamseq_acc` asc);
create unique index `PRIMARY` on `Rfam`.`motif_old`(`motif_acc` asc);
create index `motif_id` on `Rfam`.`motif_old`(`motif_id` asc);
create index `motif_pdb_motif_acc_idx` on `Rfam`.`motif_pdb`(`motif_acc` asc);
create index `motif_pdb_pdb_idx` on `Rfam`.`motif_pdb`(`pdb_id` asc);
create index `fk_motif_ss_images_family1_idx` on `Rfam`.`motif_ss_image`(`rfam_acc` asc);
create index `fk_motif_ss_images_motif1_idx` on `Rfam`.`motif_ss_image`(`motif_acc` asc);
create unique index `PRIMARY` on `Rfam`.`pdb`(`pdb_id` asc);
create index `fk_pdb_rfam_reg_family1_idx` on `Rfam`.`pdb_full_region`(`rfam_acc` asc);
create index `fk_pdb_rfam_reg_pdb1_idx` on `Rfam`.`pdb_full_region`(`pdb_id` asc);
create index `is_significant` on `Rfam`.`pdb_full_region`(`is_significant` asc);
create index `rfam_acc` on `Rfam`.`pdb_full_region`(`rfam_acc` asc);
create index `fk_pdb_rfam_reg_family1_idx` on `Rfam`.`pdb_full_region_old`(`rfam_acc` asc);
create index `fk_pdb_rfam_reg_pdb1_idx` on `Rfam`.`pdb_full_region_old`(`pdb_id` asc);
create index `is_significant` on `Rfam`.`pdb_full_region_old`(`is_significant` asc);
create index `rfam_acc` on `Rfam`.`pdb_full_region_old`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`pdb_rfam_reg`(`auto_pdb_reg` asc);
create index `fk_pdb_rfam_reg_family1_idx` on `Rfam`.`pdb_rfam_reg`(`rfam_acc` asc);
create index `fk_pdb_rfam_reg_pdb1_idx` on `Rfam`.`pdb_rfam_reg`(`pdb_id` asc);
create index `fk_pdb_rfam_reg_pdb_sequence1_idx` on `Rfam`.`pdb_rfam_reg`(`pdb_seq` asc);
create index `fk_pdb_rfam_reg_rfamseq1_idx` on `Rfam`.`pdb_rfam_reg`(`rfamseq_acc` asc);
create unique index `PRIMARY` on `Rfam`.`pdb_sequence`(`pdb_seq` asc);
create index `fk_pdb_sequence_pdb1_idx` on `Rfam`.`pdb_sequence`(`pdb_id` asc);
create index `fk_rfam_CM_family1_idx` on `Rfam`.`processed_data`(`rfam_acc` asc);
create index `pseudoknot_id_key` on `Rfam`.`pseudoknot`(`pseudoknot_id` asc);
create index `rfam_acc_key` on `Rfam`.`pseudoknot`(`rfam_acc` asc);
create index `source_key` on `Rfam`.`pseudoknot`(`source` asc);
create unique index `PRIMARY` on `Rfam`.`refseq`(`refseq_acc` asc);
create index `fk_full_region_family_idx` on `Rfam`.`refseq_full_region`(`rfam_acc` asc);
create index `fk_refseq_full_region_refseq1_idx` on `Rfam`.`refseq_full_region`(`refseq_acc` asc);
create unique index `PRIMARY` on `Rfam`.`rfamseq`(`rfamseq_acc` asc);
create index `fk_rfamseq_taxonomy1_idx` on `Rfam`.`rfamseq`(`ncbi_id` asc);
create unique index `rfamseq_acc` on `Rfam`.`rfamseq`(`rfamseq_acc` asc);
create index `version` on `Rfam`.`rfamseq`(`version` asc);
create unique index `PRIMARY` on `Rfam`.`rfamseq_temp`(`rfamseq_acc` asc);
create index `fk_rfamseq_taxonomy1_idx` on `Rfam`.`rfamseq_temp`(`ncbi_id` asc);
create unique index `rfamseq_acc` on `Rfam`.`rfamseq_temp`(`rfamseq_acc` asc);
create index `version` on `Rfam`.`rfamseq_temp`(`version` asc);
create index `rfamseq_acc` on `Rfam`.`rnacentral_matches`(`rfamseq_acc` asc);
create index `rnacentral_id` on `Rfam`.`rnacentral_matches`(`rnacentral_id` asc);
create index `seq_end` on `Rfam`.`rnacentral_matches`(`seq_end` asc);
create index `seq_start` on `Rfam`.`rnacentral_matches`(`seq_start` asc);
create unique index `PRIMARY` on `Rfam`.`rscape_annotations`(`rfam_acc` asc);
create index `fk_secondary_structure_images_family1_idx` on `Rfam`.`secondary_structure_image`(`rfam_acc` asc);
create index `secondatStructureTypeIdx` on `Rfam`.`secondary_structure_image`(`type` asc);
create index `fk_rfam_reg_seed_family1_idx` on `Rfam`.`seed_region`(`rfam_acc` asc);
create index `fk_rfam_reg_seed_rfamseq1_idx` on `Rfam`.`seed_region`(`rfamseq_acc` asc);
create index `fk_table1_family3_idx` on `Rfam`.`sunburst`(`rfam_acc` asc);
create unique index `PRIMARY` on `Rfam`.`taxonomic_tree`(`ncbi_code` asc);
create unique index `PRIMARY` on `Rfam`.`taxonomy`(`ncbi_id` asc);
create index `species` on `Rfam`.`taxonomy`(`species` asc);
create index `minimal_idx` on `Rfam`.`taxonomy_websearch`(`minimal` asc);
create index `ncbi_id_idx` on `Rfam`.`taxonomy_websearch`(`ncbi_id` asc);
create index `parent` on `Rfam`.`taxonomy_websearch`(`parent` asc);
create index `taxonomy_level_text_idx` on `Rfam`.`taxonomy_websearch`(`level` asc);
create index `taxonomy_lft_idx` on `Rfam`.`taxonomy_websearch`(`lft` asc);
create index `taxonomy_rgt_idx` on `Rfam`.`taxonomy_websearch`(`rgt` asc);
create index `taxonomy_species_text_idx` on `Rfam`.`taxonomy_websearch`(`species` asc);
create unique index `PRIMARY` on `Rfam`.`version`(`rfam_release` asc);
create unique index `PRIMARY` on `Rfam`.`wikitext`(`auto_wiki` asc);
create unique index `title_UNIQUE` on `Rfam`.`wikitext`(`title` asc);