# meminbytes.rb
# Additional Facts for memory/swap usage in bytes
#
# Original file:
# Copyright (C) 2006 Mooter Media Ltd
# Author: Matthew Palmer <matt@solutionsfirst.com.au>
#
# Modifications by: Rutger Spiertz, Kumina BV
#
require 'thread'

{   :MemorySizeInMegaBytes => "MemTotal",
    :MemoryFreeInMegaBytes => "MemFree",
    :SwapSizeInMegaBytes   => "SwapTotal",
    :SwapFreeInMegaBytes   => "SwapFree"
}.each do |fact, name|
    Facter.add(fact) do
        confine :kernel => :linux
        setcode do
            meminfo_number(name)
        end
    end
end

def meminfo_number(tag)
    memsize = ""
    Thread::exclusive do
        size, scale = [0, ""]
        File.readlines("/proc/meminfo").each do |l|
            size, scale = [$1.to_f, $2] if l =~ /^#{tag}:\s+(\d+)\s+(\S+)/
            # MemoryFree == memfree + cached + buffers
            #  (assume scales are all the same as memfree)
            if tag == "MemFree" &&
                l =~ /^(?:Buffers|Cached):\s+(\d+)\s+(?:\S+)/
                size += $1.to_f
            end
        end
        varmemsize = scale_number(size, scale)
        oltpsize = 0.2*varmemsize.to_i
        memsize = oltpsize.to_i
    end

    memsize
end

def scale_number(size, multiplier)
    suffixes = ['', 'kB', 'MB', 'GB', 'TB']
    size *= 1 ** suffixes.index(multiplier)
    return "%.0f" % size
end
