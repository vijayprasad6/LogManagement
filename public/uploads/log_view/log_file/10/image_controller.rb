class ImageController < ApplicationController
  def index

  	require 'chunky_png'

	#include ChunkyPNG::Color

	images = [
	ChunkyPNG::Image.from_file('./public/Base_Image.png'),
	ChunkyPNG::Image.from_file('./public/Drone_Capture2.png')
	]
	
	############ Start First ####################################
		# diff = []

		# images.first.height.times do |y|
		#   images.first.row(y).each_with_index do |pixel, x|
		#     diff << [x,y] unless pixel == images.last[x,y]
		#   end
		# end

		# @total = images.first.pixels.length
		# @pixel_changed = diff.length
		# @pixel_changed_percent = (diff.length.to_f / images.first.pixels.length) * 100
		
		# puts "pixels (total):     #{images.first.pixels.length}"
		# puts "pixels changed:     #{diff.length}"
		# puts "pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%"

		

		# x, y = diff.map{ |xy| xy[0] }, diff.map{ |xy| xy[1] }		

		# puts "XXXXXXXXXXXXXXXXX=#{x.inspect}"
		# puts "XXXXXXXXXXXXXXXXX=#{y.inspect}"

		# images.last.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0,255,0))
		# images.last.save('./public/diff6.png')

		
	####### First and Start of Second##############################

	output = ChunkyPNG::Image.new(images.first.width, images.last.width, ChunkyPNG::Color::WHITE)

	diff = []

	images.first.height.times do |y|
	  images.first.row(y).each_with_index do |pixel, x|
	    unless pixel == images.last[x,y]
	      score = Math.sqrt(
	        (ChunkyPNG::Color.r(images.last[x,y]) - ChunkyPNG::Color.r(pixel)) ** 2 +
	        (ChunkyPNG::Color.g(images.last[x,y]) - ChunkyPNG::Color.g(pixel)) ** 2 +
	        (ChunkyPNG::Color.b(images.last[x,y]) - ChunkyPNG::Color.b(pixel)) ** 2
	      ) / Math.sqrt(255 ** 2 * 3)

	      output[x,y] = ChunkyPNG::Color.grayscale(255 - (score * 255).round)
	      diff << score
	    end
	  end
	  end 
	 
	 puts "pixels (total):     #{images.first.pixels.length}"
	 puts "pixels changed:     #{diff.length}"
     puts "image changed (%): #{(diff.inject {|sum, value| sum + value} / images.first.pixels.length) * 100}%"
     
 	# x, y = output.map{ |xy| xy[0] }, output.map{ |xy| xy[1] }	
 	# images.last.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0,255,0))
	#images.last.save('./public/diff6.png')	
	output.save('public/diff.png')

	###########################################





	########## SECOND ###################

	
  end
end
