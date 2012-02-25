require 'formula'

class Stow < Formula
  homepage 'http://www.gnu.org/software/stow/'
  url 'http://ftp.gnu.org/gnu/stow/stow-2.2.0.tar.gz'
  mirror 'http://ftpmirror.gnu.org/stow/stow-2.2.0.tar.gz'
  md5 '902564d502975f353d3b0514a21863b1'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}"
    system "make install"
  end
end
