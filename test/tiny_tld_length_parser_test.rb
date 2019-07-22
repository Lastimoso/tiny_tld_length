require "test_helper"

class TinyTldLength::ParserTest < Minitest::Test
  def setup
    @ttl = TinyTldLength::Parser.new
  end

  def test_tld_length_with_multiple_domains
    assert_equal 2, @ttl.tld_length('sub.domain.co.uk')
    assert_equal 2, @ttl.tld_length('domain.co.uk')
    assert_equal 2, @ttl.tld_length('sub.domain.com.ar')
    assert_equal 1, @ttl.tld_length('sub.domain.uk')
    assert_equal 1, @ttl.tld_length('sub.domain.com')
    assert_equal 1, @ttl.tld_length('sub1.sub2.domain.com')
  end

  def test_domain_with_multiple_domains
    assert_equal 'domain.co.uk', @ttl.domain('sub.domain.co.uk')
  end

  def test_subdomains_with_multiple_domains
    assert_equal ['sub'], @ttl.subdomains('sub.domain.co.uk')
    assert_equal ['sub1','sub2'], @ttl.subdomains('sub1.sub2.domain.co.uk')
  end

  def test_subdomain_with_multiple_domains
    assert_equal 'sub1', @ttl.subdomain('sub1.sub2.domain.co.uk')
  end


end
