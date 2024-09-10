cask "openfortivpn-webview" do
  arch arm: "arm64", intel: "x64"

  version "1.2.1"
  sha256 arm:   "a0fabc62f31420b738e4e06438c76d3226dbd5dae3637dabb81369259dc65108",
         intel: "684e9c09faeee5085168ce57feff9bd9b1e460832010431291bed54bc488255f"

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
