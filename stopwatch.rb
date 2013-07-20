Shoes.app :title => "Stopwatch", :width => 300, :height => 150 do
  @seconds = 0
  @running = false

  stack do
    @time = banner "00:00:00", :align => "center"
    flow do
      @start = button "Start", :width => "33%"
      @pause = button "Pause", :width => "33%"
      @reset = button "Reset", :width => "33%"
    end
  end

  animate(1) do
    @seconds += 1 if @running
    replace_time
  end

  def replace_time
    @time.replace "%02d:%02d:%02d" % [
        @seconds / (60*60),
        @seconds / 60 % 60,
        @seconds % 60
    ]
  end

  @start.click { @running = true }
  @pause.click { @running = false }
  @reset.click do
    @running = false
    @seconds = 0
    replace
  end
end

#
# The MIT License (MIT)
#
# Copyright (c) {{year}} {{fullname}}
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
