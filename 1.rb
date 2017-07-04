require 'opendmm'
require 'open-uri'
require 'thread'

def adultvideo (fileurl)
    folder = File.dirname fileurl
    name = File.basename fileurl
    number = OpenDMM.search name
    if number == nil
        puts "找不到"
        else
        title = number[:title]
        code = number[:code]
        newfilename = code+' '+title
        name = folder +'/'+newfilename
        newfileurl = name + File.extname(fileurl)
        download = open(number[:cover_image])
        IO.copy_stream(download, name+'.png')
        puts code+' ' +title
        File.rename(fileurl,newfileurl)
    end
end

files = Dir["/tmp/*"]
f = File.new( "/tmp/file-name-bak.txt", "w" )

files.each do |file_name|
    if ! File.directory?(file_name)                                   #是否是一个文件
        #puts File.basename(file_name)
        adultvideo file_name
    end
        
end