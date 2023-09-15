# hubot-chicago-sewage

### I don't use anything with hubot anymore, so this is archived.

A hubot script that checks to see if raw sewage is being dumped into Chicago rivers right now. Data is sourced from http://istheresewageinthechicagoriver.com/

See [`src/chicago-sewage.coffee`](src/chicago-sewage.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-chicago-sewage --save`

Then add **hubot-chicago-sewage** to your `external-scripts.json`:

```json
[
  "hubot-chicago-sewage"
]
```

## Sample Interaction

```
user1>> hubot sewage
hubot>> There is no raw sewage being dumped into Chicago rivers.
user2>> hubot sewage 09/18/2015
hubot>> There was raw sewage dumped into Chicago rivers on 09/18/2015!
        North Branch of Chicago River: Confluence with the North Shore Channel to Wolf Point
        Grand Calumet River: From confluence with the Little Calumet River to the Indiana state line
        Little Calumet River: Indiana state line to the Calumet-Sag Channel
        Calumet-Sag Channel: No details
```
