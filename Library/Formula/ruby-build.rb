require 'formula'

class RubyBuild < Formula
  homepage 'https://github.com/sstephenson/ruby-build'
  url 'https://github.com/sstephenson/ruby-build/tarball/v20121022'
  sha1 '925b8eee613076f0b36bd9612a1dfb2abe03ff3f'

  head 'https://github.com/sstephenson/ruby-build.git'

  option "without-rbenv", "Don't install as an rbenv plugin"

  depends_on 'rbenv' unless build.include? 'without-rbenv'

  def install
    ENV['PREFIX'] = prefix
    system "./install.sh"

    rbenv_plugins = "#{HOMEBREW_PREFIX}/var/lib/rbenv/plugins"
    mkdir_p rbenv_plugins
    ln_sf opt_prefix, "#{rbenv_plugins}/#{name}" unless build.include? 'without-rbenv'
  end
end
