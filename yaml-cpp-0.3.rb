require 'formula'

class YamlCpp03 < Formula
  homepage 'https://github.com/jbeder/yaml-cpp'
  url 'https://github.com/jbeder/yaml-cpp/archive/release-0.3.0.tar.gz'
  sha256 '2cd038b5a1583b6745e949e196fba525f6d0d5fd340566585fde24fc7e117b82'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
