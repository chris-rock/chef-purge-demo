file "#{ENV['HOME']}/x.txt" do
  content 'HELLO WORLD'
end

# uninstall chef
package "chef" do
  action :purge
end