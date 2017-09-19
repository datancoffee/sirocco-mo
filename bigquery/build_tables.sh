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

bq $1 --schema=abbreviationsSchema.json -t $DATASET_ID.abbreviations
bq $1 --schema=degreeAdverbsSchema.json -t $DATASET_ID.degreeadverbs
bq $1 --schema=emotionsSchema.json -t $DATASET_ID.emotions
bq $1 --schema=idiomsSchema.json -t $DATASET_ID.idioms
bq $1 --schema=idiomsSchema.json -t $DATASET_ID.customidioms
bq $1 --schema=interjectionsSchema.json -t $DATASET_ID.interjections
bq $1 --schema=profanityIdiomsSchema.json -t $DATASET_ID.profanityidioms
bq $1 --schema=qualitiesSchema.json -t $DATASET_ID.qualities



