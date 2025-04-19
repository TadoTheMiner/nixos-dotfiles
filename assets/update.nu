#!/usr/bin/env nu
let successful = try {
  nh os switch --update
  true
} catch {
  false
}
if $successful {
  git add .; git commit -m (nixos-rebuild list-generations | grep current); git push
}
