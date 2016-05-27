require "language/haskell"

class Hledger < Formula
  include Language::Haskell::Cabal

  desc "Command-line accounting tool"
  homepage "http://hledger.org"
  url "https://hackage.haskell.org/package/hledger-0.27.1/hledger-0.27.1.tar.gz"
  sha256 "f85b8d7ea7a2c7ef1ba1fa4645df951a7bf2f83e4117fdc34d9dacfa7d17376e"

  bottle do
    sha256 "4ac8dcbba6b0b6a4ec91f1c5b1074de2dd9320853b1846b2ed71d656ccb978c0" => :el_capitan
    sha256 "26c9b3192bb7f6669fb8169b962da114aead1bbee6d57f68f41481d48b8b86b7" => :yosemite
    sha256 "2b12d827cafcbbd2381f56b80afffee28b0f7f1c5e96e625746206696b37f95f" => :mavericks
  end

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package :using => ["happy"]
  end

  test do
    system "#{bin}/hledger", "test"
  end
end
