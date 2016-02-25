# ruby-fill-form: Fill Text and Images through Acroform Fields

## Install

```bash
$ gem install ruby-fillform
```

## Usage
Create a PDF form with LibreOffice or something else. I have only tested this with LibreOffice.
Currently only text fields, check box and buttons are supported.


```ruby
require 'ruby-fillform'

data = {}
data[:page_1] = {}
data[:page_1][:name] = { value: 'Josue Merlos' }
data[:page_1][:address] = { value: 'My Address' }

# Page number optional, substitute lastname var in all pages, thanks to hoverlover
data[:lastname] = { value: 'Merlos' }

# Create a PDF file with predefined data Fields
Prawn::Document.generate 'output.pdf', template: 'template.pdf'  do |pdf|
  pdf.fill_form_with(data)
end
```

Take a look in `examples` repo

https://github.com/JosueMerlos/ruby-fill-form-example.git

#And on a per-form basis

See the :options param below

```ruby
require 'ruby-fill-form'

data = {}
data[:page_1] = {}
data[:page_1][:name] = { value: 'Josue Merlos', options: {x_offset: 2, y_offset: -40} }
data[:page_1][:address] = { value: 'My Address' }

# Create a PDF file with predefined data Fields
Prawn::Document.generate 'output.pdf', template: 'template.pdf'  do |pdf|
  pdf.fill_form_with(data)
end
```
