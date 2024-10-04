cask "openfortivpn-webview" do
  arch arm: "arm64", intel: "x64"

  version "1.2.3"
  sha256 arm:   "80e21c4c5ca16d2c16b8a4df847afb1274e31d514ffd2fd2f5766400dd3575d1",
         intel: "f4bdf187d9ce99feef97b2d83213545f0b5ec08c11a8eaa94517cae81b8aac3c"

  url "https://github.com/gm-vm/openfortivpn-webview/releases/download/v#{version}-electron/openfortivpn-webview-#{version}-#{arch}.dmg"
  name "openfortivpn-webview"
  homepage "https://github.com/gm-vm/openfortivpn-webview"

  wrapper_script = "#{staged_path}/openfortivpn-webview.sh"
  binary wrapper_script, target: "openfortivpn-webview"

  preflight do
    File.write wrapper_script, <<~EOS
      #!/bin/sh
      "#{staged_path}/openfortivpn-webview.app/Contents/MacOS/openfortivpn-webview" "$@"
    EOS
  end

  zap trash: "~/Library/Application Support/openfortivpn-webview/"
end
