def --wrapped main [...rest] {
  nu -c $'use toolkit.nu; toolkit ($rest | str join " ")'
}

export def push-files-to-all-computers [] {
  ls ~/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances/*/minecraft/saves/*/computercraft/computer/
  | where type == dir
  | get name
  | each {|computer|
    ls *
    | where type == dir or name =~ '.lua$'
    | get name
    | each {|code|
      if ($computer | path join $code | path exists | not $in) {
        print $"Copying '($code)' to '($computer)'"
        cp $code $computer
      }
    }
  }
  null
}
