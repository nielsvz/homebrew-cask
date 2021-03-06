cask "waltr-pro" do
  version "1.0.98"
  sha256 "23c4e87f6be1ed65896eef1c4d15c75ae33709f83b7ad86dfbfdb24c4761f450"

  url "https://shining.softorino.com/shine_uploads/waltrpromac_#{version}.dmg"
  name "WALTR PRO"
  desc "Media conversion and direct transfer tool for Apple devices"
  homepage "https://softorino.com/waltr/"

  livecheck do
    url "https://api.softorino.com/v1/app-manager/waltrpro/mac/updates"
    strategy :sparkle
  end

  app "WALTR PRO.app"

  zap trash: [
    "~/Library/Application Support/WALTR PRO",
    "~/Library/Preferences/com.softorino.waltrpro.plist",
    "/Users/Shared/WALTR PRO",
  ]
end
