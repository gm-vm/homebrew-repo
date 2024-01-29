cask "openfortivpn-webview" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "fba57dc144c1e04351ea3c05e41605abb4de7a7dbf111f4fdc165d4870b650a2",
         intel: "cafa5baa95fd163d0cd402a81daac811fea8482972a70aa2309831a913025ea1"

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
