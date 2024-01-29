cask "openfortivpn-webview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.4"
  sha256 arm:   "de7ce8c12b2e25b24185fdd63b0ab54bae5428bb833e158d22cea0ce8ce14ca7",
         intel: "ad8e819013b0869f3bb7c9732739efadb7eb36635dea88e8c1e52aadab47ed99"

  url "https://github.com/gm-vm/openfortivpn-webview/releases/download/v#{version}-electron/openfortivpn-webview-#{version}-#{arch}.dmg"
  name "openfortivpn-webview"
  homepage "https://github.com/gm-vm/openfortivpn-webview"

  wrapper_script = "#{staged_path}/openfortivpn-webview.sh"
  binary wrapper_script, target: "openfortivpn-webview"

  preflight do
    File.write wrapper_script, <<~EOS
      #!/bin/sh
      "#{staged_path}/openfortivpn-webview.app/Contents/MacOS/openfortivpn-webview" ""
    EOS
  end

  zap trash: "~/Library/Application Support/openfortivpn-webview/"
end
