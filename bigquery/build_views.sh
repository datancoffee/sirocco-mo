
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
	exit 1
fi

if [ "$1" != "mk" ] && [ "$1" != "update" ]
  then
    echo "Invalid parameter value. Use one of {mk | update}"
	exit 1
fi


PROJECT_ID=$(gcloud config list --format 'value(core.project)' 2>/dev/null);
DATASET_ID=${DATASET_ID:-"sirocco_dict_en"}


bq $1 --use_legacy_sql=false --view=\
'SELECT shortkey, abbrev_key AS fullkey, "abbreviations" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.abbreviations`
UNION ALL
SELECT shortkey, CONCAT(lemma_key,"/",pos_key) AS fullkey, "degreeadverbs" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.degreeadverbs`
UNION ALL
SELECT shortkey, CONCAT(lemma_key,"/",pos_key) AS fullkey, "emotions" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.emotions`
UNION ALL
SELECT shortkey, poslist_key AS fullkey, "idioms" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.idioms`
UNION ALL
SELECT shortkey, poslist_key AS fullkey, "customidioms" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.customidioms`
UNION ALL
SELECT shortkey, interjection_key AS fullkey, "interjections" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.interjections`
UNION ALL
SELECT shortkey, poslist_key AS fullkey, "profanityidioms" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.profanityidioms`
UNION ALL
SELECT shortkey, CONCAT(lemma_key,"/",pos_key) AS fullkey, "qualities" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.qualities`
UNION ALL
SELECT shortkey, CONCAT(lemma_key,"/",pos_key) AS fullkey, "bfoverrides" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.bfoverrides`
UNION ALL
SELECT shortkey, emoticon_key AS fullkey, "emoticons" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.emoticons`
UNION ALL
SELECT shortkey, parsetype_key AS fullkey, "modifiers" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.modifiers`
UNION ALL
SELECT shortkey, CONCAT(lemma_key,"/",pos_key) AS fullkey, "negators" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.negators`
UNION ALL
SELECT shortkey, pattern_key AS fullkey, "patterns" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.patterns`
UNION ALL
SELECT shortkey, prefix_key AS fullkey, "prefixes" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.prefixes`
UNION ALL
SELECT shortkey, abbrev_key AS fullkey, "substitutions" AS signaltype
FROM `'$PROJECT_ID'.'$DATASET_ID'.substitutions`' \
$DATASET_ID.vwallsignals;


