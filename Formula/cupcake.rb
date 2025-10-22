class Cupcake < Formula
  desc "Cytube chat recorder for daiseihai"
  homepage "https://github.com/Hamuko/cupcake"
  url "https://github.com/Hamuko/cupcake/archive/refs/tags/0.2.0.tar.gz"
  sha256 "d713f2480e5f48a0a2ebd1ebcb50d7c78e03b8fdf1586a99bdd65a30af99d874"
  license "Apache-2.0"
  head "https://github.com/Hamuko/cupcake.git", branch: "master"

  bottle do
    root_url "https://github.com/Hamuko/homebrew-util/releases/download/cupcake-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ce18fc626135e1f4c4af76aca53e66e15024dd113049d662da89a35579d20ed6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7255a936a52378dc5ce6125c3447aeffe0206b9143a3ace8bd66d23dd44f1b0"
  end

  depends_on "rust" => :build

  on_linux do
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # TODO: Make a proper functional test.
    assert_match "cupcake 0.2.0", shell_output("#{bin}/cupcake --version")
  end
end
