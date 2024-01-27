cask "openfortivpn-webview" do
  version "1.1.3"
  arch arm: "arm64", intel: "x64"
  sha256 arm: "a1bf6bf231a5b6e723deffebf72deb0e82c4b91ca1b9613f077d3204faec1dc4",
         intel: "c07c67b7f42556535e978fb32f7e52246104f86a4aa53f8cbfbf521d5ac4b981"

  url "https://github.com/gm-vm/openfortivpn-webview/releases/download/v#{version}-electron/openfortivpn-webview-#{version}-#{arch}.dmg"
  name "openfortivpn-webview"
  homepage "https://github.com/gm-vm/openfortivpn-webview"

  binary "#{staged_path}/openfortivpn-webview.app/Contents/MacOS/openfortivpn-webview"

  zap trash: [
    "~/Library/Application Support/openfortivpn-webview/"
  ]
end
