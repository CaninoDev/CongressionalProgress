# Congressional Progress
"If con- is the  opposite of pro-, what's the opposite of congress?


## Purpose
To provide a ruby based command-line-interface (CLI) to congressional voting records, party membership, and bill content. The user will be presented from a list of PLACEHOLDER, along with PLACEHOLDER and PLACEHOLDER. 

### Libraries and Underlying Technology
- Ruby 2.3.3 ( and the accomopanying standard libraries).
- [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord)

### Developer References
#### Bill Format:
```json
{
    "category": "string",
    "chamber": "h/s",
    "congress": "num",
    "date": "YYYY-MM-DDT24:00-00:00",
    "number": "num",
    "question": "string",
    "requires": "QUORUM",
    "result": "Passed",
    "result_text": "Passed",
    "session": "YYYY",
    "source_url": "http://url",
    "type": "Call of the House",
    "updated_at": "YYYY-MM-DDT24:00-00:00",
    "vote_id": "'h/hr/hjr/s/sj/sjr'-#-###.YYYY",
    "votes": {
        "Nay": [{REP_INFO}],
        "Not Voting": [{REP_INFO}],
        "Present": [{REP_INFO}],
            "Yea": [{REPO_INFO}]
        }]
    }
}
```
where REP_INFO is:
```json
   "display_name": "string",
   "id": "id",
   "party": "D/R/I",
   "state": "ST"
```
