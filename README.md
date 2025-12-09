# flutter_modular_app

A new Flutter project.

## Getting Started

## How to create a module ?
1- create directory
--> mkdir core

2 - --> cd core

3 - --> flutter create --template=package enter_modul_name_here

3 - --> flutter create --template=package data

==============================

1 - --> flutter create --template=package core/data


===============================

Install melos in project

1- dart pub add melos 
2- dart pub global activate melos 
3- export PATH="$PATH":"$HOME/.pub-cache/bin" 
4- dart pub outdated 
5- dart pub upgrade --major-versions 
6- open ~/.zshrc
7- export PATH="$JAVA_HOME/bin:$PATH:$HOME/.pub-cache/bin"

8- melos init 
   -- remove app and packages folder
   -- add melos.yaml
   -- inside melos add feature and core 