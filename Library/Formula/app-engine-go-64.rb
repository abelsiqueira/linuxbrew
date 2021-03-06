class AppEngineGo64 < Formula
  desc "Google App Engine SDK for Go (AMD64)"
  homepage "https://cloud.google.com/appengine/docs/go/"
  if OS.mac?
    url "https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_amd64-1.9.31.zip"
    sha256 "b57ffa0915a54bcb60e133ec5e8b5daff7314dd5591b9b8c6d7ae7354e16ba81"
  elsif OS.linux?
    url "https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.31.zip"
    sha256 "81f9e41b076414eb16495c0ed9b022321379c32363a6f22b6f7746db6b56b57d"
  end

  bottle :unneeded

  conflicts_with "app-engine-go-32",
    :because => "both install the same binaries"
  conflicts_with "app-engine-python",
    :because => "both install the same binaries"

  def install
    pkgshare.install Dir["*"]
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      bin.install_symlink pkgshare/fn
    end
  end

  test do
    assert_match(/^usage: goapp serve/, shell_output("#{bin}/goapp help serve").strip)
  end
end
