#!/bin/bash
TIMESTAMP=$(date)

echo "script executed at: $TIMESTAMP"

NUMBER1=100
NUMBER2=200

SUM=$(($NUMBER1+$NUMBER2))

echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"

BIRTHDAY=$(time)

echo " I born excactly at $BIRTHDAY"