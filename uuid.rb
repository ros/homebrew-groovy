require 'formula'

class Uuid < Formula
  homepage 'http://www.ossp.org/pkg/lib/uuid/'
  url 'ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz'
  mirror 'http://gnome-build-stage-1.googlecode.com/files/uuid-1.6.2.tar.gz'
  sha256 '11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0'

  option :universal
  option "32-bit"

  # see https://github.com/mxcl/homebrew/issues/16077
  # keg_only "OS X provides a uuid.h which conflicts with ossp-uuid's header."
  #GROOVY keg_only disabled for groovy

  def install
    if build.universal?
      ENV.universal_binary
    elsif build.build_32_bit?
      ENV.append 'CFLAGS', '-arch i386'
      ENV.append 'LDFLAGS', '-arch i386'
    end

    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--without-perl",
                          "--without-php",
                          "--without-pgsql"
    system "make"
    system "make install"
  end
end
