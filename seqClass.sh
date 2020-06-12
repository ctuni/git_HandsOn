#!/bin/bash
seq=$1
seq=$(echo $seq | tr a-z A-Z)  # Note we just added this line
if [[ $seq =~ ^[ACGTU]+$ ]]; then #This conditional structure checks the identity of the string
  if [[ $seq =~ T ]]; then #if it finds a T, it should look for U
  	if [[ $seq =~ U ]]; then #if it has found a U, it cant be DNA or RNA
    		echo "The sequence is not DNA nor RNA"
    	else
    		echo "The sequence is DNA" #if it only finds Ts, it should be DNA
    	fi
  elif [[ $seq =~ U ]]; then #if it fins a U, it should look for Ts
  	if [[ $seq =~ T ]]; then #if it has found a T, it cant be DNA or RNA
  		echo "The sequence is not DNA nor RNA"
  	else
  		echo "This sequence is RNA" #if it only finds Us, it should be RNA
  	fi	
  else
    echo "The sequence can be DNA or RNA"
  fi
else
  echo "The sequence is not DNA nor RNA"
fi
motif=$(echo $2 | tr a-z A-Z) #this structure searchs for a given motif in a given string
if [[ -n $motif ]]; then
  echo -en "Motif search enabled: looking for motif '$motif' in sequence '$seq'... "
  if [[ $seq =~ $motif ]]; then
    echo "FOUND :D"
  else
    echo "NOT FOUND :("
  fi
fi
