#!/bin/bash

echo Garbage collecting Home Manager generations...
nix-store --gc

echo Removing old Home Manager generations...
nix-env --delete-generations old

echo Compact Home Manager database...
nix-collect-garbage

echo Done!
