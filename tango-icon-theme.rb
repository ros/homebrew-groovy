require 'formula'

class TangoIconTheme < Formula
  homepage 'http://tango.freedesktop.org/'
  url 'http://pkgs.fedoraproject.org/repo/pkgs/tango-icon-theme/tango-icon-theme-0.8.90.tar.gz/0795895d2f20eddcbd2bffe94ed431a6/tango-icon-theme-0.8.90.tar.gz'
  sha1 'acdfbf3749885d36349263188334f6d6be405acc'

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
