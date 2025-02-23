cask "1password-beta" do
  version "7.8.7"
  sha256 "e3f39e32ef65b4bba96fcdbc9e467b13d66df9055c53319feb7cbfe5e2e6e328"

  url "https://c.1password.com/dist/1P/mac#{version.major}/1Password-#{version}.zip"
  name "1Password"
  desc "Password manager that keeps all passwords secure behind one password"
  homepage "https://1password.com/"

  livecheck do
    url "https://app-updates.agilebits.com/product_history/OPM#{version.major}"
    regex(%r{href=.*?/1Password[._-]?v?(\d+(?:\.\d+)*(?:[._-]BETA[._-]?\d*)?)\.pkg}i)
  end

  auto_updates true
  conflicts_with cask: "1password"
  depends_on macos: ">= :high_sierra"

  app "1Password #{version.major}.app"

  zap trash: [
    "~/Library/Application Scripts/2BUA8C4S2C.com.agilebits.onepassword-osx-helper",
    "~/Library/Containers/2BUA8C4S2C.com.agilebits.onepassword-osx-helper",
    "~/Library/Containers/com.agilebits.onepassword-osx",
    "~/Library/Group Containers/2BUA8C4S2C.com.agilebits",
  ]
end
