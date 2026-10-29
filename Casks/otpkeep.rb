# This file is written by OTPKeep's release workflow (scripts/release/homebrew-cask.sh). DO NOT EDIT.
cask "otpkeep" do
  version "0.2.1"
  sha256 "c934eb22f60f935827348b0d2b7a2fe78fcd3ba96b2fb9ff497bfdebda74d309"

  url "https://github.com/weikxs/otpkeep/releases/download/v#{version}/otpkeep_#{version}_darwin_universal.dmg"
  name "OTPKeep"
  desc "Private two-factor authenticator for the menu bar"
  homepage "https://github.com/weikxs/otpkeep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "OTPKeep.app"

  # The app is not signed by Apple (and will not be): without this, macOS refuses to open it the first time.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/OTPKeep.app"]
  end

  # No zap stanza: the accounts in ~/Library/Application Support/OTPKeep are never removed by Homebrew.
end
