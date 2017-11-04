# Copyright 2017 Sergei Sokolenko (@datancoffee) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


PROJECT_ID=$(gcloud config list --format 'value(core.project)' 2>/dev/null);
DATASET_ID=${DATASET_ID:-"sirocco_dict_en"}
GCS_BUCKET=${GCS_BUCKET:-"project_id/subbucket"}

gsutil cp ../src/main/resources/csdict/abbreviations-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.abbreviations gs://$GCS_BUCKET/temp/abbreviations-en.csv abbreviationsSchema.json

gsutil cp ../src/main/resources/csdict/degree-adv-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.degreeadverbs gs://$GCS_BUCKET/temp/degree-adv-en.csv degreeAdverbsSchema.json

gsutil cp ../src/main/resources/csdict/emotions-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.emotions gs://$GCS_BUCKET/temp/emotions-en.csv emotionsSchema.json

gsutil cp ../src/main/resources/csdict/idioms-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.idioms gs://$GCS_BUCKET/temp/idioms-en.csv idiomsSchema.json

gsutil cp ../src/main/resources/csdict/custom-idioms-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.customidioms gs://$GCS_BUCKET/temp/custom-idioms-en.csv idiomsSchema.json

gsutil cp ../src/main/resources/csdict/interjections-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.interjections gs://$GCS_BUCKET/temp/interjections-en.csv interjectionsSchema.json

gsutil cp ../src/main/resources/csdict/profanity-idioms-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.profanityidioms gs://$GCS_BUCKET/temp/profanity-idioms-en.csv profanityIdiomsSchema.json

gsutil cp ../src/main/resources/csdict/qualities-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.qualities gs://$GCS_BUCKET/temp/qualities-en.csv qualitiesSchema.json


gsutil cp ../src/main/resources/csdict/bfoverrides-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.bfoverrides gs://$GCS_BUCKET/temp/bfoverrides-en.csv bfoverridesSchema.json

gsutil cp ../src/main/resources/csdict/emoticons.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.emoticons gs://$GCS_BUCKET/temp/emoticons.csv emoticonsSchema.json

gsutil cp ../src/main/resources/csdict/modifiers-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.modifiers gs://$GCS_BUCKET/temp/modifiers-en.csv modifiersSchema.json

gsutil cp ../src/main/resources/csdict/negators-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.negators gs://$GCS_BUCKET/temp/negators-en.csv negatorsSchema.json

gsutil cp ../src/main/resources/csdict/patterns.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.patterns gs://$GCS_BUCKET/temp/patterns.csv patternsSchema.json

gsutil cp ../src/main/resources/csdict/prefixes-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.prefixes gs://$GCS_BUCKET/temp/prefixes-en.csv prefixesSchema.json

gsutil cp ../src/main/resources/csdict/substitutions-en.csv gs://$GCS_BUCKET/temp/
bq load --skip_leading_rows=1 --allow_jagged_rows=1 $DATASET_ID.substitutions gs://$GCS_BUCKET/temp/substitutions-en.csv substitutionsSchema.json







