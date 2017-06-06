#!/bin/bash
#Author: Tegan Burns
#Website: teganburns.com

## USAGE ##
#    query	string	A literal string to search for in the Knowledge Graph.
#    ids	string	A list of entity IDs to search for in the Knowledge Graph. To specify multiple IDs in the HTTP request, repeat the parameter in the URL as in ...?ids=A&ids=B
#    languages	string	The list of language codes (defined in ISO 639) to run the query with, for instance en.
#    types	string	Restricts returned entities to those of the specified types. For example, you can specify Person (as defined in http://schema.org/Person) to restrict the results to entities representing people.
#       If multiple types are specified, returned entities will contain one or more of these types.
#    
#    indent	boolean	Enables indenting of JSON results.
#    prefix	boolean	Enables prefix (initial substring) match against names and aliases of entities. For example, a prefix Jung will match entities and aliases such as Jung, Jungle, and Jung-ho Kang.
#    limit	number	Limits the number of entities to be returned.

URL_API="https://kgsearch.googleapis.com/v1/entities:search?"
QUERY="taylor+swift"
## YOU'RE GOING TO NEED TO PROVIDE YOUR OWN GCS API KEY ##
KEY="YOUR_KEY_HERE"
LIMIT="5"
INDENT="True"
LANGUAGES="en"
PREFIX="True"

if [ $# -gt 0 ];then
    
    tmp="$@"
    #IDS=${tmp/ /\+}
    QUERY=${tmp/ /\+}
    #REQUEST="${URL_API}ids=${IDS}&key=${KEY}&limit=${LIMIT}&indent=${INDENT}&languages=${LANGUAGES}&prefix=${PREFIX}"
    REQUEST="${URL_API}query=${QUERY}&key=${KEY}&limit=${LIMIT}&indent=${INDENT}&languages=${LANGUAGES}&prefix=${PREFIX}"
    echo $REQUEST

    curl $REQUEST
fi
exit

