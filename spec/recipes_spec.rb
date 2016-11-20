require 'pathname'

root_path = File.dirname __dir__
tmp_path = File.join(root_path, 'spec', 'tmp')
rodolfo = File.join(root_path, 'bin', 'rodolfo')

shared_examples 'a recipe' do
  subject(:recipe_path) do |e|
    example_group = e.metadata[:example_group]
    example_group[:parent_example_group][:description]
  end

  before do
    @data = File.join(recipe_path, 'data.json')
    @schema = File.join(recipe_path, 'schema.json')
    @template = File.join(recipe_path, 'template.rb')
  end

  it { expect(File.directory?(recipe_path)).to be true }
  it { expect(File.file?(@data)).to be true }
  it { expect(File.file?(@schema)).to be true }
  it { expect(File.file?(@template)).to be true }

  it 'creates a valid pdf file with example data' do
    output = `cat #{@data} | #{rodolfo} render #{recipe_path}`
    expect(output).to be_a_pdf

    name = recipe_path.tr('/', '_')
    puts name
    file_name = File.join(tmp_path, "#{name}.pdf")
    File.write(file_name, output)
  end
end

describe 'carlosgoce/helloworld' do
  it_behaves_like 'a recipe'
end
