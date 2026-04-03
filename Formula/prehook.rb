class Prehook < Formula
  desc "Local Git hook security gates — stop secrets before they ship"
  homepage "https://github.com/arunsanna/prehook"
  url "https://github.com/arunsanna/prehook/archive/c761e70ffe42913db9362be3aa816e2429235cf5.tar.gz"
  version "0.0.1-dev"
  sha256 "fbce7939a64d96dc891c12d54d6c3500586e167ca9c794c5a104a1a23285a7c5"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prehook version")
  end
end
