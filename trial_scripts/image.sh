#!/bin/bash
GOOGLE_CONTAINER_REGISTRY="gcr.io"
PROJECT_ID="jenkins-trial-385107"
mkdir sample
cd sample
gsutil cp gs://sample-microservice-1/sample/image.tgz image.tgz
tar xvf image.tgz
cd image/target
ls
image=$(cat jib-image.json | grep -Eo '"image"[^,]*' | grep -Eo '[^:]*$' | sed 's/ //g' | sed -e 's/^"//' -e 's/"$//')
echo "${image}"
x=\"tags\":[\"latest\"]
echo "$x"
#tags=$(cat jib-image.json | grep -Eo '"tags"[^,]*' | grep -Eo '[^:]*$' | sed 's/[][]//g')
tags_t=$(cat jib-image.json | grep -Eo '"tags"[^,]*')
echo "$tags_t"
tags_tt=$(grep -Eo '[^:]*$' <<< "${tags_t}")
#echo "$tags_tt"
tags_ttt=$(sed 's/[][]//g' <<< "${tags_tt}")
echo "$tags_ttt"
tagging_test=latest
tagging=\"${tagging_test}\"
diff <( printf '%s\n' "${tags_ttt}" ) <( printf '%s\n' "${tagging}" )
if [ ${tags_t} > ${x} ]; then
echo "Tags ttt win"
elif [ ${tags_ttt} < ${tagging} ]; then
echo "Tagging wins"
else
echo "Equal"
fi
#tagging_test=latest
#tagging=\"${tagging_test}\"
echo $tagging
tags_tttt=$(sed -e 's/"$//' <<< "${tagging}")
echo "$tags_tttt"
#image_t=$(sed -e 's/^"//' -e 's/"$//' <<< "${tags_t}")
#x="${image_t%\"}"
#echo "$x"
#echo "${tags_t}"
#echo "${GOOGLE_CONTAINER_REGISTRY}/${PROJECT_ID}/${image}:${tags}"

