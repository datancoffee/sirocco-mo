# Sirocco Opinion Extraction Framework - Model Files

The Sirocco opinion extraction framework was first developed at [Cuesense](http://cuesense.com) in early 2010s. 
Since then it was updated and maintained by Sergei Sokolenko [@datancoffee](https://twitter.com/datancoffee). You can follow the news on Sirocco on [Twitter](https://twitter.com/datancoffee) and [Medium](https://medium.com/@datancoffee).

Use these model files together with the Sirocco Indexer to analyse text and find opinions and emotions using a framework of human emotions originally developed by Robert Plutchik, a professor at the Albert Einstein College of Medicine. Plutchik's [Wheel of Emotions](https://en.wikipedia.org/wiki/Contrasting_and_categorization_of_emotions) identifies 8 basic emotions: Joy, Acceptance, Fear, Surprise, Sadness, Disgust, Anger, Anticipation. 

## Repo Index

This repository has the following artifact folders and files:

* bigquery - A set of shell scripts and BigQuery table schema definition files in .json format to build a BigQuery dataset that has the full contents of the Sirocco Dictionary. 

* src/main/resources - Location of the Sirocco Dictionary, Apache OpenNLP model files, and WordNet config settings

- src/main/resources/csdict - Sirocco Dictionary, consisting of more than a dozen CSV files
- src/main/resources/opennlp15model-sa - OpenNLP 1.5 model files, with customizations (customization log in changelog.txt)
- src/main/resources/wordnet - contains res_properties.xml file that defines the WordNet dictionary files

* pom.xml - Maven pom file necessary for creating a jar containing all of the dictionary resources

## Roadmap

* We are looking for volunteers to help build a mobile app and Firebase database to gamefy the evaluation of idioms in context of real sentences. 
* English-language idioms will be sourced from publicly and privately available news datasets and discussion sites and presented in the mobile app.
* Mobile app users will evaluate the idioms on their emotional content and the results of their evaluations will be stored in the Firebase database. 
* These user-driven ratings would then eventually propagate into the Sirocco dictionaries (this repo, in CSV file format, and into BigQuery). 

## How to Build this Maven Project

You need to have Java 8 and Maven 3 installed.

Build and install the Sirocco Model Files library
```
mvn clean install
```

Alternatively, run the package and install steps separately (replace the version number in the jar file name to the one located in the pom.xml file)
```
mvn clean package
mvn install:install-file -Dfile=target/sirocco-mo-1.0.0.jar -DpomFile=pom.xml
```

## Useful Links

* [Sirocco Indexer](https://github.com/datancoffee/sirocco) github repository 
* [Dataflow Opinion Analysis](https://github.com/GoogleCloudPlatform/dataflow-opinion-analysis) project that uses the Sirocco Indexer and a plethora of Google Cloud tools such as Dataflow, Pub/Sub, BigQuery etc. to build an opinion analysis processing pipeline for news, threaded conversations in forums like Hacker News, Reddit, or Twitter and other user generated content.

## Want to Help or Get in Touch?

* Get in touch with @datancoffee on [Twitter](https://twitter.com/datancoffee) or [Medium](http://medium.com/@datancoffee) if you want to help with the project or need help.
