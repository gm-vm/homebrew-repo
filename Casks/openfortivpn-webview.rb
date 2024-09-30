cask "openfortivpn-webview" do
  arch arm: "arm64", intel: "x64"

  version "1.2.2"
  sha256 arm:   "01f1632b01071648d4eff24d961d4f06ecde26acadf9ad23c0ef148c0436edb7",
         intel: "73e5725471ac65397d1d18aa28b3adf318a9562ea9218a656eae8fc4dccf2365"

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
