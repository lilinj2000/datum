#!/usr/bin/awk -f

BEGIN {
  pre_time = ""
}

{
  if( pre_time != $1 )
  {
    pre_time=$1
    # print pre_time
    print $0
  }
  else
  {
    # print "repeat: ", $1
  }
  
}

END {
}
