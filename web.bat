@ECHO OFF
SET RUBY_BIN=%C:\ruby\Ruby22-x64\bin%
SET PATH=%RUBY_BIN%;%PATH%
cd c:\github\shadoc-web
bundle exec ruby -Eutf-8 app.rb -o 0.0.0.0
pause