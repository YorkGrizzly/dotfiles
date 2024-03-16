#!/bin/bash

function copydir {
  pwd | tr -d "\r\n" | pbcopy
}

