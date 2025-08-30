#! /bin/bash

a=1
increment(){ 
  a=$((a+1))
  return
}
increment
echo "$a"