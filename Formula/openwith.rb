class Openwith < Formula
  desc "Utility to specify which application bundle should open specific file extensions"
  homepage "https://github.com/jdek/openwith"
  url "https://github.com/jdek/openwith/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "1b0976590c7f24255efe11caa0acd422b81378626325ec3aa8bbb0ded24a672b"
  license "Unlicense"

  def install
    ENV["PREFIX"] = prefix
    bin.mkpath
    system "make"
    system "make", "install"
  end

  test do
    assert_match "usage: openwith <bundle> [extension ...]", shell_output("#{bin}/openwith")
  end
end
