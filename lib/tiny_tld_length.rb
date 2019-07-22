require "tiny_tld_length/version"
require 'open-uri'

module TinyTldLength
  class Parser
    attr_reader :parsed_list
    def initialize
      @parsed_list = List.new.call
    end

    def tld_length(host)
      match(host: host, list: parsed_list)
    end

    def domain(host)
      host.split('.').last(tld_length(host) + 1).join('.')
    end

    def subdomain(host)
      subdomains(host).first
    end

    def subdomains(host)
      host.split('.')[0..-(tld_length(host)+2)]
    end

    private

    def match(host:, list:)
      host_array = host.split('.').reverse
      length = 0
      result_array = list
      host_array.each do |t|
        break unless result_array.key? t
        length += 1
        result_array = result_array[t]
      end
      length
    end
  end

  class List
    attr_accessor :list_url, :list
    def initialize()
      @list_url = 'https://publicsuffix.org/list/public_suffix_list.dat'
      @list = {}
    end

    def call
      pepe
    end

    private
    def pepe
      open(list_url) do |f| 
        f.each_line do |line|
          line = line.strip
          next if line.start_with? '//'
          next if line.size == 0
          array = line.split('.') 
          tld = array.pop
          list[tld] = {} unless list.key? tld
          sld = array.pop
          list[tld][sld] = {} unless list[tld].key? sld
          next if array.empty?
          thirdld = array.pop
          list[tld][sld][thirdld] = {} unless thirdld.nil?
        end
      end
      list
    end
  end
end
