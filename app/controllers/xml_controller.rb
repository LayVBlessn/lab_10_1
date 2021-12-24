class XmlController < ApplicationController
  before_action :parse_params, only: :index

  def index
    result = proccessor @number

    respond_to do |format|
      format.html { render inline: result.to_s }
      format.xml { render xml: result.to_xml }
      format.rss { render xml: result.to_xml }
    end
  end

  protected

  def parse_params
    @number = params[:number].to_i
  end

  private

  def proccessor(number)
    result = []
    while number.to_s != number.to_s.reverse
      number = number.to_i + number.to_s.reverse.to_i
      result << number
    end
    result
  end

end
