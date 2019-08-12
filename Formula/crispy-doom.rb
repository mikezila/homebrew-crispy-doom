class CrispyDoom < Formula
  desc "Crispy Doom is an enhanced Doom source port based on Chocolate Doom"
  homepage "https://github.com/fabiangreffrath/crispy-doom"
  url "https://github.com/fabiangreffrath/crispy-doom/archive/crispy-doom-5.6.tar.gz"
  sha256 "120c44f51078b2f0a487916a4a3a29f9cbbb863e8d73aa29df75ecd3761c9fc5"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2" => :build
  depends_on "sdl2_mixer" => :build
  depends_on "sdl2_net" => :build

  def install
    system "autoreconf", "-fiv"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # This is a game, but we can at least make sure all the pieces run well enough to display their versions.
    assert_equal "Crispy Doom 5.6.0", shell_output("#{bin}/crispy-doom --version").strip
    assert_equal "Crispy Doom 5.6.0", shell_output("#{bin}/crispy-server --version").strip
    assert_equal "Crispy Doom 5.6.0", shell_output("#{bin}/crispy-doom-setup --version").strip
  end
end
