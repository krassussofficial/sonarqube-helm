#!/bin/bash

set -euo pipefail

curl -X POST https://slack.com/api/chat.postMessage \
  -H "Authorization: Bearer ${SLACK_TOKEN}" \
  -H 'Content-type: application/json; charset=utf-8' \
  --data-binary @- <<EOF
{
  "channel": "team-sq-devops",
	"blocks": [
		{
			"type": "header",
			"text": {
				"type": "plain_text",
				"text": "Trigger Release for Helm Charts has failed :hide-the-pain:",
				"emoji": true
			}
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "Cirrus CI task <https://cirrus-ci.com/task/$CIRRUS_TASK_ID|$CIRRUS_TASK_ID> failed on *<$CIRRUS_REPO_CLONE_URL|$CIRRUS_REPO_FULL_NAME>* ($CIRRUS_BRANCH)"
			}
		}
	]
}
EOF
