cask "chrysa" do
  version "0.9.0"
  sha256 "884aaf3f7f456bcdb94c242e9912277c617b4fa320b90d2f7f711cfa30558eb0"

  url "https://github.com/wooooci/Chrysa/releases/download/v#{version}/Chrysa-#{version}-macos-arm64.zip"
  name "Chrysa"
  desc "macOS (Apple Silicon) + CrossOver Windows game pipeline and launcher"
  homepage "https://github.com/wooooci/Chrysa"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Chrysa.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Chrysa.app"]
  end

  zap trash: [
    "~/Library/Application Support/Chrysa",
    "~/Library/Preferences/com.woooci.Chrysa.plist",
  ]
end
