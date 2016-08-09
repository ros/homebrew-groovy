require 'formula'

class TangoIconTheme < Formula
  homepage 'http://tango.freedesktop.org/'
  url 'http://pkgs.fedoraproject.org/repo/pkgs/tango-icon-theme/tango-icon-theme-0.8.90.tar.gz/0795895d2f20eddcbd2bffe94ed431a6/tango-icon-theme-0.8.90.tar.gz'
  sha256 '6e98d8032d57d818acc907ec47e6a718851ff251ae7c29aafb868743eb65c88e'

  depends_on 'automake' => :build
  depends_on 'gettext'
  depends_on 'icon-naming-utils'
  depends_on 'imagemagick'
  depends_on 'intltool' => :build
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "ls" "/usr/local/share/icons/Tango"
  end
end
