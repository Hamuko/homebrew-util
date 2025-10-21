class Cupcake < Formula
  desc "Cytube chat recorder for daiseihai"
  homepage "https://github.com/Hamuko/cupcake"
  url "https://github.com/Hamuko/cupcake/archive/refs/tags/0.2.0.tar.gz"
  sha256 "d713f2480e5f48a0a2ebd1ebcb50d7c78e03b8fdf1586a99bdd65a30af99d874"
  license "Apache-2.0"
  head "https://github.com/Hamuko/cupcake.git", branch: "master"

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
