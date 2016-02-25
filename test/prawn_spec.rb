require File.join(File.expand_path(File.dirname(__FILE__)), "spec_helper")

describe 'fill form pdf with ruby' do

  def get_file_attrib
    Prawn::Document.generate 'data/output.pdf', template: 'data/template.pdf' do |pdf|
      @template_fields = pdf.acroform_fields
    end
    field_attr = Array.new
    @template_fields.each do |page, fields|
      fields.each_with_index do |field, i|
        i = i + 1
        value = send_data[:page_1][field.name].fetch(:value)
        attrib = {['field', '_', i].join.to_sym => {name: field.name, type: field.type, font_size: field.font_size, font_color: field.font_color, value: value}}
        field_attr.push(attrib)
      end
    end
    field_attr
  end

  def send_data
    data = {}
    data[:page_1] = {}
    data[:page_1][:name] = { :value => "Josue Merlos" }
    data[:page_1][:address] = {:value => "My address" }
    data[:page_1][:text_here] = {:value => "Red text is here"}
    data[:page_1][:more_text] = {:value => "Font size=10 is here"}
    data
  end

  def use_color
    return {
      red: "ff3333",
      black: "303638"
    }
  end

  it "Check for all fields in the template.pdf" do
    expect(get_file_attrib.length).to eq (4) #Identifica y cuenta los form del template
  end

  it "Check the name of each field in the template.pdf" do
    expect(get_file_attrib[0][:field_1][:name]).to eq(:name) #Get name of field #1 in template.pdf
    expect(get_file_attrib[1][:field_2][:name]).to eq(:address) #Get name of field #2 in template.pdf
    expect(get_file_attrib[2][:field_3][:name]).to eq(:text_here) #Get name of field #3 in template.pdf
    expect(get_file_attrib[3][:field_4][:name]).to eq(:more_text) #Get name of field #4 in template.pdf
  end

  it "Check the field_type of each field in the template.pdf" do
    expect(get_file_attrib[0][:field_1][:type]).to eq(:text) #Get type of field #1 in template.pdf
    expect(get_file_attrib[1][:field_2][:type]).to eq(:text) #Get type of field #2 in template.pdf
    expect(get_file_attrib[2][:field_3][:type]).to eq(:text) #Get type of field #3 in template.pdf
    expect(get_file_attrib[3][:field_4][:type]).to eq(:text) #Get type of field #4 in template.pdf
  end

  it "Check the font color of each field in the template.pdf" do
    expect(get_file_attrib[0][:field_1][:font_color]).to eq(use_color[:black]) #Get font_color of field #1 in template.pdf
    expect(get_file_attrib[1][:field_2][:font_color]).to eq(use_color[:black]) #Get font_color of field #2 in template.pdf
    expect(get_file_attrib[2][:field_3][:font_color]).to eq(use_color[:red]) #Get font_color of field #3 in template.pdf
    expect(get_file_attrib[3][:field_4][:font_color]).to eq(use_color[:black]) #Get font_color of field #4 in template.pdf
  end

  it "Check the font size of each field in the template.pdf" do
    expect(get_file_attrib[0][:field_1][:font_size]).to eq(16.0) #Get font_size of field #1 in template.pdf
    expect(get_file_attrib[1][:field_2][:font_size]).to eq(16.0) #Get font_size of field #2 in template.pdf
    expect(get_file_attrib[2][:field_3][:font_size]).to eq(16.0) #Get font_size of field #3 in template.pdf
    expect(get_file_attrib[3][:field_4][:font_size]).to eq(10.0) #Get font_size of field #4 in template.pdf
  end

  it "Check the value received by each field in the template.pdf" do
    expect(get_file_attrib[0][:field_1][:value]).to eq("Josue Merlos") #Get value with fill field #1 in template.pdf
    expect(get_file_attrib[1][:field_2][:value]).to eq("My address") #Get value with fill field #2 in template.pdf
    expect(get_file_attrib[2][:field_3][:value]).to eq("Red text is here") #Get value with fill field #3 in template.pdf
    expect(get_file_attrib[3][:field_4][:value]).to eq("Font size=10 is here") #Get value with fill field #4 in template.pdf
  end
end