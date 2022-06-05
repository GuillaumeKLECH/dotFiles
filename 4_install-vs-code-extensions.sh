#!/bin/bash

while read p; do
  code --install-extension "$p"
done <vs-code-extensions-list
