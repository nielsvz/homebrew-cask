cask "openvisualtraceroute" do
  version "1.7.1"
  sha256 "bf57e3f85e1d9174f6e934174aa113b7fe8286a060e3d1d4ea357b76e4089f8f"

  url "https://downloads.sourceforge.net/openvisualtrace/#{version}/OpenVisualTraceRoute#{version}.dmg",
      verified: "downloads.sourceforge.net/openvisualtrace/"
  name "OpenVisualTraceroute"
  homepage "https://visualtraceroute.net/"

  livecheck do
    regex(/OpenVisualTraceRoute[._-]?v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  app "OpenVisualTraceroute.app"

  zap trash: "~/ovtr"

  caveats do
    depends_on_java "8"
  end
end
