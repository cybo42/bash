#!/bin/bash


function ls-ec2-instances() {
  [[ -n "$AWS_PROFILE" ]] && echo "AWS_PROFILE=$AWS_PROFILE" && echo ""

  aws ec2 describe-instances --output json |  jq -r '.Reservations[].Instances[] | [.InstanceId, .State.Name,(.Tags[]?|select(.Key=="Name")|.Value) ] |@tsv '

}

function awsprof() {

  AWS_CONFIGFILE=$HOME/.aws/config
  
  profiles=($(cat $AWS_CONFIGFILE |perl -ne '(s/\[profile (.*?)\]/$1/ && print ) if /\[profile/'))
  
  FILTER=${1:-""}
  # present menu for user to choose which branch to checkout 
  PS3="Please choose your aws profile from your $AWS_CONFIGFILE: "
  echo ""
  
  COLUMNS=10
  select opt in "${profiles[@]}"
  do
      case $opt in
          *) 
              echo "switching to profile $opt ..."
              export AWS_PROFILE=$opt
              break
              ;; 
      esac
  done  
}
