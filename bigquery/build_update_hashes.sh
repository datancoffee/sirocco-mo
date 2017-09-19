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

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.abbreviations`
SET keyhash = SUBSTR(TO_BASE64(SHA256(abbrev_key)),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.degreeadverbs`
SET keyhash = SUBSTR(TO_BASE64(SHA256(CONCAT(lemma_key,"/",pos_key))),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.emotions`
SET keyhash = SUBSTR(TO_BASE64(SHA256(CONCAT(lemma_key,"/",pos_key))),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.idioms`
SET keyhash = SUBSTR(TO_BASE64(SHA256(poslist_key)),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.customidioms`
SET keyhash = SUBSTR(TO_BASE64(SHA256(poslist_key)),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.interjections`
SET keyhash = SUBSTR(TO_BASE64(SHA256(interjection_key)),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.profanityidioms`
SET keyhash = SUBSTR(TO_BASE64(SHA256(poslist_key)),1,8)
WHERE true';

bq query --use_legacy_sql=false \
'UPDATE `'$PROJECT_ID'.'$DATASET_ID'.qualities`
SET keyhash = SUBSTR(TO_BASE64(SHA256(CONCAT(lemma_key,"/",pos_key))),1,8)
WHERE true';

