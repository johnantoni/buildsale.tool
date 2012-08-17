#!/usr/bin/env ruby

require 'find'

class Sale
  
  attr_accessor :root_dir, :flash_sale, :sku_prefix, :start, :finish

  SALE_DIRS = ["Main Image", "Skinny Image"]
  SKU_DIRS = ["Main Image", "Other Images"]

  def initialize    
    @flash_sale = prompt nil, "Flash sale name :"
    @sku_prefix = prompt "SKU", "SKU prefix (default SKU) :"
    @start = prompt 1, "SKU start number (default 1) :"
    @finish = prompt 20, "SKU end number (default 20) :"
    
    if @flash_sale
      @root_dir = File.join("Flash Sales")
      mkdir(@root_dir) # make sure Flash Sale dir exists
      @flash_sale = File.join(@root_dir, @flash_sale)
      create_sale
    else
      puts "\nWOAH!!!\n\nplease enter a name for your sale"
    end
  end

  def create_sale
    mktree(@flash_sale, SALE_DIRS) # create flash sale dir
    (@start.to_i..@finish.to_i).each do |n|
      sku = File.join(@flash_sale, "#{@sku_prefix}#{n}".upcase)
      mktree(sku, SKU_DIRS)
    end
  end

  private

  # USE: user prompt for input
  def prompt(default, *args)
    print(*args)
    result = gets.strip
    return result.empty? ? default : result
  end

  # USE: creates dir if not exists
  def mkdir(path)
    if !FileTest.directory?(path)
      puts "creating #{path}"      
      Dir.mkdir(path)
    end
  end

  # USE: create dir & sub dirs
  def mktree(path, subdirs)
    mkdir(path)

    subdirs.each do |dir|
      mkdir(File.join(path, dir))
    end
  end

end


sale = Sale.new

