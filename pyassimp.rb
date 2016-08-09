require 'formula'

class Pyassimp < Formula
  homepage 'http://assimp.sourceforge.net/'
  url 'http://sourceforge.net/projects/assimp/files/assimp-2.0/assimp--2.0.863-sdk.zip'
  sha256 'fc6b70ac5fc47e3cd973f0f010af411b70d1fce32380d9c2455acc137f8baa5d'

  depends_on :python => :recommended
  depends_on 'assimp'

  def patches
    DATA
  end

  def install
    temp_site_packages = lib/python.xy/'site-packages'

    args = [
      "--verbose",
      "install",
      "--install-scripts=#{bin}",
      "--install-lib=#{temp_site_packages}",
    ]

    # build the pyassimp libraries
    system python, "-s", "setup.py", *args
  end

  test do
    system python, "-c", "'import pyassimp'"
  end
end

__END__
diff --git a/setup.py b/setup.py
new file mode 100644
index 0000000..35834a2
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,19 @@
+from distutils.core import setup
+
+setup_data = dict(packages=['pyassimp', ],
+                  package_dir = {'pyassimp': 'port/PyAssimp/pyassimp'},
+                  name='PyAssimp',
+                  version='3.0.1264',
+                  author='ASSIMP Development Team',
+                  author_email='https://sourceforge.net/mailarchive/forum.php?forum_name=assimp-discussions',
+                  license='BSD (3-clause)',
+                  url='http://assimp.sf.net',
+                  description='Wrapper for ASSIMP at '
+                              'http://assimp.sourceforge.net',
+                  long_description='''\
+A wrapper for the Open Asset Import Library (ASSIMP).'''
+                  )
+
+if __name__ == '__main__':
+    setup(**setup_data)
+
