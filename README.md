# Rodolfo Recipes

A list of recipes to use with [Rodolfo](https://github.com/initios/rodolfo)


## Usage

```bash
cat package_folder/data.json | rodolfo render recipe-path --save-to generated.pdf
```


## Prawn documentation

* [prawn](http://prawnpdf.org/manual.pdf)
* [prawn-table](http://prawnpdf.org/prawn-table-manual.pdf)


### Install requirements

```bash
bundle install --binstubs
```

### Run tests (will create a pdf for each report on spec/tmp)


```bash
# run all
rspec

# run single
rspec -e invoice
```


### Adding a Rodolfo Recipe

Create a folder with your username and add there your recipe.
Also to enable its tests add it to the end of recipes_spec like


describe 'username/recipename' do
  it_behaves_like 'a recipe'
end
