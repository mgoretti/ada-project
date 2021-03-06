# [EPFL](http://www.epfl.ch/) [Applied Data Analysis](http://ada.epfl.ch/) Project

A demo can be found [here](http://52.174.16.86:5000/)

Slides [here](https://docs.google.com/presentation/d/1psaRhzOgpAPdy1Q8QbmdKBDVvNdupFURJEa9yMjkvuE/edit#slide=id.p)

## Structure
* Run the crawler to get matches
* Run the feature generating code on spark to generate features out of the matches
* Train the Model (Neural Network) on the features
* Reuse the trained model on the server

##Abstract
  This project will crawl publicly available **League of Legends** match information using the Riot api and apply a 2-step process to it. Firstly, we will extract player features. Secondly, we will feed them to a neural network predicting the winning chance in a new match based on the players' features and the role they will be playing.
  The features retained during the tuning of the model will be made available and visualized on a player page to show relevant information.

##Plan
  * Crawl the data from the api:
    * Previous matches of the players
    * Current division of the players (and historical if available)
  
  * Store the result of the api queries
  * Process it:
    for each player we will use the info about their previous matches to generate features for every match observation (using only information available at the time the match was played, so for example for match 10 we will only use info from match 1 to 9)

  * Train a neural network that fed historical features of present players predicts which team will win

##Data Description
  To sumarize, we will keep aggregated information (for every match) on player performance, role played, identity of the players and final result.
  This data will later be grouped by player and used to generate the features.

  * [Riot API](https://developer.riotgames.com/api/methods#!/1064/3671) - Basic information retained:
    * matchid (used to sort games by time)
    * matchType we only retain MATCHED_GAME
    * matchMode we only retain CLASSIC
    * queueType
    * region
    * participantIdentities
    * participants (KDA, firstBlood info, GPM, warding info, winner)

##Feasibility and Risks
  The large quantity of data available makes both crawling and processing a challenge. However, we can simply base the analysis on a subset (only one region) if we cannot manage to process everything. 
  
  A further complication of the riot api is the rate limitation (360k queries per hour), which will force us to setup a continuous ingestion system.
  
  Another challenge is identifying features that are relevant to prediction. This will be the most time consuming part and will mainly rely on the knowledge of the game of one of the team members.

##Deliverable:
  Viz of some features (scoring singular players, aggregated statistics per role, distribution of main role played by ranking)
  predicting platform that takes the id (name and region) and role of the present players and returns the winning chance of each side
